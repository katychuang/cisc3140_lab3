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

# print the car id and body frame total for each car, ignoring showcars
if($7 != "Showcar") {

	# if the user passes in y=all, print cars from all years
	if(y == "all") {
		print $7","bodyFrameTotal;
	}

	# if the user specified a year, print only cars from that year
	else if($4 == y) {
		print $7 FS bodyFrameTotal;
	}
}


# reset the total to 0 to be used for the next row of data
bodyFrameTotal = 0;
}
