#
#
# user input
echo -n "Do you want to xxx (y/n)?"
read input

if [ "${input}" = "y" ]; then
	echo "Yes"
elif [ "${input}" = "n" ]; then
	echo "No"
else
	echo "others"
fi

echo

