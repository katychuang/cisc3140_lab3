# This script prints information on each car with that car's total body frame score in descending order of total body frame score
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# calculate the sum of the body frame scores in each row
for(i=20; i<=24; i++) {
	bodyFrameTotal += $i;
}

# print the car id, make, model, year, and body frame total for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7 FS $5 FS $6 FS $4 FS bodyFrameTotal;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS $5 FS $6 FS $4 FS bodyFrameTotal;
	}
}

# reset the total to 0 to be used for the next row of data
bodyFrameTotal = 0;
}

