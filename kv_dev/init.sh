#
MNTDIR=/mnt/dev7
SHDIR=${MNTDIR}/mylab/shellscript/kv_dev

LOG_FILE=/var/log/message
LOG_LINK=var

BASHRC=${PWD}/bashrc
PROFILE=/etc/profile
RK3588_BASHRC=/etc/bash.bashrc

HOME=/home/ubuntu
IPADDR=192.168.0.4

if [ ! -d ${MNTDIR} ] ; then
        mkdir -p ${MNTDIR}
fi

NODENAME=`uname -n`
if [ "$NODENAME" = "RK3588" ] || [ "$NODENAME" = "rk3588-buildroot" ]; then
	echo "RK3588"
else
	udhcpc -i eth0
fi

mount -t nfs -o nolock ${IPADDR}:${HOME} ${MNTDIR}

if [ ! -d $SHDIR ] ; then
	echo need to mount
	echo
	exit
fi

if [ -d ${SHDIR} ] ; then
    cp -v ${SHDIR}/* ${PWD}
fi

if [ ! -f ${LOG_LINK} ] ; then
    ln -sv ${LOG_FILE} ${LOG_LINK}
fi

if [ -e ${BASHRC} ] && [ -e ${PROFILE} ] ; then
	if [ "$NODENAME" = "rk3588-buildroot" ]; then
		cat ${BASHRC} >> $RK3588_BASHRC
	else
		cat ${BASHRC} >> ${PROFILE}
	fi
fi



