BEGIN{FS = ",";
	#UserInput will take command line input
	userInput = 1;
	#Array with Predefined strings of classes 
	#to match all corresponding records
	carClass[1] = "Racer"; carClass[2] = "Engine"; 
	carClass[3] = "Body_Frame"; carClass[4] = "Mods";
	carClass[5] = "Mods_Overall"; carClass[6] = "Car_Overall";
       	#Custom headers2 
	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \
	"Place", "Score", "Car_ID", "Year", "Make", "Model" > "headers2"
}
#BODY
{
	total = 0;
	count = 1;
	if(NR==1){
		for(n = 1; n <= NF; n++){
			if(index($n, carClass[userInput]) != 0){
				idx[count] =  n;
				count++;
			}
		}
		next;
	}
        for(i = 1; i <= length(idx); i++){
        	total = total + $idx[i];
        }
        printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \ 
	"Unf", total, $7, $4, $5, $6 > "classScore";
}
END{}
