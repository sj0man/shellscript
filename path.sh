# 현재 디렉토리를 읽어서 마지막 두개의 디렉토리를 지움
#

DEVROOT=`echo $PWD | sed -e 's/\/\w*\/\w*$//g'`

echo $PWD
echo $DEVROOT
