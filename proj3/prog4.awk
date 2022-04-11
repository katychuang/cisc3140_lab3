# prog4.awk
# Description: prog4.awk processes a sorted rank file and adds placement 
# values based on number of records processed

BEGIN{
	recordCount = 0
	count = 1
}
#BODY
{
	#Adds Placement value to Place column to unsorted files
	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \
	count, $2, $3, $4, $5, $6;
	count++;
	recordCount++
}
END{
	print "The total number of entries processed here is " recordCount
}
