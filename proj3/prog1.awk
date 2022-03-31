BEGIN{FS = ","
#Creates Header file.
	printf "%-6s %-6s %-8s %-12s %-15s\n", \
	"Score", "Car_ID", "Year", "Make", "Model" > "headers"
}
#BODY
{
	#Skips the first row of data
	if (NR==1) 
	{false}
	#Skips all rows that match Showcar and Vip 
	else if($7 == "Showcar" || $7 == "Vip")
	{false}
	else {
		#Summation of all scores
		total = 0 
		for (i = 8; i <= NF; ++i) {
			total = total + $i
		}
		#Prints data to two seperate files
        	printf "%-6s %-6s %-8s %-12s %-15s\n",	\
		total, $7, $4, $5, $6 > "ranks"
                printf "%-6s %-6s %-8s %-12s %-15s\n",	\
		total, $7, $4, $5, $6 > "top_3"
	}
}
END{}
