#!/bin/bash

###Functions###

# menuDisplay: displays car show menu
# Input: Null
# Output: Null
menuDisplay(){
        clear
        echo "#######################################"
        echo "#            Car Show Menu            #"
        echo "#######################################"
        echo "a) Show all Cars"
        echo "s) Top Three Cars"
        echo "d) Class Score"
	echo "w) Add Entry n\a"
	echo "e) Delete Entry n\a"
	echo "q) Quit"
        echo -e "\n"
        echo -e "Enter Selection: \c"
}

# classMenuDisplay: displays sub menu for car class
# Input: Null
# Output: Null
classMenuDisplay(){
	clear
	echo "#######################################"
	echo "#            Car Show Menu            #"
	echo "#             Class Score             #"
	echo "#######################################"
	echo "1) Racer"
	echo "2) Engine"
	echo "3) Body Frame"
	echo "4) Mods"
	echo "5) Mods Overall"
	echo "6) Car Overall"
	echo -e "\n"
	echo -e "Enter Selection: \c"
}

###Main Shell Script Body###

#Ignores ctrl+c as exit
trap '' 2
#Runs the initial program that generates base files
awk -f proj3/prog1.awk data/data.csv
while(true)
do
	menuDisplay
	#User input for menu selection
	read input
	#clears the screen of any previous menus and 
	#selections for new iteration
	clear
	case "$input" in
		#Displays all cars sorted via scores
		a) 	echo "All Cars in the show"
			cat headers
			#Sorts cars based on scores
			sort -k2,2rn ranks > ranksTmp
			#prog4.awk gives placement ranks to each car
			awk -f proj3/prog4.awk ranksTmp
			#Removes temp files to avoid cluttered directory
			rm ranksTmp;;
		#Displays all top three cars for each Maker
		s) 	echo "Top Three Cars for all Makers"
		  	cat headers
			#Sorts ranks based on Maker and Score
			sort -k5,5 -k2,2rn ranks > top_3
			#prog2.awk processes top_3 to only 
			#display three cars per maker
			awk -f proj3/prog2.awk top_3 > top_3Tmp
			awk -f proj3/prog4.awk top_3Tmp
			rm top_3 | rm top_3Tmp;;
		#Displays top three cars based on chosen class
		d) 	classMenuDisplay
		   	read query
			#Clears previous menu to display selected table
			clear
			#If input matches a displayed value, continue
			if [ "$query" == 1 ] || [ "$query" == 2 ] \
			|| [ "$query" == 3 ] || [ "$query" == 4 ] \
			|| [ "$query" == 5 ] || [ "$query" == 6 ]; then
				#Displays the class for table
				if [ "$query" == 1 ]; then
					echo "Top Three Cars For Racer"
				elif [ "$query" == 2 ]; then
					echo "Top Three Cars For Engine"
                                elif [ "$query" == 3 ]; then
                                        echo "Top Three Cars For Body Frame"
                                elif [ "$query" == 4 ]; then
                                        echo "Top Three Cars For Mods"
                                elif [ "$query" == 5 ]; then
                                        echo "Top Three Cars For Mods Overall"
                                elif [ "$query" == 6 ]; then
                                        echo "Top Three Cars For Car overall"
				fi
				#userInput will be used in prog3.awk file 
				#as variable
				#prog3.awk sums class specific scores
				awk -v userInput="$query" -f proj3/prog3.awk \
					data/data.csv > classRanks
        	   		sort -k2,2rn classRanks > classRankTmp
				awk -f proj3/prog4.awk classRankTmp > classRanks
				#In order to utilize grep function, cat header 
				#and classRank into ClassRankTmp
				cat headers classRanks > classRankTmp
       		   		#Displays the three rows after the keyword 
				#Score is matched
				grep -A3 "Score" classRankTmp
				rm classRanks | rm classRankTmp
			#Else displays error message
			else
				echo "Invalid Input"
			fi;;
		#Add data entry to data.csv
		w)	echo "Not Available";;
		#Delete data entry from data.csv
		e)	echo "Not Available";;
		#Exits shell script
		q) 	#Removes headers and ranks file for a clean directory
			rm headers ranks
			exit;;
		*)
			echo "Invalid input"
	esac
	#Waits for input to return to main menu
	echo -e "\nEnter any key to continue: \c"
	#Dummy Variable takes input to continue into next iteration
	read cont
#End of script
done
