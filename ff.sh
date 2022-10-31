# 별표를 인자로 주기 위해서는 따옴표로 묶어야 한다.
#   $ sh ff.sh "f*"
#
FILES=$1
if [ "${FILES}" = "" ]
then
	echo Usage: $0 name
fi

find . -name "${FILES}" -print 2> /dev/null
# debugging
# echo find . -name "${FILES}" -print

exit 0
