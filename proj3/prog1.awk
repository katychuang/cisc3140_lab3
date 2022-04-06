# prog1.awk 
# Description: prog1.awk extracts relevant fields from the provided data.csv 
# file. Creates a custom `header` file to be applied to each consequent 
# file created. Proceeds to summing the score value of each scoring column
# which is then output to a `ranks` file along with other extracted values

BEGIN{FS = ","
#Creates custom Header file.
	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \
	"Place", "Score", "CarID#", "Year", "Maker", "Model" > "headers"
}
#BODY
{
	#Skips the first row of data to use custom header later
	if (NR==1) 
	{false}
	#Skips all rows that match Showcar and Vip 
	else if($7 == "Showcar" || $7 == "Vip")
	{false}
	else {
		#Summation of all scores
		total = 0 
		for (i = 10; i <= NF; ++i) {
			total = total + $i
		}
		#Prints data to ranks files
		#Data is unsorted, No placement value, Unf as default in base file
        	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n",	\
		"Unf", total, $7, $4, $5, $6 > "ranks"
	}
}
END{}
