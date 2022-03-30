BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file, skipping the header
NR>1 {

# print the car id and car_overall for each car, ignoring showcars
if($7 != "Showcar") {
	print $7","$14;

}
}
