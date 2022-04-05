# Functions from Professor Chuang

# sort so that the rows are in descending order by specified column
# this is an implementation of bubblesort
function sort_by_col(arr, col) {
  for(idx=1; idx<=length(arr); idx++){
   for(left=1; left<=length(arr)-idx; left++){
    right = left + 1;
    if(arr[left][col] < arr[right][col])
      swap_rows(arr[left], arr[right]);
   }
  }
}

# swaps two rows, each is an array
function swap_rows(A,B){
  for(i in A){
    temp[i] = A[i]
  }
  for(i in B){
    A[i] = B[i]
    B[i] = temp[i]
  }
}



# have a flag to print the logs to the screen




BEGIN {
    FS = "," 

    OFS = ","


	if(!screen) {
        	print("-----> no screen value defined, setting to default 1")
		print("Output will de displayed on the screen")
        	screen = 1;
    	}



        if(!numRanks) {
                print("-----> no number of ranks defined, setting to default 3")
                print("The top 3 of each category will be displayed")
                screen = 3;
        }


# flag for numRanks inspired by teammate Adina 





}



FNR == 1 {

	#makeNum = 0

	printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
	$4,
	$5, 
	$6,
	$7,
	"total_score",
	"racer_score",
	"engine_score",
	"body_frame_score",
	"mods_score",
	"mods_overall_score",
	"car_overall_score", 
	"ranking") > "proj1/sampleOutputs/initialReport.csv" ;

#sampleOutputs/initialReport.csv
}







FNR > 1{ # skip the first line as it is a header row

	total = 0; # initilize total to 0 for each entry
	for(i = 10; i <= NF; i++){ # start at 8 as that is where rank start
		total += $i;
	};

	tempCarID = $7

	$(NF + 1) = total;

	totalIndex = NF


        racer = 0; # initilize total to 0 for each entry
        for(i = 10; i <= 13; i++){ # start at 8 as that is where racer starts
                racer += $i;
        };



        $(NF + 1) = racer;


        racerIndex = NF;





        engine = 0; # initilize total to 0 for each entry
        for(i = 15; i <= 19; i++){ # start at 8 as that is where rank start
                engine += $i;
        };



        $(NF + 1) = engine;


        engineIndex = NF;







        body = 0; # initilize total to 0 for each entry
        for(i = 20; i <= 24; i++){ # start at 8 as that is where rank start
                body += $i;
        };



        $(NF + 1) = body;



        bodyIndex = NF;







        mods = 0; # initilize total to 0 for each entry
        for(i = 25; i <= 33; i++){ # start at 8 as that is where rank start
                mods += $i;
        };



        $(NF + 1) = mods;


        modsIndex = NF;







	modsOver = $34;

        $(NF + 1) = modsOver;

        modsOverIndex = NF;

# these 2 teachincally already have their own columns




	carOver = $14;

        $(NF + 1) = carOver;


        carOverIndex = NF;












# I wonder if there is a way to use regex to
# get the columns that specifcally based on 
# column names 
# for example add all columns that start with racer to
# the racer score




# there is only 1 showcar
# it does not really make much sense to exclude it
# especially considering other ids like VIP exist
# can add an if statement to ignore carids that have showcar

# wonder if there is an easy way to get array length


# length(arrCars)
# should work
	if (tempCarID != "Showcar"){
		for (f = 1; f <= NF; f++){
    			arrCars[FNR-1][f] = $f;
  		}


	}





	

	#ranking = FNR - 1;

	#$(NF + 1) = ranking;  
#	$1 = ranking
#	print $NF;



	
if ($5 in makeList){
	# do nothing
	} else {
	makeList[$5] = $5;
	}


# this caused a lot pf problems
# there is no native way in awk to check for values
# only keys


# it takes more effort to create an array with inoque values in awk

#print(length(makeList))

# k can only take single digit values 
# what to do if we had 11 fields?


# how to handle ties
# they should probably get the same ranking

# same when showing top 3 makes
# show ties



# do I need multiple files to do this?




# $NF
#total
#ranking





	

}





END {


        sort_by_col(arrCars, totalIndex);



        for (carNum= 1; carNum <= length(arrCars); carNum++){

                #for(fieldNum= 1; fieldNum <= NF; fieldNum++){

                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
		arrCars[carNum][4],
		arrCars[carNum][5],
		arrCars[carNum][6],  
                arrCars[carNum][7],
                arrCars[carNum][totalIndex],
                arrCars[carNum][racerIndex],
                arrCars[carNum][engineIndex],
                arrCars[carNum][bodyIndex],
                arrCars[carNum][modsIndex],
                arrCars[carNum][modsOverIndex],
                arrCars[carNum][carOverIndex],
		carNum    )  > "proj1/sampleOutputs/initialReport.csv"  ;
		
		arrCars[carNum][NF+1] = carNum		


              


        }

# >> "initialReport.csv";


        for (make in makeList){

		#print(makeList[make])

}



#################################################################################

	if(screen == 1){

	print("Best Cars for each make")

	}


	for (make in makeList){


		curMake = makeList[make]

		#print(curMake);
		# for some reason this prints all the cars makes


                printf("%-20s \n", curMake) > "proj1/sampleOutputs/bestMakes.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/bestMakes.csv" ;





                bestMakes = 0;






	if(screen == 1){



                printf("%-20s \n", curMake)

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking")  ;


}









# how to get absolute ranking to print properly?

		
                for (carNum= 1; carNum <= length(arrCars); carNum++){
	

                        if ((curMake == arrCars[carNum][5]) && bestMakes < numRanks){




                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                (bestMakes + 1),
                                arrCars[carNum][4],
                                arrCars[carNum][5],
                                arrCars[carNum][6],
                                arrCars[carNum][7],
                                arrCars[carNum][totalIndex],
                                arrCars[carNum][racerIndex],
                                arrCars[carNum][engineIndex],
                                arrCars[carNum][bodyIndex],
                                arrCars[carNum][modsIndex],
                                arrCars[carNum][modsOverIndex],
                                arrCars[carNum][carOverIndex],
                                arrCars[carNum][NF+1]    )  > "proj1/sampleOutputs/bestMakes.csv"  ;



				if(screen == 1){



                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                (bestMakes + 1),
                                arrCars[carNum][4],
                                arrCars[carNum][5],
                                arrCars[carNum][6],
                                arrCars[carNum][7],
                                arrCars[carNum][totalIndex],
                                arrCars[carNum][racerIndex],
                                arrCars[carNum][engineIndex],
                                arrCars[carNum][bodyIndex],
                                arrCars[carNum][modsIndex],
                                arrCars[carNum][modsOverIndex],
                                arrCars[carNum][carOverIndex],
                                arrCars[carNum][NF+1]    ) ;



				}




                                bestMakes++;



			}




		}















	printf("\n") > "proj1/sampleOutputs/bestMakes.csv"

	if(screen == 1){
	printf("\n")



	}


	}



###############################3

	printf("File for the top cars of each category \n") > "proj1/sampleOutputs/topCars.csv"
	printf("\n") > "proj1/sampleOutputs/topCars.csv";


	if(screen == 1){


        	printf("Top cars of each category \n")
	        printf("\n") ;

	}


# top 3 overall
        printf("Overall \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;







	if(screen ==1){

        printf("Overall \n") 

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking")  ;




	}









	for(i = 1; i <=  numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;






			if(screen == 1){


                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )   ;



			}







	}


        printf("\n") > "proj1/sampleOutputs/topCars.csv";

	if(screen == 1){

	        printf("\n") 



	}





# top 3 racer

       sort_by_col(arrCars, racerIndex); 


 printf("Racer \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;





if(screen == 1){


 printf("Racer \n")

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") ;



}






     



        for(i = 1; i <=  numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;





		if(screen == 1){


                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  ;


		}







        }




 printf("\n") > "proj1/sampleOutputs/topCars.csv";

if(screen == 1){

 printf("\n") 

}




# top 3 engine

       sort_by_col(arrCars, engineIndex); 

 printf("Engine \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",       
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;


    

if(screen == 1){

 printf("Engine \n")

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") ;






}











        for(i = 1; i <= numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,              
                                arrCars[i][4],     
                                arrCars[i][5],     
                                arrCars[i][6],     
                                arrCars[i][7],     
                                arrCars[i][totalIndex],     
                                arrCars[i][racerIndex],     
                                arrCars[i][engineIndex],     
                                arrCars[i][bodyIndex],     
                                arrCars[i][modsIndex],     
                                arrCars[i][modsOverIndex],     
                                arrCars[i][carOverIndex],     
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;     








			if(screen == 1){


                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  ;





			}







        }

     


 printf("\n") > "proj1/sampleOutputs/topCars.csv";


if(screen == 1){
 printf("\n") 


}


# top 3 body

       sort_by_col(arrCars, bodyIndex); 


 printf("Body_Frame \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",       
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;


      




if(screen == 1){



 printf("Body_Frame \n")

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") ;



}













        for(i = 1; i <= numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;



if(screen == 1){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    ) ;





}
















        }

 printf("\n") > "proj1/sampleOutputs/topCars.csv";


if(screen == 1){

 printf("\n")

}





# top 3 mods


       sort_by_col(arrCars, modsIndex); 



 printf("Mods \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",       
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;



if(screen == 1){

 printf("Mods \n") 

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") ;





}
















     


        for(i = 1; i <= numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;




if(screen == 1){


                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  ;



}





        }
 printf("\n") > "proj1/sampleOutputs/topCars.csv";


if(screen == 1){

 printf("\n")



}



# top 3 modsover



       sort_by_col(arrCars, modsOverIndex); 



 printf("Mods_Overall \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",       
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;








if(screen == 1){



 printf("Mods_Overall \n") 

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking")  ;





}














       

        for(i = 1; i <= numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;







if(screen == 1){




                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )   ;






}








        }
 printf("\n") > "proj1/sampleOutputs/topCars.csv";

if(screen == 1){


 printf("\n") 


}











# top3 carover 

       sort_by_col(arrCars, carOverIndex); 


 printf("Car_Overall \n") > "proj1/sampleOutputs/topCars.csv"

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",       
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") > "proj1/sampleOutputs/topCars.csv" ;




if(screen == 1){


 printf("Car_Overall \n")

                printf( "%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                "relative_ranking",
                "Year",
                "Make",
                "Model",
                "Car_ID",
                "total_score",
                "racer_score",
                "engine_score",
                "body_frame_score",
                "mods_score",
                "mods_overall_score",
                "car_overall_score",
                "ranking") ;






}











       



        for(i = 1; i <= numRanks; i++){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  > "proj1/sampleOutputs/topCars.csv"  ;





if(screen == 1){

                                printf("%-18s, %-18s, %-18s, %-18s, %-18s, %-18s, %-18s,%-18s, %-18s, %-18s, %-18s, %-18s, %-18s \n",
                                i,
                                arrCars[i][4],
                                arrCars[i][5],
                                arrCars[i][6],
                                arrCars[i][7],
                                arrCars[i][totalIndex],
                                arrCars[i][racerIndex],
                                arrCars[i][engineIndex],
                                arrCars[i][bodyIndex],
                                arrCars[i][modsIndex],
                                arrCars[i][modsOverIndex],
                                arrCars[i][carOverIndex],
                                arrCars[i][NF+1]    )  ;




}


        }

		

        
}
