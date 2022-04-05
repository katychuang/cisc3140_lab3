# Do this before processing the input file
BEGIN {
	# Set the input file field separator to comma
	FS = ",";
	# Set the ouput file field separator to tab-space
	OFS = "\t";

	# Print the headings for each column
	print "Ranking", "Car_ID", "Year", "Make", "Model", "Total";
}
{
	# Variable to track car ranking
	rank;
	# Variable to track total for each car
	total = 0;

	# Do this after line of the input file
	if(NR > 1) {
		# Read values of categories from column 8 onwards
		for(i = 8; i < NF; i++) {
			# Incremenet the total counter for each car by values in the judged categories
			total += $i;
		}	
		# Print details for each car -- rank, year, make, model, and total
		print ++rank,$7, $4, $5, $6, total;
	}
}
END {

}

