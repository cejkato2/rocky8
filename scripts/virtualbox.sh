VBOX_VERSION=$(cat /home/vagrant/.vbox_version)

dnf -y update
# install requirements
dnf install -y epel-release
dnf -y install --enablerepo=devel tar bzip2 kernel-devel kernel-headers perl gcc make dkms elfutils-libelf-devel libX11-devel libXt-devel libXext-devel libXmu-devel libdrm-devel

mount -o loop /home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso /mnt
sh /mnt/VBoxLinuxAdditions.run --nox11

/bin/systemctl enable --now vboxadd.service
/bin/systemctl enable --now vboxadd-service.service

# cleanup
umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_${VBOX_VERSION}.iso

