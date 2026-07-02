#!/bin/sh
#
# nand 불량 확인
# 어떤 파일이 변경되었는지 확인용도.
#

DIRS="/dvr /lib /usr/lib"


for var in $DIRS; do
	find ${var} -type f -exec md5sum {} \; | sort -k 2
done
