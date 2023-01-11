LOG_FILE=/var/log/message
LOG_LINK=var
CPLIB=cplib.sh
LIBDAL=libdal.sh

if [ ! -f ${LOG_LINK} ] ; then
    ln -s ${LOG_FILE} ${LOG_LINK}
fi

if [ ! -f ${LIBDAL} ] ; then
    ln -s ${CPLIB} ${LIBDAL}
fi

