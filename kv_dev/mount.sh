#
#       check NFS directory in /etc/exports
#

HOME=/home/ubuntu
MNT_DIR=/mnt/dev2
IPADDR=192.168.0.21

if [ ! -d ${MNT_DIR} ] ; then
	mkdir -p ${MNT_DIR}
fi

# ifconfig eth0 hw ether 00:09:1b:00:50:08
udhcpc -i eth0
mount -t nfs -o nolock ${IPADDR}:${HOME} ${MNT_DIR}

# mount -t nfs -o nolock 192.168.0.21:/home/ubuntu /mnt/dev7


