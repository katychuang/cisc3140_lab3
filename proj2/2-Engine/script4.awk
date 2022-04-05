# This script prints information on each car with that car's total engine score in descending order of total engine score
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# calculate the sum of the engine scores in each row
for(i=15; i<=19; i++) {
	engineTotal += $i;
}

# print the car id, make, model, year, and engine total for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7 FS $5 FS $6 FS $4 FS engineTotal;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS $5 FS $6 FS $4 FS engineTotal;
	}
}

# reset the total to 0 to be used for the next row of data
engineTotal = 0;
}

