all: prepare setup build install

prepare:
	./00_prepare-pkg.sh

setup: prepare
	arch=$(BUILD_ARCH) ./01_setup-base.sh

build: setup
	arch=$(BUILD_ARCH) ./02_build-rpm.sh

install: build
	arch=$(BUILD_ARCH) ./03_install-rpm.sh
