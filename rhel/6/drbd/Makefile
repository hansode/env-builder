all: prepare setup build install

prepare:
	./00_prepare-pkg.sh

setup:
	./01_setup-base.sh

build:
	MAKELEVEL= fakeroot ./02_build-rpm.sh

install:
	./03_install-rpm.sh
