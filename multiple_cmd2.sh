# 다중명령어 (multiple commands)


FILE=./readme
DIR=./dir

echo "test -e ${FILE} && echo \"when file exist, and then you can copy file.\""
test -e ${FILE} && echo "when file exist, and then you can copy file."

echo
echo

echo "test -d ${DIR} || echo \"when dir doesn't exist, and then you should make dir\""
test -d ${DIR} || echo "when dir doesn't exist, and then you should make dir"

echo
echo
