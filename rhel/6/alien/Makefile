all: prepare setup build install

prepare:
	./00_prepare-pkg.sh

setup: prepare
	./01_setup-base.sh

build: setup
	./02_build-rpm.sh

install:
	./03_install-rpm.sh
