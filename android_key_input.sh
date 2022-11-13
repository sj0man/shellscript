# shell script be careful of the definition of variable ${aaaa}
#
#
KEYPAD_SWITCH_MAIN_PIP=23
KEYPAD_SIZE_UP=186
KEYPAD_SIZE_DOWN=183
KEYPAD_MAIN_CH_UP=166
KEYPAD_MAIN_CH_DOWN=167
KEYPAD_PIP_CH_UP=19
KEYPAD_PIP_CH_DOWN=20
KEYPAD_PIP_MOVE_LEFT=21
KEYPAD_PIP_MOVE_RIGHT=22

AKEYCODE_PROG_GREEN=184
AKEYCODE_DPAD_UP=19


DURATION=15

while true
do

echo `date +"%F %T"`: channel 174
input keyevent KEYCODE_1 ; input keyevent KEYCODE_7; input keyevent KEYCODE_4
sleep $DURATION

echo `date +"%F %T"`: channel 3
input keyevent KEYCODE_3 ; input keyevent KEYCODE_ENTER
sleep $DURATION

echo `date +"%F %T"`: channel 97
input keyevent KEYCODE_9 ; input keyevent KEYCODE_7; input keyevent KEYCODE_ENTER
sleep $DURATION

echo `date +"%F %T"`: channel 11
input keyevent KEYCODE_1 ; input keyevent KEYCODE_1; input keyevent KEYCODE_ENTER
sleep $DURATION

echo `date +"%F %T"`: channel 109
input keyevent KEYCODE_1 ; input keyevent KEYCODE_0; input keyevent KEYCODE_9
sleep $DURATION

echo `date +"%F %T"`: channel 999
input keyevent KEYCODE_9 ; input keyevent KEYCODE_9; input keyevent KEYCODE_9
sleep $DURATION

DURATION=$(echo "$DURATION + 1" | bc)
if [ ${DURATION} -gt 30 ]; then
	DURATION=15
fi

echo Duration: $DURATION

done
