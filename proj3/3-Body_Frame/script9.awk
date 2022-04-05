# This script prints the top numRanks CarIDs, total racer scores, and rankings
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","

# print header
print "Car_ID,Body_Frame_Total,Ranking"
}

# iterate through the rows of the input file
{

# print top numRanks cars with highest body frame totals
if($3 <= numRanks) {
	print $0
}
}
