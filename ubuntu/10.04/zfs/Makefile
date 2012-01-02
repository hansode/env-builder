all: prepare setup

prepare:
	./00_prepare-pkg.sh
	
setup:
	./01_setup-base.sh

test: test-zvol

test-zvol:
	./02_create-zvol.sh
