all: prepare setup build install

prepare:
	./00_prepare-pkg.sh

setup: prepare
	arch=$(BUILD_ARCH) ./01_setup-base.sh

build: setup
	#MAKELEVEL= fakeroot ./02_build-rpm.sh
	# cannot use fakeroot to build rpm.
	sudo arch=$(BUILD_ARCH) ./02_build-rpm.sh

install:
	sudo arch=$(BUILD_ARCH) ./03_install-rpm.sh
