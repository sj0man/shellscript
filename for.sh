# Desc: Script to rename files from ep1 to ep2
#
for var in `ls ep1*`; do
	echo cp ${var} ${var//ep1/ep2}
done
