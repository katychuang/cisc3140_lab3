#1/bin/awk -f
#top three overall cars
BEGIN{
FS=","
print "Total","Car_ID","Year","Make","Model--Ranking";
rank=1
}
{

total=0
for (i=8;i<NF;i++) {
total+=$i #add everything from column 8 to end of file and makes the total for top three cars
}

if (NR!=1) print total,$7,$4,$5,"Model",rank++  | "sort -nrk1" #rank will be unsorted, then sorted using termianl commands
}

END{

}
