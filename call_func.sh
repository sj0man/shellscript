#!/bin/sh
#

funcA() {
	echo "funcA"
}

echo --
funcA
echo --

# 난수발생은 명령줄에서 동작하지만 스크립트에서 동작하지 않음.
#
echo random number is $RANDOM.

