BEGIN{FS = ","
	print "Ranking" "," "Car_ID" "," "Year" "," "Make" "," "Model" "," "Total" "," "Racer" "," "Engine" "," "Body_Frame" "," "Mods" "," "Mods_Overall" "," "Car_Overall" > "proj3/headers.csv"
}
#BODY
{
	if (NR==1) {
		false
	}
	else {
		total = 0
		Racer = 0
		Engine = 0
		Body = 0
		Mods = 0
		ModsOA = $34
		CarOA = $14
		for (i = 8; i <= NF; ++i) {
			total = total + $i
			if (i >= 10 && i <= 13)
				Racer += $i
			else if (i >= 15 && i <= 19)
				Engine += $i
			else if (i >= 20 && i <= 24)
				Body += $i
			else if (i >= 25 && i <= 33)
				Body += $i
		}

    print $7 "," $4 "," $5 "," $6 "," total "," Racer "," Engine "," Body "," Mods "," ModsOA "," CarOA > "proj3/ranks.csv"

	if ($7 != "Showcar")
    print $7 "," $4 "," $5 "," $6 "," total "," Racer "," Engine "," Body "," Mods "," ModsOA "," CarOA > "proj3/top_3.csv"
	}
}
END{}
