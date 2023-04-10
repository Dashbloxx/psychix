/*
 *  .OOOOOO.   OOOO                                .    O8O              
 *  D8P'  `Y8B  `888                              .O8    `"'              
 * 888           888 .OO.    .OOOO.    .OOOOO.  .O888OO OOOO  OOOO    OOO 
 * 888           888P"Y88B  `P  )88B  D88' `88B   888   `888   `88B..8P'  
 * 888           888   888   .OP"888  888   888   888    888     Y888'    
 * `88B    OOO   888   888  D8(  888  888   888   888 .  888   .O8"'88B   
 *  `Y8BOOD8P'  O888O O888O `Y888""8O `Y8BOD8P'   "888" O888O O88'   888O 
 * 
 *  Chaotix is a UNIX-like operating system that consists of a kernel written in C and
 *  i?86 assembly, and userland binaries written in C.
 *     
 *  Copyright (c) 2023 Nexuss
 *  Copyright (c) 2022 mosm
 *  Copyright (c) 2006-2018 Frans Kaashoek, Robert Morris, Russ Cox, Massachusetts Institute of Technology
 *
 *  This file may or may not contain code from https://github.com/mosmeh/yagura, and/or
 *  https://github.com/mit-pdos/xv6-public. Both projects have the same license as this
 *  project, and the license can be seen below:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 */

#include "console.h"
#include "kernel/panic.h"
#include <kernel/api/fcntl.h>
#include <kernel/api/sys/sysmacros.h>
#include <kernel/fs/fs.h>
#include <kernel/memory/memory.h>

static file_description* active_console = NULL;

void system_console_init(void) {
    active_console = vfs_open("/dev/tty", O_RDWR, 0);
    if (IS_OK(active_console))
        return;

    active_console = vfs_open("/dev/ttyS0", O_RDWR, 0);
    if (IS_OK(active_console))
        return;

    UNIMPLEMENTED();
}

static ssize_t system_console_device_read(file_description* desc, void* buffer, size_t count) {
    (void)desc;
    return file_description_read(active_console, buffer, count);
}

static ssize_t system_console_device_write(file_description* desc, const void* buffer, size_t count) {
    (void)desc;
    return file_description_write(active_console, buffer, count);
}

static int system_console_device_ioctl(file_description* desc, int request, void* argp) {
    (void)desc;
    return file_description_ioctl(active_console, request, argp);
}

struct inode* system_console_device_create(void) {
    struct inode* inode = kmalloc(sizeof(struct inode));
    if (!inode)
        return ERR_PTR(-ENOMEM);

    static file_ops fops = {
        .read = system_console_device_read,
        .write = system_console_device_write,
        .ioctl = system_console_device_ioctl,
    };
    *inode = (struct inode){.fops = &fops,
                            .mode = S_IFCHR,
                            .device_id = makedev(5, 1),
                            .ref_count = 1};
    return inode;
}
