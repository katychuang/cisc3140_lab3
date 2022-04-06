BEGIN {
FPAT = "([^,]+)|(\"[^\"]+\")"
FS = ","
}
{
if(count <= 3) {print; count++}
}
END{
}
