# This script prints each Car ID with that car's total racer score and raking in ascending order of ranking
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","
}

# iterate through the rows of the input file
{

# assign a rank to each row based on the car overall
# if the sum of scores for two rows is equal, assign to them the same rank
if(x != $2) {i++}{x = $2}

# print each row of data with its assigned rank
print $0 FS i
}
