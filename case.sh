KEYPAD_SWITCH_MAIN_PIP=23
KEYPAD_SIZE_UP=186
KEYPAD_SIZE_DOWN=183
KEYPAD_MAIN_CH_UP=166
KEYPAD_MAIN_CH_DOWN=167
KEYPAD_PIP_CH_UP=19
KEYPAD_PIP_CH_DOWN=20
KEYPAD_PIP_MOVE_LEFT=21
KEYPAD_PIP_MOVE_RIGHT=22

radomKeyevent() {

    # syntax error ??
    #
	randomKey=$(echo "${RANDOM} % 9" | bc)

	case $randomKey in
		0) echo keyevent $KEYPAD_SWITCH_MAIN_PIP  ;;
		1) echo keyevent $KEYPAD_SIZE_UP  ;;
		2) echo keyevent $KEYPAD_SIZE_DOWN  ;;
		3) echo keyevent $KEYPAD_MAIN_CH_UP  ;;
		4) echo keyevent $KEYPAD_MAIN_CH_DOWN  ;;
		5) echo keyevent $KEYPAD_PIP_CH_UP  ;;
		6) echo keyevent $KEYPAD_PIP_CH_DOWN  ;;
		7) echo keyevent $KEYPAD_PIP_MOVE_LEFT  ;;
		8) echo keyevent $KEYPAD_PIP_MOVE_RIGHT  ;;	  
	esac
}


radomKeyevent
exit


while true
do
	radomKeyevent
	sleep 1
done
