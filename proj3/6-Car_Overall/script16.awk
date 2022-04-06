# This script prints information on each car with that car's car overall score in descending order of car overall score
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# print the car id, make, model, year, and car overall for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7 FS $5 FS $6 FS $4 FS $14;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS $5 FS $6 FS $4 FS $14;
	}
}
}

