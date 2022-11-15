#!/bin/sh
#

# "/bin/sh -> dash" Bourne shell은 dash 링크 되어있고, RANDOM 환경변수 값이 없음
# /bin/bash (Bourne Again SHell)에서는 RANDOM 환경변수 값이 지정됨
#

RANDOM=`tr -cd "[:digit:]" < /dev/urandom | head -c 6`
echo random number: ${RANDOM}

radomKeyevent() {

	randomKey=$(echo "${RANDOM} % 10" | bc)

	case $randomKey in
		0) echo 0 ;;
		1) echo 1 ;;
		2) echo 2 ;;
		3) echo 3 ;;
		4) echo 4 ;;
		5) echo 5 ;;
		6) echo 6 ;;
		7) echo 7 ;;
		8) echo 8 ;;
		9) echo 9 ;;
	esac
}

radomKeyevent
exit 0
