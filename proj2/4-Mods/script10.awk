BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# calculate the sum of the mods scores in each row
for(i=25; i<=33; i++) {
	modsTotal += $i;
}

# print the car id and mods total for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7","modsTotal;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS modsTotal;
	}
}

# reset the total to 0 to be used for the next row of data
modsTotal = 0;
}
