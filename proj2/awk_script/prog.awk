#1/bin/awk -f
BEGIN{
FS=","
print "Total","Car_ID","Year","Make","Model","Ranking";
}
{
if(NR>1){
   total=0
   for (i=8;i<NF;i++) {
      total+=$i #add everything from column 8 to end of file
   }
}
if (NR!=1) 
print total,$7,$4,$5,$6  | "sort -nrk1" #rank will be unsorted, then sorted using termianl commands

if (NR!=1)
print total,$7,$4,$5,$6,NR-1
}
END{

}


