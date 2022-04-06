# Do this before processing the input file
BEGIN {
	# Set the input field separator to comma
	FS = ",";
	# Set the output field separator to tab-space
	OFS = "\t";
}
# Logic to calculate total for each class
{
        # Variable to track total score for each car under the racer class
        racerTotal = 0;
	# Checking that we're past the input file first line
	if(NR > 1) {
		# Loop through the input file between columns 10 and 14
		for(i = 10; i < 14; i++) { 
			# Add the value at each row to the racer total tracker
			racerTotal += $i;
		}	
		# 2D Array will hold the total and car_id which will help us in sorting for the top three in the class
		rttl[rTotal][$7] = racerTotal
		# Setting the row array for each car_id to a new column
		racerRow[$7] = $0
	}
	
	# Variable to track total score for each car under the engine class
        engineTotal = 0;
	# Checking that we're past the input file first line	
	if(NR > 1) {
		# Loop through the input file between columns 14 and 20
		for(i = 14; i < 20; i++) {
			# Add the value at each row to the engine total tracker
			engineTotal += $i;	
		}
		# 2D Array will hold the total and car_id which will help us in sorting for the top three in the class
		ettl[eTotal][$7] = engineTotal;
		# Setting the row array for each car_id to a new column
		engineRow[$7] = $0;	
	}

	# Variable to track total score for each car under the body_frame class
	bodyFrameTotal = 0;
	# Checking that we're past the input file first line 
	if(NR > 1) {
		# Loop through the input file between columns 20 and 25
		for(i = 20; i < 25; i++) {
			# Add the value at each row to the body_frame total tracker 
			bodyFrameTotal += $i;
		}
		# 2D Array will hold the total and car_id which will help us in sorting for the top three in the class
		bttl[bTotal][$7] = bodyFrameTotal;
		# Setting the row array for each car_id to a new column  
		bframeRow[$7] = $0; 	
	}

	# Variable to track total score for each car under the mods class 
	modsTotal = 0;
	# Checking that we're past the input file first line
	if(NR > 1) {
		# Loop through the input file between columns 25 and 34	
		for(i = 25; i < 34; i++) {
			# Add the value at each row to the mods total tracker
			modsTotal += $i;
		}
		# 2D Array will hold the total and car_id which will help us in sorting for the top three in the class 
		mttl[mTotal][$7] = modsTotal;
		# Setting the row array for each car_id to a new column
		modsRow[$7] = $0;
	}

	# Variable to track total score for each car under the mods_overall class 
	mods_overall = 0; 
	# Checking that we're past the input file first line 
	if(NR > 1) {
		# Loop through the input file on column 34
		for(i = 34; i <= 34; i++) {
			# Add the value at each row to the mods_ovrall total tracker 
			mods_overall += $i;
		}
		# 2D Array will hold the total and car_id which will help us in sorting for the top three in the class
		mottl[moTotal][$7] = mods_overall;
		# Setting the row array for each car_id to a new column
		moverallRow[$7] = $0;
	}
	
	# Variable to track total score for each car under the car_overall class
	car_overall = 0;
	# Checking that we're past the input file first line 
	if(NR > 1) {
		# Loop through the input file on column 34
		for(i = 14; i <= 14; i++) {
			# Add the value at each row to the car_overall total tracker
			car_overall += $i;
		}
		# 2D Array will hold the total and car_id which will help us in sorting for the top three in the class
		cottl[coTotal][$7] = car_overall;
		# Setting the row array for each car_id to a new column
		coverallRow[$7] = $0;
	}
}
# Do this after processing the input file
END {
	# Printing the racer class title	
	print "Class: Racer\n";
	# Printing the output column headings
	print "Rank", "Car_ID", "Year", "Make", "Model", "Score";
	
	# Variable that will track the rank for each car in the output
	ranking;
	# ID tracker for all the cars in the output
	id;

	# Setting the sorting method of all 2D arrays
	PROCINFO["sorted_in"] = "@ind_str_asc"

	# Looping through the racer array
	for(ttl in rttl) {
		# Setting the criteria for top three results based on the total
		# Sorting it by numerically descending
		top3 = asorti(rttl[rTotal], currentTotal, "@val_num_desc")
		# Limiting results to three cars
		top3 = (top3 > 3) ? 3 : top3
		
		# Looping through the top three results
		for(i = 1; i <= top3; i++) {
			# Grabbing the car_id
			id = currentTotal[i]
			# Grabbing the total based on car_id
			total = rttl[rTotal][id]
			$0 = racerRow[id]	
			
			# Printing the results
			print ++ranking, $7, $4, $5, $6, total;
		}
	}
	
	# Printing the engine class title
	print "\nClass: Engine \n";
	# Printing the output column headings
	print "Rank", "Car_ID", "Year", "Make", "Model", "Score";
	
	# Resetting the rank tracker for next output set
	ranking = 0;
	
	# Looping through the array engine array
	for(ttl in ettl) {
		# Setting the criteria for top three results based on the total
		# Sorting it by numerically descending
		top3 = asorti(ettl[eTotal], currentTotal, "@val_num_desc")
		# Limiting results to three cars
		top3 = (top3 > 3) ? 3 : top3

		# Looping through the top three results
		for(i = 1; i <= top3; i++) {
			# Grabbing the car_id
			id = currentTotal[i]
			# Grabbing the total based on car_id 
			total = ettl[eTotal][id]
			$0 = engineRow[id]

			# Printing the results
			print ++ranking, $7, $4, $5, $6, total;
		}
	}
	
	# Printing the body_frame class title 
	print "\nClass: Body_Frame \n";
	# Printing the output column headings
	print "Rank", "Car_ID", "Year", "Make", "Model", "Score";

	# Resetting the rank tracker for next output set
	ranking = 0;
	
	# Looping through the array body_frame array
	for(ttl in bttl) {
		# Setting the criteria for top three results based on the total
		# Sorting it by numerically descending
		top3 = asorti(bttl[bTotal], currentTotal, "@val_num_desc")
		# Limiting results to three cars
		top3 = (top3 > 3) ? 3 : top3
		
		# Looping through the top three results
		for(i = 1; i <= top3; i++) {
			# Grabbing the car_id
			id = currentTotal[i]
			# Grabbing the total based on car_id
			total = bttl[bTotal][id]
			$0 = bframeRow[id]
			
			# Printing the results
			print ++ranking, $7, $4, $5, $6, total;
		}
	}
	
	# Printing the mods class title
	print "\nClass: Mods \n";
	# Printing the output column headings 
	print "Rank", "Car_ID", "Year", "Make", "Model", "Score";
	
	# Resetting the rank tracker for next output set
	ranking = 0;
	
	# Looping through the mods array
	for(ttl in mttl) {
		# Setting the criteria for top three results based on the total
		# Sorting it by numerically descending
		top3 = asorti(mttl[mTotal], currentTotal, "@val_num_desc")
		# Limiting results to three cars
		top3 = (top3 > 3) ? 3 : top3

		# Looping through the top three results
		for(i = 1; i <= top3; i++) {
			# Grabbing the car_id
			id = currentTotal[i]
			# Grabbing the total based on car_id
			total = mttl[mTotal][id]
			$0 = modsRow[id]

			# Printing the results
			print ++ranking, $7, $4, $5, $6, total;
		}
	}

	# Printing the mods_overall class title
	print "\nClass: Mods_Overall \n";
	# Printing the output column headings
	print "Rank", "Car_ID", "Year", "Make", "Model", "Score";

	# Resetting the rank tracker for next output set
	ranking = 0;

	# Looping through the mods_overall array
	for(ttl in mottl) {
		# Setting the criteria for top three results based on the total
		# Sorting it by numerically descending
		top3 = asorti(mottl[moTotal], currentTotal, "@val_num_desc")
		# Limiting results to three cars
		top3 = (top3 > 3) ? 3 : top3

		# Looping through the top three results
		for(i = 1; i <= top3; i++) {
			# Grabbing the car_id
			id = currentTotal[i]
			# Grabbing the total based on car_id
			total = mottl[moTotal][id]
			$0 = moverallRow[id]

			# Printing the results
			print ++ranking, $7, $4, $5, $6, total;
		}
	}

	# Printing the car_overall class title
	print "\nClass: Car_Overall \n";
	# Printing the output column headings
	print "Rank", "Car_ID", "Year", "Make", "Model", "Score";

	# Resetting the rank tracker for next output set
	ranking = 0;

	# Looping through the car_overall array
	for(ttl in cottl) {
		# Setting the criteria for top three results based on the total
		# Sorting it by numerically descending
		top3 = asorti(cottl[coTotal], currentTotal, "@val_num_desc")
		# Limiting results to three cars
		top3 = (top3 > 3) ? 3 : top3

		# Looping through the top three results
		for(i = 1; i <= top3; i++) {
			# Grabbing the car_id
			id = currentTotal[i]
			# Grabbing the total based on car_id
			total = cottl[coTotal][id]
			$0 = coverallRow[id]

			# Printing the results
			print ++ranking, $7, $4, $5, $6, total;
		}
	}
}
