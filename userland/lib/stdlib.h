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

#pragma once

#include <common/stdlib.h>
#include <stddef.h>
#include <stdnoreturn.h>

#define EXIT_SUCCESS 0
#define EXIT_FAILURE 1

#define RAND_MAX 2147483647

noreturn void exit(int status);
noreturn void abort(void);

void* malloc(size_t size);
void* aligned_alloc(size_t alignment, size_t size);
void* calloc(size_t num, size_t size);
void* realloc(void* ptr, size_t new_size);
void free(void* ptr);

char* getenv(const char* name);

int rand(void);
void srand(unsigned seed);
