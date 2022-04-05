# This script prints information on the top numRanks cars, their total body frame scores, and rankings
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","

# print header
print "Car_ID,Make,Model,Year,Body_Frame_Total,Ranking"
}

# iterate through the rows of the input file skipping the header row
NR>1 {

# print top numRanks cars with highest body frame totals
if($6 <= numRanks) {
	print $0
}
}

