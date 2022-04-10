BEGIN	{
   FS = ",";
   OFS=","

   print "Enter car make:"
   print "options: Acura Jeep Lexus Honda Ford Hyundai Infiniti Subaru Volkswagen Chevy Nissan Toyota Chrystler Bmw Mitsu Dodge Mercedes Audi Mazda Scion Volvo all"
   getline car_make < "-"

   print "Enter year:"
   print "options: 1982 1987 1990 1991 1992 1993 1995 1996 1997 1998 2001 2003 2004 2005 2006 2007 2008 2009 2010 2011 2012 2013 2014 2015 2016 2017 2018 all"
   getline car_year < "-"


   print "Enter class of car:"
   print "options: Racer Engine Body_Frame Mods Mods_Overall Car_Overall  all"
   getline class < "-"

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
   default: {
       start = 10
       end = 34
       break
   }
 }
}


{
   if (NR==1) {} 
       else{
		total = 0
		for (i = start; i <= end; i++) {
			total = total + $i
		}

       #ignore car_id  which is Showcar or VIP
	if($7 != "Showcar" || "Vip"){
           if(car_year == "all" && car_make == "all"){
               print total,$7, $4, $5, $6 
           }else if(car_make == $5 && car_year == "all"){
               print total,$7, $4, $5, $6 
           }else if(car_make == "all" && car_year ==$4){
               print total,$7, $4, $5, $6 
           }else if(car_make == $5 && car_year == $4){
               print total,$7, $4, $5, $6 
           }
	}	
    }
}


END{


}



