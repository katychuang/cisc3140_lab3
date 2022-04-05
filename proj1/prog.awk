BEGIN { FS=",";
	OFS=",";
	sum = 0;
  racerSum = 0;
  engineSum = 0;
  bodyFrameSum = 0;
  modsSum = 0; }
NR==1 {next}
{ 
  for(i = 10; i <= NF; i++) { sum = sum + $i };
for(i = 10; i < 14; i++) { racerSum = racerSsum + $i };
for(i = 15; i < 20; i++) { engineSum = engineSsum + $i };
for(i = 20; i < 25; i++) { bodyFrameSum = bodyFrameSum + $i };
for(i = 25; i <= NF; i++) { modsSum = modsSum + $i };
  print $7, $4, $5, $6, sum, racerSum, engineSum, bodyFrameSum, modsSum, $14, $NF;
  sum = 0;
  racerSum = 0;
  engineSum = 0;
  bodyFrameSum = 0;
  modsSum = 0;
} 
END {
}

