# 스크립트 실행할 때, 인자가 없으면 기본값으로 대체
#
NUM=$1
if [ "${NUM}" = "" ]; then
	NUM=000
fi

echo ${NUM}

