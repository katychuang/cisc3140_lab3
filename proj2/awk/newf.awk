BEGIN {
        # Set the input file field separator to comma
        FS = ",";

        # Set the output file field separator to tab-space
        OFS = "\t";
}

# Calculating and creating totals array for the totals column
{
        # Variables that will track the total sum of each judged categories for each car for Racer, Engine, Body_Frame, Mods, Mods_Overall, and Car_overall
        ovRacer[FNR] = 0;
        ovEngine[FNR] = 0;
        ovBodyFrame[FNR] = 0;
        ovMods[FNR] = 0;
        ModsOverall[FNR] = 0;
        ovCar[FNR] = 0;

        # Loops that will iterate through the input from indecated column onwards and add each value
        # Class: Racer
	for (i = 10; i <= 13; i++) {
                # Incrementing the total by each category value
                ovRacer[FNR] += $i
        }
        # Class: Engine
        for(i = 15; i <= 19; i++) {
                # Incrementing the total by each category value
                ovEngine[FNR] += $i
        }
        # Class: Body_Frame
        for(i = 20; i <= 24; i++) {
                # Incrementing the total by each category value
                ovBodyFrame[FNR] += $i
        }
        # Class: Mods
        for(i = 25; i <= 33; i++) {
                # Incrementing the total by each category value
                ovMods[FNR] += $i
        }
        # Class: Mods_Overall
        for(i = 34; i <= 34; i++) {
                # Incrementing the total by each category value
                ModsOverall[FNR] += $i
        }
	# Class: Car_Overall
        for(i = 14; i <= 14; i++) {
                # Incrementing the total by each category value
		ovCar[FNR] += $i
        }


        # Array will track details for each car (make, model, year, ectc.)
        lines[FNR] = $7 OFS $4 OFS $5 OFS $6;
}
# Handling the ranking column
END {
        # Setting the sort method to integer descending order
        PROCINFO["sorted_in"] = "@val_num_desc"

        # Printing class name
        print "Class: Racer\n"

        # Printing the column headers
        print "Ranking", "Car_ID", "Year", "Make", "Model", "Racer_Score";

        # Variable to track rank
        ranking = 0;
	
	#variable used to track the sequence of loop for the arrays
        j=0;
        #variables/arrays used to store the rank column (ranking), car details (lines), and total (OvRacer)
        sortedR[FNR]=0;
        sortedL[FNR]=0;
        sortedO[FNR]=0;
        # Loop through the totals array
        for(i in ovRacer) {
                # Store and increment the rank column, car details, and total of Racer categories
                sortedR[j]= ++ranking;
                sortedL[j]= lines[i];
                sortedO[j]= ovRacer[i];
                #increment the variable as the loop continues
                j++;
        }
        # print the top three ranked car for Racer category
        for(p=0;p<3;p++){
                print sortedR[p],sortedL[p],sortedO[p];
        }

        # Printing a new line
        print ""

        # Printing class name
        print "Class: Engine\n"

        # Printing the column headers
        print "Ranking", "Car_ID", "Year", "Make", "Model", "Engine_Score";

        # Reset the variable to track rank
        ranking = 0;

        #variable used to track the sequence of loop for the arrays
        j=0;
        #variables/arrays used to store the rank column (ranking), car details (lines), and total (OvEngine)
        sortedR[FNR]=0;
        sortedL[FNR]=0;
        sortedO[FNR]=0;
	# Loop through the totals array
        for(i in ovEngine) {
                # Print and increment the rank column, car details, and total of Engine categories
                sortedR[j]= ++ranking;
                sortedL[j]= lines[i];
                sortedO[j]= ovEngine[i];
                #increment the variable as the loop continues
                j++;
        }
        # print the top three ranked car for Engine category
        for(p=0;p<3;p++){
                print sortedR[p],sortedL[p],sortedO[p];
        }

        # Printing new line
        print ""
	
	# Printing class name
        print "Class: Body_Frame\n"

        # Printing the column headers
        print "Ranking", "Car_ID", "Year", "Make", "Model", "Body_Frame_Score";

        # Reset the variable to track rank
        ranking = 0;

        #variable used to track the sequence of loop for the arrays
        j=0;
        #variables/arrays used to store the rank column (ranking), car details (lines), and total (OvBodyFrame)
        sortedR[FNR]=0;
        sortedL[FNR]=0;
        sortedO[FNR]=0;
        # Loop through the totals array
        for(i in ovBodyFrame) {
		# Print and increment the rank column, car details, and total of Body_Frame categories
                sortedR[j]= ++ranking;
                sortedL[j]= lines[i];
                sortedO[j]= ovBodyFrame[i];
                #increment the variable as the loop continues
                j++;
        }
        # print the top three ranked car for Body_Frame category
        for(p=0;p<3;p++){
                print sortedR[p],sortedL[p],sortedO[p];
        }

        # Printing a new line
        print ""

        # Printing class name
        print "Class: Mods\n"

        # Printing the column headers
        print "Ranking", "Car_ID", "Year", "Make", "Model", "Mods_Score";

        # Reset the variable to track rank
        ranking = 0;

        #variable used to track the sequence of loop for the arrays
        j=0;
        #variables/arrays used to store the rank column (ranking), car details (lines), and total (OvMods)
        sortedR[FNR]=0;
        sortedL[FNR]=0;
        sortedO[FNR]=0;
        # Loop through the totals array
        for(i in ovMods) {
                # Print and increment the rank column, car details, and total of Mods categories
                sortedR[j]= ++ranking;
                sortedL[j]= lines[i];
                sortedO[j]= ovMods[i];
                #increment the variable as the loop continues
                j++;
        }
        # print the top three ranked car for Mods category
        for(p=0;p<3;p++){
                print sortedR[p],sortedL[p],sortedO[p];
	}

        # Printing a new line
        print ""

        # Printing class name
        print "Class: Mods_Overall\n"

        # Printing the column headers
        print "Ranking", "Car_ID", "Year", "Make", "Model", "Mods_Overall_Score";

        # Reset the variable to track rank
        ranking = 0;

        #variable used to track the sequence of loop for the arrays
        j=0;
        #variables/arrays used to store the rank column (ranking), car details (lines), and ModsOverall
        sortedR[FNR]=0;
        sortedL[FNR]=0;
        sortedO[FNR]=0;
	# Loop through the totals array
        for(i in ModsOverall) {
                # Print and increment the rank column, car details, and Mods_Overall categories
                sortedR[j]= ++ranking;
                sortedL[j]= lines[i];
                sortedO[j]= ModsOverall[i];
                #increment the variable as the loop continues
                j++;
        }
        # print the top three ranked car for ModsOverall category
        for(p=0;p<3;p++){
                print sortedR[p],sortedL[p],sortedO[p];
        }

        # Printing a new line
        print ""

        # Printing class name
        print "Class: Car_Overall\n"

        # Printing the column headers
        print "Ranking", "Car_ID", "Year", "Make", "Model", "Car_Overall_Score";

        # Reset the variable to track rank
        ranking = 0;

        #variable used to track the sequence of loop for the arrays
        j=0;
        #variables/arrays used to store the rank column (ranking), car details (lines), and total (OvCar)
        sortedR[FNR]=0;
        sortedL[FNR]=0;
        sortedO[FNR]=0;
        # Loop through the totals array
        for(i in ovCar) {
		# Print and increment the rank column, car details, and Car_Overall
                sortedR[j]= ++ranking;
                sortedL[j]= lines[i];
                sortedO[j]= ovCar[i];
                #increment the variable as the loop continues
                j++;
        }
        # print the top three ranked car for Car_Overall category
        for(p=0;p<3;p++){
                print sortedR[p],sortedL[p],sortedO[p];
        }

}

