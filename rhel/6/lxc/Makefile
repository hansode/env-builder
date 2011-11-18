all: prepare setup build install

prepare:
	./00_prepare-pkg.sh

setup: prepare
	./01_setup-base.sh

build: setup
	#MAKELEVEL= fakeroot ./02_build-rpm.sh
	# cannot use fakeroot to build rpm.
	sudo ./02_build-rpm.sh

install:
	sudo ./03_install-rpm.sh
