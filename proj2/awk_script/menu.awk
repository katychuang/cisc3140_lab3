BEGIN	{
   #Read input file by , and seperate outout file by ,
   FS = ",";
   OFS=","

   # Menu options: get infomation entered by the user 
   # and then display the specified reports.
   
   # Ask User to enter a car make
   print "Enter car make:"
   print "options: Acura Jeep Lexus Honda Ford Hyundai Infiniti Subaru Volkswagen Chevy Nissan Toyota Chrystler Bmw Mitsu Dodge Mercedes Audi Mazda Scion Volvo all"
   getline car_make < "-"

   # Input year of car
   print "Enter year:"
   print "options: 1982 1987 1990 1991 1992 1993 1995 1996 1997 1998 2001 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 all"
   getline car_year < "-"

   # Input the class of car
   print "Enter class of car:"
   print "options: Racer Engine Body_Frame Mods Mods_Overall Car_Overall  all"
   getline class < "-"

   # Determine which class the user wants 
   switch(class) {
   case "all": {
       start = 10
       end = 34
       break
    }
   case "Racer": {
       start = 10
       end = 13
       break
   }
   case "Engine": {
       start = 15
       end = 19
       break
   }
   case "Body_Frame": {
       start = 20
       end = 24
       break
   }
   case "Mods": {
       start = 25
       end = 33
       break
   }
   case "Mods_Overall": {
       start = 34
       end = 34
       break
   }
   case "Car_Overall": {
       start = 14
       end = 14
       break
   }
   # Display all by default
   default: {
       start = 10
       end = 34
       break
   }
 }
}


{
   # Ignore the header
   if (NR==1) {} 
       else{
       		# Calculate the total score
		total = 0
		# Start and End get from user input
		for (i = start; i <= end; i++) {
			total +=  $i
		}

       #ignore car_id which is Showcar or VIP
	if($7 != "Showcar" || "Vip"){
	   # Determine different input of make and cat year
	   # 4 situation for toal
	   # Display report By
	   # total_score Car_ID Year Make Model
           if(car_year == "all" && car_make == "all"){
               print total,$7, $4, $5, $6 
           }
	   else if(car_make == $5 && car_year == "all"){
               print total,$7, $4, $5, $6 
           }
	   else if(car_make == "all" && car_year ==$4){
               print total,$7, $4, $5, $6 
           }
	   else if(car_make == $5 && car_year == $4){
               print total,$7, $4, $5, $6 
           }
	}	
    }
}


END{


}



