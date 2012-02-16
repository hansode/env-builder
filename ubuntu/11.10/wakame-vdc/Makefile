all: prepare setup

prepare:
	./00_prepare-pkg.sh

setup:
	./01_setup-base.sh
	./02_add-account.sh*
	./03_configure-network.sh*
	./04_setup-wakame.sh*
	./05_configure-system.sh*

init:
	./06_init-wakame.sh
