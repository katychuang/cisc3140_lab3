# prog2.awk
# Description: prog2.awk processes a sorted rank file and displays the 
# top cars. The number of cars displayed depends on user input. Placement 
# value is allocated to each processed car


BEGIN{	
#Sets global variables
	recordCounter = 0
	count=1 
	word="Maker"
}
#BODY
{
	#Checks if theres a new word in current row
	if(word!=$5){
		count=1;
		word=$5;
                printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", 
                count, $2, $3, $4, $5, $6;
		recordCounter++;
	}
	#If the count is equal or greater than numCars, skips to the next line
	#numCars variable passed from command line
	else if(count >= numCars){
		false;
	}
	#Prints rows and increments count
	else{
		#Adds placement values 
		count++;
		printf "%-6s %-6s %-6s %-8s %-12s %-15s\n",
		count, $2, $3, $4, $5, $6;
		recordCounter++;
	}
}
END{
	print "The number of records processed here is ", recordCounter
}
