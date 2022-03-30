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

# print the car id and engine total for each car, ignoring showcars
if($7 != "Showcar") {
	print $7","engineTotal;
}

# reset the total to 0 to be used for the next row of data
engineTotal = 0;
}
