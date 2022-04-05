# Selects the Top Picks for the selected criteria
# Author: Huang Yan
# Github: @steven-yanh

BEGIN{
    FS = ",";
    OFS=","
	
    # user can select how many cars to rank based on score
	print "Enter amount of cars: (top 3, enter 3)"
	getline top < "-"
	print "Ranking,score,year,make,model"
}
#BODY
{
	if(NR <= top)
	{
		print $0 > "result.csv"
	}
	
}
END{}