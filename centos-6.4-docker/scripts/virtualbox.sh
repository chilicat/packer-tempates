# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /home/vagrant/.vbox_version)
cd /tmp
mount -o loop /home/vagrant/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt

export KERN_DIR=/usr/src/kernels/3.10.5-3.el6.x86_64/
sh /mnt/VBoxLinuxAdditions.run --nox11 

umount /mnt
rm -rf /home/vagrant/VBoxGuestAdditions_*.iso

