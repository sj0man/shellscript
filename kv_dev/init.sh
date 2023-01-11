MNTDIR=/mnt/dev2
SHDIR=${MNTDIR}/mylab/shellscript/kv_dev

LOG_FILE=/var/log/message
LOG_LINK=var

CPLIB=cplib.sh
LIBDAL=libdal.sh

if [ -d ${SHDIR} ] ; then
    cp -v ${SHDIR}/* ${PWD}
fi

if [ ! -f ${LOG_LINK} ] ; then
    ln -sv ${LOG_FILE} ${LOG_LINK}
fi

if [ ! -f ${LIBDAL} ] ; then
    ln -sv ${CPLIB} ${LIBDAL}
fi

