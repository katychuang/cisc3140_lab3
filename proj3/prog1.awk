BEGIN{FS = ","
	print "Car_ID" "|" "Year" "|" "Make" "|" "Model" "|" "Ranks" > "headers"
}
#BODY
{
	if (NR==1) 
	{false}
	else {
		total = 0
		for (i = 8; i <= NF; ++i) {
			total = total + $i
		}
        	print $7 "|" $4 "|" $5 "|" $6 "|" total > "ranks"
                print $7 "|" $4 "|" $5 "|" $6 "|" total > "top_3"
	}
}
END{}
