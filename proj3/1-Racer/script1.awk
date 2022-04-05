# This script prints each Car ID with that car's total racer score in descending order of total racer score
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# calculate the sum of the racer scores in each row
for(i=10; i<=13; i++) {
	racerTotal += $i;
}

# print the car id and racer total for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7","racerTotal;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS racerTotal;
	}
}

# reset the total to 0 to be used for the next row of data
racerTotal = 0;
}

