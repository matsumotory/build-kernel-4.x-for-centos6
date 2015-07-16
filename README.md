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

## LICENSE
under the MIT License:
- see LICENSE file

