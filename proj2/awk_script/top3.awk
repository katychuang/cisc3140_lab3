BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","
}
{
# prints the first 4 lines
if(count <= 3) {print; count++}
}
END{
}
