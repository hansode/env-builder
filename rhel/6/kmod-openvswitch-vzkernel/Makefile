all: prepare setup build install

prepare:
	./00_prepare-pkg.sh

setup: prepare
	arch=$(BUILD_ARCH) ./01_setup-base.sh

build: setup build-stamp

build-stamp:
	#MAKELEVEL= fakeroot ./02_build-rpm.sh
	arch=$(BUILD_ARCH) ./02_build-rpm.sh
	touch $@

install:
	arch=$(BUILD_ARCH) ./03_install-rpm.sh

clean:
	- rm build-stamp

.PHONY: all prepare setup build install clean
