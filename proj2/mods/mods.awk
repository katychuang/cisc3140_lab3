#1/bin/awk -f
BEGIN {
    FS=","
    print "Mods_Total","Car_ID","Year","Make","Ranking";
    rank=1
}
{
    mods_total=0
    for (i=25;i<34;i++) {
        mods_total+=$i #add everything from column 25 to 34(excluded)
    }

    if (NR!=1 && $7 !+ "Showcar") print mods_total,$7,$4,$5,"Model",rank++  | "sort -nrk1" #rank will be unsorted, then sorted using termianl commands
}

END{

}
