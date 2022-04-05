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
	#Feature 1(print new classes with highest top 3 cars)

	#Racer class
	awk -f proj3/TotalRacer.awk data/data.csv
	sort -t, -k1 -r -n TotalRacer.csv > sorted_Racer.csv
	#append ranking 
	awk -f proj3/Ranking.awk sorted_Racer.csv > newClass.csv
	echo Top 3 Racer cars:
	echo Ranking,Score,CarId,Year,Make,Model
	head -3 newClass.csv
	echo "\n"

	#caroverall class
	awk -f proj3/TotalCaroverall.awk data/data.csv
	sort -t, -k1 -r -n TotalCaroverall.csv > sorted_Caroverall.csv
	#append ranking 
	awk -f proj3/Ranking.awk sorted_Caroverall.csv > newClass.csv
	echo Top 3 Caroverall cars:
	echo Ranking,Score,CarId,Year,Make,Model
	head -3 newClass.csv
	echo "\n"

	#Engine class
	awk -f proj3/TotalEngine.awk data/data.csv
	sort -t, -k1 -r -n TotalEngine.csv > sorted_Engine.csv
	#append ranking 
	awk -f proj3/Ranking.awk sorted_Engine.csv > newClass.csv
	echo Top 3 Engine cars:
	echo Ranking,Score,CarId,Year,Make,Model
	head -3 newClass.csv
	echo "\n"

	#Bodyframe class
	awk -f proj3/TotalBodyframe.awk data/data.csv
	sort -t, -k1 -r -n TotalBodyframe.csv > sorted_Bodyframe.csv
	#append ranking 
	awk -f proj3/Ranking.awk sorted_Bodyframe.csv > newClass.csv
	echo Top 3 Bodyframe cars:
	echo Ranking,Score,CarId,Year,Make,Model
	head -3 newClass.csv
	echo "\n"

	#Mods class
	awk -f proj3/TotalMods.awk data/data.csv
	sort -t, -k1 -r -n TotalMods.csv > sorted_Mods.csv
	#append ranking 
	awk -f proj3/Ranking.awk sorted_Mods.csv > newClass.csv
	echo Top 3 Mods cars:
	echo Ranking,Score,CarId,Year,Make,Model
	head -3 newClass.csv
	echo "\n"



	#Feature 2(end user defined search)
	awk -f proj3/option.awk data/data.csv
	#sort the file before adding ranking column
	sort -t, -k1 -r -n option.csv > sorted_option.csv
	#append ranking column
	awk -f proj3/Ranking.awk sorted_option.csv > "Ranked_option.csv"
	awk -f proj3/SelectTop.awk Ranked_option.csv 
	#print result for user define seach
	cat result.csv

	#Display the files 
	echo "\n\n"
	#cat proj3/sorted_ranks
	echo "\n\n"
	
 
	
