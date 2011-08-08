ARCH=`./helper/detect-arch.sh`

all:
	./01_setup-base.sh

lucid:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf
	sudo chroot /var/lib/lxc/$@-$(ARCH)/rootfs apt-get clean

maverick:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf
	sudo chroot /var/lib/lxc/$@-$(ARCH)/rootfs apt-get clean

natty:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf
	sudo chroot /var/lib/lxc/$@-$(ARCH)/rootfs apt-get clean

fedora:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf

centos:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf

busybox:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf

sshd:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf
