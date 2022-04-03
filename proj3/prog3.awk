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
			else if(index($n, carClass[userInput]) != 0){
				idx[count] =  n;
				#count adds another element into array
				count++;
			}
		}
		next;
	}
	#If userInput is for Mods score, skips the last record in array
	#to avoid
	if(userInput == 5){
		#Adds the value of all stored indexes for all records
		for(i = 1; i <= length(idx); i++){
			total = total + $idx[i];
       		}
        	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \ 
        	"Unf", total, $7, $4, $5, $6;
	}
        else{
		for(i = 1; i <= length(idx); i++){
        		total = total + $idx[i];
        	}
        	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \ 
		"Unf", total, $7, $4, $5, $6;
	}
}
END{}
