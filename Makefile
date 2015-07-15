#
# build kernerl 4.x
#
PWD=$(shell pwd)

KERNEL_VER=4.1.1
KERNEL_ARC=x86_64
KERNEL_CONFIG=$(PWD)/centos6_kernel-$(KERNEL_VER).config
KERNEL_URL=https://www.kernel.org/pub/linux/kernel/v4.x/linux-$(KERNEL_VER).tar.xz
BUILD_DIR=$(PWD)/build/linux-$(KERNEL_VER)
THREAD=1

all: build-kernel

build-kernel: setup
	cd $(PWD)/rpmbuild/SOURCES/ && test -f linux-$(KERNEL_VER).tar.xz || wget $(KERNEL_URL)
	cd $(PWD)/rpmbuild/SOURCES/ && test -d linux-$(KERNEL_VER) || tar xvf linux-$(KERNEL_VER).tar.xz
	cd $(PWD)/rpmbuild/SOURCES/linux-$(KERNEL_VER) && cp $(KERNEL_CONFIG) ./.config && make oldconfig && make -j$(THREAD) HOSTCXX="ccache g++" CC="ccache gcc" rpm
	mkdir $(BUILD_DIR) && mv $(PWD)/rpmbuild/RPMS/$(KERNEL_ARC)/kernel{,-devel,-headers}-$(KERNEL_VER)-?.$(KERNEL_ARC).rpm $(BUILD_DIR)/.

setup:
	mkdir -p $(PWD)/rpmbuild/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}

clean:
	-rm -rf $(BUILD_DIR)
	cd $(PWD)/rpmbuild/SOURCES/linux-$(KERNEL_VER) && make clean
