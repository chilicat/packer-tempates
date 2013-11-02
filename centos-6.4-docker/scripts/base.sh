#!/bin/bash
# Base install
function die()  {
   echo "[ERROR] $1"
   exit 1
}

sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
sed -i s/^SELINUX=.*/SELINUX=disabled/g /etc/selinux/config  || die "Cannot adapt SELINUX"

echo "Install build tools."
yum -y install gcc make gcc-c++ zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils

echo "Setup docker init.d script:"
curl -o /etc/init.d/docker https://gist.github.com/chilicat/7263963/raw/01b3e8c239755dc624fd333a5beed4352488664d/vagrant-docker
chmod +x /etc/init.d/docker 
chkconfig docker on

echo "enable ip forwarding"
sysctl -w net.ipv4.ip_forward=1

# Make ssh faster by not waiting on DNS
echo "UseDNS no" >> /etc/ssh/sshd_config