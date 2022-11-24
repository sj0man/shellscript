DIRS="aquila aries canis gemini onvifcpplib qt-4.8.7 vela virgo"

for DIR in ${DIRS} ; do
	echo ========== ${DIR} ==========
	if [ -d ${DIR} ]; then
		cd ${DIR} ; git pull; cd ..
	fi
	echo
done

