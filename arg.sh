# 스크립트 실행할 때, 인자가 없으면 기본값으로 대체
#
NUM=$1
if [ "${NUM}" = "" ]; then
	NUM=000
fi

echo ${NUM}

# 파일명을 인자로 받았을때, 파일이 없으면 에러 출력
#
# FILE=$1

# if [ "${FILE}" == "" ]; then
#   echo "Syntax: $0 File"
#   exit
# fi

# if [ ! -e ${FILE} ]; then
# 	echo "ERROR: File not found."
# 	exit
# fi


