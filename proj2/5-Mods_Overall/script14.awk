# This script prints data on each car with that car's  mods overall score and ranking in ascending order of ranking
# Author: Adina Scheinfeld (Github: @AdinaScheinfeld)

BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","

# print the header
print "Car_ID,Make,Model,Year,Mods_Overall,Ranking"
}

# iterate through the rows of the input file skipping the header
{

# assign a rank to each row based on the mods overall
# if the sum of scores for two rows is equal, assign to them the same rank
if(x != $5) {i++}{x = $5}

# print each row of data with its assigned rank
print $0 FS i
}
