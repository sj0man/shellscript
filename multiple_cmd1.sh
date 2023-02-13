# 다중명령어 (multiple commands)
#!/bin/sh


echo "echo -n a ; echo b"
echo -n a ; echo b
echo

# result
# true && run
# false || run
#
/bin/true  && echo "true && run"
/bin/false || echo "false || run"

echo


# result is nothing
#
/bin/true  || echo "true || run"
/bin/false && echo "false && run"



exit 0
