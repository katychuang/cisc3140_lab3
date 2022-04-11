BEGIN {

FS = ","
OFS = ","
}
{

#resets count to 1 when theres a new car
    if(make!= $4) {
        count = 1
        make  = $4
    }

#prints the top 3 ranks of each car numbered 1-3
    if(count <= 3) {
        print count,$0
        count++
    }
}
END	{
    
}