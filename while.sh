#
#
COUNT=1
MAXIMUM=10


while [ ${COUNT} -lt ${MAXIMUM} ];
do
	echo -n "."
	sleep 1
	COUNT=$(echo "$COUNT + 1" | bc)
done
echo "."
echo
