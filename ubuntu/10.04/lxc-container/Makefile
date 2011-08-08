ARCH=`./helper/detect-arch.sh`

all:
	./01_setup-base.sh

lucid:
	lxc-ls | grep -w $@-$(ARCH) || \
	time sudo lxc-create -n $@-$(ARCH) -t $@ -f network.conf
	sudo chroot /var/lib/lxc/$@-$(ARCH)/rootfs apt-get clean

lucid.raw: lucid
	mount | grep mnt_$@ && sudo umount mnt_$@ || :
	[ -f ubuntu-10.04_without-metadata_lxc_$(ARCH).raw ] || \
	dd if=/dev/zero of=ubuntu-10.04_without-metadata_lxc_$(ARCH).raw bs=1M count=220
	yes | mkfs.ext4 ubuntu-10.04_without-metadata_lxc_$(ARCH).raw
	[ -d mnt_$@ ] || mkdir mnt_$@
	sudo mount -o loop ubuntu-10.04_without-metadata_lxc_$(ARCH).raw ./mnt_$@/
	sudo rsync -avx /var/lib/lxc/lucid-$(ARCH)/rootfs/ ./mnt_$@/
	sudo umount mnt_$@
	rmdir mnt_$@

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
