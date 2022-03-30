BEGIN {

# specify comma as the field separator
FS = ","
OFS = ","

# print header
print "Car_ID,Mods_Overall,Ranking"
}

# iterate through the rows of the input file
{

# print top 3 cars with highest mods overall
if($3 == 1 || $3 == 2 || $3 == 3) {
	print $0
}
}
