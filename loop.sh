FILES="a.c b.c c.c d.c"

for FILE in ${FILES} ; do
    echo ${FILE}
done


#
#
for var in `ls *.sh`; do
	echo ${var}	
done