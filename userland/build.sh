#!/bin/bash

# Build core programs and libc

if [ "$ARCH" == "i386" ]
then
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/cal.o core/cal.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o ../common/math.o ../common/math.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o ../common/string.o ../common/string.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o ../common/strings.o ../common/strings.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o ../common/stdio.o ../common/stdio.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o ../common/stdlib.o ../common/stdlib.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o ../common/endian.o ../common/endian.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/endian.o lib/endian.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/crt0.o lib/crt0.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/dirent.o lib/dirent.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/errno.o lib/errno.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/panic.o lib/panic.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/stdio.o lib/stdio.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/stdlib.o lib/stdlib.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/string.o lib/string.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/syscall.o lib/syscall.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/time.o lib/time.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o lib/unistd.o lib/unistd.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/cat.o core/cat.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/clear.o core/clear.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/cp.o core/cp.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/date.o core/date.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/echo.o core/echo.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/env.o core/env.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/fib.o core/fib.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/halt.o core/halt.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/imgview.o core/imgview.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/init.o core/init.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/getfb.o core/getfb.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/init-test.o core/init-test.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/kill.o core/kill.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/ln.o core/ln.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/ls.o core/ls.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/mandelbrot.o core/mandelbrot.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/mkdir.o core/mkdir.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/mouse-cursor.o core/mouse-cursor.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/mv.o core/mv.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/poweroff.o core/poweroff.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/ps.o core/ps.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/pwd.o core/pwd.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/reboot.o core/reboot.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/rm.o core/rm.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/rmdir.o core/rmdir.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/run-tests.o core/run-tests.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/sh.o core/sh.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/sleep.o core/sleep.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/touch.o core/touch.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/wc.o core/wc.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/xv6-usertests.o core/xv6-usertests.c
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -MMD -DARCH=i386 -MP -c -o core/fetch.o core/fetch.c
    ar rcs libc.a ../common/math.o ../common/string.o ../common/strings.o ../common/endian.o ../common/stdio.o ../common/stdlib.o lib/crt0.o lib/dirent.o lib/errno.o lib/panic.o lib/stdio.o lib/stdlib.o lib/endian.o lib/string.o lib/syscall.o lib/time.o lib/unistd.o

    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/cal core/cal.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/cat core/cat.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/clear core/clear.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/cp core/cp.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/date core/date.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/echo core/echo.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/env core/env.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/fib core/fib.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/halt core/halt.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/imgview core/imgview.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/init core/init.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/getfb core/getfb.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/init-test core/init-test.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/kill core/kill.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/ln core/ln.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/ls core/ls.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/mandelbrot core/mandelbrot.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/mkdir core/mkdir.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/mouse-cursor core/mouse-cursor.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/mv core/mv.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/poweroff core/poweroff.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/ps core/ps.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/pwd core/pwd.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/reboot core/reboot.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/rm core/rm.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/rmdir core/rmdir.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/run-tests core/run-tests.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/sh core/sh.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/sleep core/sleep.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/touch core/touch.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/wc core/wc.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/xv6-usertests core/xv6-usertests.o -lc
    cc -std=c11 -m32 -static -nostdlib -ffreestanding -U_FORTIFY_SOURCE -Wall -Wextra -pedantic -O2 -g -isystemlib -isystem.. -isystem../common -isystem../kernel/api -L. -DARCH=i386 -o ../base/bin/fetch core/fetch.o -lc
fi