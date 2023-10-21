#
#
# user input
read -p "Do you want to xxx (y/n)?" answer

if [ "${answer}" = "y" ]; then
	echo "Yes"
elif [ "${answer}" = "n" ]; then
	echo "No"
else
	echo "others"
fi

echo

