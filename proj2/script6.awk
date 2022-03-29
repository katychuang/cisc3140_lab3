BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","

# print header
print "Car_ID,Engine_Total,Ranking"
}

# iterate through the rows of the input file
{

# print top 3 cars with highest engine totals
if($3 == 1 || $3 == 2 || $3 == 3) {
	print $0
}
}
