#1/bin/awk -f
BEGIN{
   FS=","
   print "Total","Car_ID","Year","Make","Model";
}
{
if(NR>1){
   total=0
   # add everything from column 8 to end of file
   for (i=8;i<NF;i++) {
      total+=$i 
    }
}

if (NR!=1) 
   # sort in numerical order use column 3
   print total,$7,$4,$5,$6|"sort -nrk1" 
}

END{
}
