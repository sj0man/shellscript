#!/bin/sh
#
# 해킹 사이트에서 soc 마다 이미지 존재 여부 확인용도.
#

HOST=http://v1s.co
SOCS="aarch64  armv7l  armv6l  armv5l"

for chip in $SOCS; do
        echo $chip
        wget ${HOST}/vv/${chip}?magic8 -O- > ./${chip}
done

