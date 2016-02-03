# kernel-{4,3}.x rpm build for CentOS6

## build rpm

rpms of kernel was created into `build/linux-{4,3}.x.y/`

- default kernel-4.1.1 for now

```
make
```

- build other kernel version

```
make KERNEL_VER=4.1.2
```

```
make KERNEL_VER=3.18.18
```

- Allow N jobs at once

```
make THREAD=12
```

- change kernel build parameters

```
make KERNEL_VER=4.4.1 KERNEL_BUILD_HOST=matsumoto-r.jp ¥
  KERNEL_BUILD_USER=matsumotory KERNEL_LOCAL_VER=.matsumotory
```

then, kernel build parameters were changed as the followings:

```
[vagrant@hoge ~]$ uname -r
4.4.1.matsumotory
[vagrant@hoge ~]$ dmesg | grep matsumotory
[    0.000000] Linux version 4.4.1.matsumotory (matsumotory@matsumoto-r.jp) (gcc version 4.4.7 20120313 (Red Hat 4.4.7-3) (GCC) ) #1 SMP Tue Feb 2 20:07:16 JST 2016
```

## LICENSE
under the MIT License:
- see LICENSE file

