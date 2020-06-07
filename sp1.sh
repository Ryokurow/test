#!/usr/bin/env bash
echo -e "Directed by Ashimov Aslan\nCreating isoimage"

while [[ $choice != 2 ]]
do
	echo -e "\nchoose the action:\n\t 1 - create a new cd-dick image\n\t 2 - exit "
	read choice

	if [[ $choice = 1 ]]
	then
		while [[ $dir = "" ]]
		do
			echo -e "\nPlease write full directory path:"
			read dir
			if [[ $dir = "" ]]
			then
				echo -e "\t\t!!! Directory cant be empty !!!"
			else
				if ! [[ -d $dir ]]
				then
					echo -e "\n This path incorrect! \nTry again"
					dir=""
				fi
			fi
		done
		while [[ $name = "" ]]
		do
			echo -e "\nWrite image name"
			read name
			if [[ $name = "" ]]
			then
				echo -e "\t Name cant be empty!"
			else
				echo ""
			fi
		done
		if [ -e $name".iso" ]
		then
			tmp=$name"_"$(date +%Y.%m.%d)".iso"
			genisoimage -o $tmp $dir
		else
			
			genisoimage -o $name".iso" $dir
			tmp=$name".iso"
		fi
		echo -e "\nImage"$tmp" successfully created.\n"
		echo "Contine?"
		dir=""
		name=""
	else
		if [[ $choice != 2 ]]
		then
			echo -e "\t\t!!! Cant understand what to do please try again!!!\n"
		fi
	fi
done
exit 0
