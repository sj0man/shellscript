# 마운트 확인 필요
# 백업 스크립트는 별도로 만들자
#
OPTION=$1
MNTCDIR=/mnt/einsteincho/output


if [ ! -d ${MNTCDIR} ]; then
	echo need to mount...
	exit -1
fi

if [ "${OPTION}" = "org" ]; then
	echo backup
	cp /dvr/upgrade								/dvr/upgrade-org
	cp /usr/lib/libdal.so						/usr/lib/libdal.so-org
	cp /usr/ilb/libBasicUsageEnvironment.so.0	/usr/ilb/libBasicUsageEnvironment.so.0-org
	cp /usr/ilb/libgroupsock.so.4				/usr/ilb/libgroupsock.so.4-org
	cp /usr/ilb/libliveMedia.so.38				/usr/ilb/libliveMedia.so.38-org
	cp /usr/ilb/libUsageEnvironment.so.2		/usr/ilb/libUsageEnvironment.so.2-org
fi

cp -v /mnt/einsteincho/output/upgrade-canis-nt9831x		/dvr/upgrade
cp -v /mnt/einsteincho/output/libdal-canis-nt9831x.so	/usr/lib/libdal.so
cp -v /mnt/einsteincho/output/onvif/* 					/usr/lib

