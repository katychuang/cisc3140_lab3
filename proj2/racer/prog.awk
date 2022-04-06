#1/bin/awk -f
#Created by Tahamina and Kristy
BEGIN {
FS=","
print "Racer_Total","Car_ID","Year","Make","Ranking";
rank=1
}

{
    racer_total=0
    for (i=10;i<14;i++) {
        racer_total+=$i #add everything from column 10 to column 13
    }

    if (NR!=1 && $7!="Showcar")  print racer_total,$7,$4,$5,"Model",rank++ | "sort -nrk1" #rank will be unsorted, then sorted using terminal commands
}

END {

}
