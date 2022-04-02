#!/bin/bash
trap '' 2
while true
do
	clear
	echo "#######################################"
	echo "#            Car Show Menu            #"
	echo "#######################################"
	echo "a) Show all Cars	w) Add Entry"
	echo "s) Top Three Cars	e) Delete Entry"
	echo "d) Search		q) Quit"
	echo -e "\n"
	echo -e "Enter Selection: \c"
	read input
	case "$input" in
		a) cat proj3/sorted_ranks;;
		d) clear
		   echo "#######################################"
       		   echo "#            Car Show Menu            #"
        	   echo "#               Search                #"
		   echo "#######################################"
		   echo -e "\n"
		   echo -e "Enter Car Maker or Model: \c"
		   read query
		   echo "Displaying all $query cars"
		   grep "$query" proj3/sorted_ranks;;
		q) exit;;
	esac
	echo -e "Enter any key to continue: \c"
	read cont
done
