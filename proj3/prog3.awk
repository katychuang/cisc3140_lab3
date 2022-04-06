# prog3.awk
# Description: prog3.awk extracts the value of a selected class and sums 
# all scores. With the new scoring system created, reevaluate each car's 
# score. Data is unsorted, therefore, placement value is "Unf" by default

BEGIN{FS = ",";
	#UserInput will take command line input
	#Array with Predefined strings of classes 
	#to match all corresponding records
	carClass[1] = "Racer"; carClass[2] = "Engine"; 
	carClass[3] = "Body_Frame"; carClass[4] = "Mods";
	carClass[5] = "Mods_Overall"; carClass[6] = "Car_Overall";
}
#BODY
{
	total = 0;
	count = 1;
	#Using the headers stored in the first record of data.csv
	#Stores the index of matched keywords into array
	if(NR==1){
		for(n = 1; n <= NF; n++){
			#userInput is a command line variable 
			#To avoid adding Mods_overall into
			#Mods total, skips if 
			#userInput is equal to 4 (Mods) AND
			#column $n is equal to Mods_Overall
			if(userInput == 4 && $n == carClass[5]){
				#skips the index placement
				false;
			}
			#index checks to see if predefined string matches
			#current column header in record.
			else if(index($n, carClass[userInput]) != 0){
				idx[count] =  n;
				#count adds another element into array
				count++;
			}
		}
		#Stops processing current record
		next;
	}
	#Adds all the values stored in array of indexes
	for(i = 1; i <= length(idx); i++){
		total = total + $idx[i];
       	}
	#Ranks are unsorted, Placement value not available, Unf is used 
	#as first column placeholder
        printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \
	"Unf", total, $7, $4, $5, $6;
}
END{
	print "The total number of entries processed here is " NR
}
