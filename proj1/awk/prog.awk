# Do this before processing the file
BEGIN {
	# Set the input file field separator to comma
	FS = ",";

	# Set the output file field separator to tab-space
	OFS = "\t";
}
# On the first line of the output file
FNR==1 {
	# Printing the column headers
	print "Ranking", $7, $4, $5, $6, "Total";

	# Stop current block and go to next
	next
}
# Calculating and creating totals array for the totals column
{
	# Variable that will track the total sum of each judged categories for each car
	ovScore[FNR] = 0;
	# Loop that will iterate through the input from column 10 onwards and add each value
	for(i = 10; i <= 34; i++) {
		# Incrementing the total by each category value
		ovScore[FNR] += $i
	}

	# Array will track details for each car (make, model, year, ectc.)	
	lines[FNR] = $7 OFS $4 OFS $5 OFS $6;
}
# Handling the ranking column
END {
	# Setting the sort method to integer descending order
	PROCINFO["sorted_in"] = "@val_num_desc"

	# Variable to track rank
	ranking = 0;

	# Loop through the totals array
	for(i in ovScore) {
		# Print and increment the rank column, car details, and car total
		print ++ranking,lines[i],ovScore[i];
	}
}
