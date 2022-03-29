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
	print $7","racerTotal;
}

# reset the total to 0 to be used for the next row of data
total = 0;
}
