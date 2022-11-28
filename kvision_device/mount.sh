#
#       check NFS directory in /etc/exports
#


# ifconfig eth0 hw ether 00:09:1b:00:50:08
udhcpc -i eth0
mount -t nfs -o nolock 192.168.0.21:/home/ubuntu/ /mnt/dev2

