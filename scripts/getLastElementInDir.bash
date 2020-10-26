declare -a elements
elements=($HOME/*)
position=$(( ${#elements[*]} ))
last=${elements[$position]}

for ELEMENT in "${elements[@]}" ; do
	if [[ $DIR == $last ]] then
		echo "$ELEMENT is the last"
		break
	else
		echo "$ELEMENT"
        fi
done
