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
        echo "1) Show All Cars"
        echo "2) Top Cars Overall"
        echo "3) Top Cars For All Makers"
	echo "4) Top Cars By Class"
	echo "5) Quit"
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
# classHeaderDisplay: After class selection, displays which class was selected
# depending on the argument passed on
# Input: int input ($1), int numCars ($2)
# Output: Null
classHeaderDisplay(){
        if [ $1 -eq 1 ]; then
                echo "Top $2 Cars For Racer"
        elif [ $1 -eq 2 ]; then
                echo "Top $2 Cars For Engine"
        elif [ $1 -eq 3 ]; then
                echo "Top $2 Cars For Body Frame"
        elif [ $1 -eq 4 ]; then
                echo "Top $2 Cars For Mods"
        elif [ $1 -eq 5 ]; then
                echo "Top $2 Cars For Mods Overall"
        elif [ $1 -eq 6 ]; then
        	echo "Top $2 Cars For Car overall"
	fi;
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
	#clears the screen for sub menu or table 
	clear
	#Switch statements for menu
	case "$input" in
		#Displays all cars sorted via scores
		1) 	#Displays selected menu option
			echo "All Cars in the show"
			#Displays Header file
			cat headers
			#Sorts cars based on scores
			sort -k2,2rn ranks > ranksTmp
			#prog4.awk gives placement ranks to each car and
			#Displays all cars processed
			awk -f proj3/prog4.awk ranksTmp
			#cat ranksTmp
			#Removes temp files to avoid cluttered directory
			rm ranksTmp;;
	
		#Displays Top cars overall, number displayed based on user 
		#Input
		2)	#Displays selected menu option
			echo "Top Cars Overall"
			#Request number of cars to be displayed
			echo -e "Enter # of cars to display (1-10): \c"
			read numCars
			#Error Check: checks numCars if its within 1 and 10
			#checks that numCars is not a string or special char
			#Error message if otherwise
			if [ "$numCars" -ge 1 ] && \
			[ "$numCars" -le 10 ] && \
			[[ "$numCars" != [A-Z] ]]; then
				#Clears Previous screen to display cars
				clear
				echo "Displaying Top $numCars Cars Overall"
				#Sorts cars based on scores
                        	sort -k2,2rn ranks > ranksTmp
                        	#prog4.awk gives placement ranks to each car
                        	awk -f proj3/prog4.awk ranksTmp > ranksTmp2
				#Adds headers and car info into a new file
				cat headers ranksTmp2 > ranksTmp
				#Using grep, display the number of cars 
				#requested
				grep -A"$numCars" "Score" ranksTmp
                        	#Removes temp files to avoid cluttered directory
                        	rm ranksTmp | rm ranksTmp2
			else
				#Error message for invalid input
				clear
				echo "Invalid Input"
			fi;;
		#Displays all top three cars for each Maker
		3) 	#Displays selected menu option
			echo "Top Three Cars for all Makers"
			#Request number of cars to be displayed (1-10)
		  	echo -e "Enter # of cars to display (1-10): \c"
			read numCars
			#Error Check: checks numCars if its within 1 and 10
                        #checks that numCars is not a string or special char
                        #Error message if otherwise
			if [ "$numCars" -ge 1 ] && \
                        [ "$numCars" -le 10 ] && \
                        [[ "$numCars" != [A-Z] ]]; then
				#Allows user to enter a car maker or display all cars
				echo -e "Enter Maker Name (Enter "a" to display all): \c"
				read makerName
				#Sorts ranks based on Maker and Score
				sort -k5,5 -k2,2rn ranks > top_3
				#Number of cars to be displayed is passed onto
				#prog2.awk 
				awk -v numCars="$numCars" -f proj3/prog2.awk top_3 > top_3Tmp
				#If maker name is 'a', prints the top N for all makers
				if [ "$makerName" == "a" ] && \
				[[ "$makerName" != [0-9] ]]; then
					clear
					echo "Displaying Top $numCars Cars For All Makers"
					cat headers top_3Tmp
				#Checks to see if makerName matches a record
				#And its not a numerical value 
				#in file
				#Flags: -i: Ignores case sensitivity
				#	-q: Does not print to standard output
				elif grep -i -q -w "$makerName" top_3Tmp && \
				[[ "$makerName" != [0-9] ]]; then
					clear
					echo "Displaying Top $numCars Cars For $makerName" 
					cat headers
					grep -i -w "$makerName" top_3Tmp
				#If no match found, return to menu
				else
					clear
					echo "Maker Not Found" 
				fi;
				rm top_3 | rm top_3Tmp
			else
				clear
				echo "Invalid Input"
			fi;;
		#Displays top three cars based on chosen class
		4) 	#Displays class sub menu
			classMenuDisplay
		   	read input
			#Continue if input matches a displayed value and is not a 
			#string
			if [ "$input" -eq 1 ] || [ "$input" -eq 2 ] \
			|| [ "$input" -eq 3 ] || [ "$input" -eq 4 ] \
			|| [ "$input" -eq 5 ] || [ "$input" -eq 6 ] && \
			[[ "$input" != [A-Z] ]]; then
                        	#Request number of cars to be displayed
				echo -e "Enter # of cars to display (1-10): \c"
                        	read numCars
				#Error Check: checks numCars if its within 1 and 10
                        	#checks that numCars is not a string or special char
                       	 	#Error message if otherwise
				if [ "$numCars" -ge 1 ] && \
	        	        [ "$numCars" -le 10 ] && \
        	        	[[ "$numCars" != [A-Z] ]]; then
					#Clears previous menu to display selected table
                        		clear
					#Displays sub menu option picked
					classHeaderDisplay "$input" "$numCars"
					#userInput will be used in prog3.awk file 
					#as variable
					#prog3.awk sums class specific scores
					awk -v userInput="$input" -f proj3/prog3.awk \
					data/data.csv > classRanks
					#Sorts cars based on scores
        	   			sort -k2,2rn classRanks > classRankTmp
					#Gives placement values to cars
					awk -f proj3/prog4.awk classRankTmp > classRanks
					#In order to utilize grep function, cat header 
					#and classRank into ClassRankTmp
					cat headers classRanks > classRankTmp
       		   			#Displays the three rows after the keyword 
					#Score is matched
					grep -A"$numCars" "Score" classRankTmp
					rm classRanks | rm classRankTmp
				else
					clear
					echo "Invalid Input"
				fi;
			#Else displays error message
			else
				clear
				echo "Invalid Input"
			fi;;
		#Exits shell script
		5) 	#Removes headers and ranks file for a clean directory
			rm headers ranks
			exit;;
		#To Be Added
		#) Add Entry: Adds entry to data.csv
		#) Delete Entry: Deletes Entry in data.csv
		#) Sort > Other fields: Time, Judges, Models
		# Default Message for invalid inputs
		*)
			clear
			echo "Invalid input"
	esac
	#Waits for input to return to main menu
	echo -e "\nEnter any key to continue: \c"
	#Dummy Variable takes input to continue into next iteration
	read cont
#End of script
done
