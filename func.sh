LIST="aa bb cc dd ee ff"
unset MENU_CHOICES

function add_menu()
{
    local param=$1
    local c
    for c in ${MENU_CHOICES[@]} ; do
        if [ "param" = "c" ] ; then
            return
        fi
    done
    MENU_CHOICES=(${MENU_CHOICES[@]} $param)    
}


for choice in ${LIST} ; do
    add_menu $choice
done

for item in ${MENU_CHOICES[@]} ; do
    echo $item
done

