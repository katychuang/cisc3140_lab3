BEGIN{
	count = 1
}
#BODY
{
	#Adds Placement value to Place column
	printf "%-6s %-6s %-6s %-8s %-12s %-15s\n", \
	count, $2, $3, $4, $5, $6;
	count++;
}
END{}
