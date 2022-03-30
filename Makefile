.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p2:
	@echo "Running AWK Script proj2: "
	awk -f proj2/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p3:
	@echo "Running AWK Script proj3: "
	#awk file produces three seperate files: top_3, ranks, and headers (headers added to the final files)
	awk -f proj3/prog1.awk data/data.csv

	#moved to proj3 directory
	mv top_3 proj3
	mv ranks proj3 
	mv headers proj3

	#sorts ranks in descending order via scores and placed in a 
	#new file: sorted_ranks. Sorts top_3 via maker first then ranks
	sort -k5,5rn -t '|' proj3/ranks > "sorted_ranks"
	sort -k3,3 -k5,5rn -t '|' proj3/top_3 > "top_3"

	#moved to proj3 directory
	mv sorted_ranks proj3 
	mv top_3 proj3 
	#awk file to only take top three cars for each maker
 #	awk -f proj3/top_3.awk proj3/top_3

	#Adding headers to final files
	cat proj3/headers proj3/sorted_ranks > "sorted_ranks"
	cat proj3/headers proj3/top_3 > "top_3"
	#moved to proj3 directory
	mv sorted_ranks proj3 
	mv top_3 proj3
	
	#Group work:
	awk -f proj3/TotalRacer.awk data/data.csv
	sort -t, -k1 -r -n TotalRacer.csv > sorted_Racer.csv
	awk -f proj3/RacerRanking.awk sorted_Racer.csv 
	awk -f proj3/SelectTop3.awk RacerRank.csv > Top3RacerCar.csv

	#Display the files
	echo "\n\n"
	#cat proj3/sorted_ranks
	echo "\n\n"
	#cat
 
	#Group work:
	#print result for Racer class
	cat Top3RacerCar.csv
