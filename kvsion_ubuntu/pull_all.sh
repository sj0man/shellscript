DIRS="aries canis gemini onvifcpplib qt-4.8.7 vela virgo"



for DIR in ${DIRS} ; do
        echo ${DIR}
        cd ${DIR} ; git pull; cd ..
done

