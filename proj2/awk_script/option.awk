BEGIN	{
   FS = ",";
   OFS=","

   print "Enter car brand: (all for all brand)"
   getline brand < "-"

   print "Enter year: (all for all year)"
   getline year < "-"


   print "Enter aspect of car: (all for total score)"
   print "options: racer  caroverall  engine  bodyframe  mods "
   getline aspect < "-"

   switch(aspect) {
   case "all": {
       start = 10
       end = 34
       break
    }
   case "racer": {
       start = 10
       end = 13
       break
   }
   case "caroverall": {
       start = 14
       end = 14
       break
   }
   case "engine": {
       start = 15
       end = 19
       break
   }
   case "bodyframe": {
       start = 20
       end = 24
       break
   }
   case "mods": {
       start = 25
       end = 33
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
           if(year == "all" && brand == "all"){
               print total,$7, $4, $5, $6 
           }else if(brand == $5 && year == "all"){
               print total,$7, $4, $5, $6 
           }else if(brand == "all" && year ==$4){
               print total,$7, $4, $5, $6 
           }else if(brand == $5 && year == $4){
               print total,$7, $4, $5, $6 
           }
	}	
    }
}


END{


}



