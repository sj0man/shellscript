#
#

MNTDIR=/mnt/dev2
SHDIR=${MNTDIR}/mylab/shellscript/kv_dev

LOG_FILE=/var/log/message
LOG_LINK=var

BASHRC=${PWD}/bashrc
PROFILE=/etc/profile

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
	cat ${BASHRC} >> ${PROFILE}
fi





