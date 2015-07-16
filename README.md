# kernel-4.x rpm build for CentOS6

## build rpm

rpms of kernel was created into build/linux-4.x.y/

- default kernel-4.1.1 for now

```
make
```

- build other 4.x.y version

```
cp -p centos6_kernel-4.1.1.config centos6_kernel-4.x.y.config
make KERNEL_VER=4.x.y
```

- Allow N jobs at once

```
make THREAD=12
```
## LICENSE
under the MIT License:
- see LICENSE file

