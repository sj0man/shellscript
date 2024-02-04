#!/bin/bash

if [ $# -ne 2 ]
then
	echo "Usage: $0 <old_string> <new_string>"
	exit 1
fi

for i in `ls`
do
	NEWFILE=`echo $i | sed -e "s/$1/$2/g"`
	if [ "${i}" = "${NEWFILE}" ]
	then
		continue
	fi
	mv ${i} ${NEWFILE}
done
