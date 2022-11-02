#!/bin/sh

sh ./return0.sh && echo "	ret0 && "
sh ./return1.sh && echo "	ret1 && "

sh ./return0.sh || echo "	ret0 ||"
sh ./return1.sh || echo "	ret1 ||"

exit 0
