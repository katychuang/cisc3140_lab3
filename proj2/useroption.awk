# User Options Program to determine sorted response
# Author: Huang Yan
# Github: @steven-yanh

BEGIN	{
    FS = ",";OFS=","
    # user picks options like car brand, year, and the scoring to rank
    print "Enter car brand: (all for all brand)"
    getline brand < "-"
    print "Enter year: (all for all year)"
    getline year < "-"
    print "Enter aspect of car: (all for total score)"
    print "options: racer  caroverall  engine  bodyframe  mods "
    getline aspect < "-"
    if(aspect == "all"){
        start = 10
        end = 34
    }else if(aspect == "racer"){
        start = 10
        end = 13
    }else if(aspect == "caroverall"){
        start = 14
        end = 14
    }else if(aspect == "engine"){
        start = 15
        end = 19
    }else if(aspect == "bodyframe"){
        start = 20
        end = 24
    }else if(aspect == "mods"){
        start = 25
        end = 33
    }else {
        start = 10
        end = 34
    }
}
{
    if (NR==1) 
	{}
	else {
		total = 0
		for (i = start; i <= end; i++) {
			total = total + $i
		}
        # skiping id is Showcar or VIP
		if($7 != "Showcar" || "Vip"){
            if(year == "all" && brand == "all"){
                print total,$7, $4, $5, $6 > "useroption.csv"
            }else if(brand == $5 && year == "all"){
                print total,$7, $4, $5, $6 > "useroption.csv" 
            }else if(brand == "all" && year ==$4){
                print total,$7, $4, $5, $6 > "useroption.csv"
            }else if(brand == $5 && year == $4){
                print total,$7, $4, $5, $6 > "useroption.csv"
            }else{

            }
		}	
	}
}
END	{
    
}
