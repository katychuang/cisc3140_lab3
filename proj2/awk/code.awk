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
		
		# 2D Array will hold make and car_id which will help us in sorting for top three
		# car_id will be used as unique id to help differentiate cars with same make and model
		ttl[$5][$7] = total
		# Setting row array for each car_id to a new column
		row[$7] = $0
	}
}
END {
	# Printing a space line
	print "\n";
	# Printing column headers for sorted by top three output
	print "Ranking", "Car_ID", "Year", "Make", "Model", "Total";

	# Variable will track rank for each car
	ranking;
	# Variable will track car_ids for each car
	id;

	# Sorting array using string for make in ascending order (will go from As to Zs)
	PROCINFO["sorted_in"] = "@ind_str_asc"
	# Looping through 2D array ttl using the car makes
	for(make in ttl) {
		# Sorting array by make and total in numerical descending (highest to lowest)
		n = asorti(ttl[make], currentTotal, "@val_num_desc")
		# Limiting output to three vehicles per make
		n = (n > 3) ? 3 : n
		
		# Looping through the cars to find top three in total
		for(i = 1; i <= n; i++) {
			# Having ID as unique identifier for each total value
			id = currentTotal[i]
			# Getting total for each car based on make and car_id
			total = ttl[make][id]
			# Assigning ids to new column
			$0 = row[id]	
			
			# Printing output of top three cars per make and their details (make, model, total)
			print ++ranking, $7, $4, $5, $6, total;
		}
	}
}

