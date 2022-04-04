# On the first line of the output file
NR == 1 {
	# Print the headings for each column separated by spaces
        print "Ranking" "\t" "Car_ID" "\t" "Year" "\t" "Make" "\t" "Model" "\t" "Total"
}
#
{
	# For each line the input file, create an array that will track car make, and total
	# along with a new column for ranking
	rows[$4][$6][$0]
}
# At the end of the output file do the following
END {
	# This block will handle the sorting and ranking of the top three cars from all makes

	# Setting the sorting method to target string indeces in descending order
        PROCINFO["sorted_in"] = "@ind_str_asc"
	# Loop to sift through the rows array
        for(m in rows) {
		# Sort each row item by integer in descending order
                n = asorti(rows[m], t, "@ind_num_desc");
		# Limit output to three per make
                n = (n>3) ? 3 : n
		# Loop through the top three per make
                for(i=1; i<=n; i++) for(s in rows[m][t[i]]) {
			# Set rank for each car
                        $0 = s;
			# Increment ranking
                        $1 = ++r;
			# Print each car with the rest of its details
                        print $1 "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6
                }
        }
}
