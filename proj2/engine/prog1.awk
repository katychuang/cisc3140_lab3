#1/bin/awk -f
BEGIN {
FS=","
print "Engine_Total","Car_ID","Year","Make","Ranking";
rank=1
}

{
    engine_total=0
    for (i=15;i<20;i++) {
        engine_total+=$i #add everything from column 15 to column 20
    }

    if (NR!=1 && $7!="Showcar")  print engine_total,$7,$4,$5,"Model",rank++ | "sort -nrk1" #rank will be unsorted, then sorted using terminal commands
}

END {

}
