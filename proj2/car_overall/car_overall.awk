#1/bin/awk -f
BEGIN {
    FS=","
    print "Car_Overall_Total","Car_ID","Year","Make","Ranking";
    rank=1
}
{
    car_overall = $14 #gets data from column 14 (car_overall)

    if (NR!=1 && $7 != "Showcar") print car_overall,$7,$4,$5,"Model",rank++  | "sort -nrk1" #rank will be unsorted, then sorted using termianl commands
}

END{

}
