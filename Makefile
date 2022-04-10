.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p2:
	@echo "Running AWK Script proj2: "
	awk -f proj2/prog2.awk data/data.csv

	# user options to rank cars
	awk -f proj2/useroption.awk data/data.csv
	sort -t, -k1 -r -n useroption.csv > sorted_option.csv
	awk -f proj3/Ranking.awk sorted_option.csv 
	awk -f proj2/top.awk Ranked_option.csv
	# print result for user defined seach
	cat result.csv

p3:
	@echo "Running AWK Script proj3: "
	#awk file produces three seperate files: top_3, ranks, and headers (headers added to the final files)
	#awk -f proj3/prog1.awk data/data.csv

	#moved to proj3 directory
	#mv top_3 proj3
	#mv ranks proj3 
	#mv headers proj3

	#sorts ranks in descending order via scores and placed in a 
	#new file: sorted_ranks. Sorts top_3 via maker first then ranks
	#sort -k5,5rn -t '|' proj3/ranks > "sorted_ranks"
	#sort -k3,3 -k5,5rn -t '|' proj3/top_3 > "top_3"

	#moved to proj3 directory
	#mv sorted_ranks proj3 
	#mv top_3 proj3 
	#awk file to only take top three cars for each maker
 #	awk -f proj3/top_3.awk proj3/top_3

	#Adding headers to final files
	#cat proj3/headers proj3/sorted_ranks > "sorted_ranks"
	#cat proj3/headers proj3/top_3 > "top_3"
	#moved to proj3 directory
	#mv sorted_ranks proj3 
	#mv top_3 proj3
	
	#Group work:
	#feature 1(print caroverall with top 3 cars each make)
	
	awk -f proj3/TotalCaroverall.awk data/data.csv
	sort -t, -k4,4 -r -k1nr,1  TotalCaroverall.csv > sorted_Caroverall.csv
	#Top3 car per make
	#append header
	awk '{print $0}' proj3/header.csv > CaroverallClassPermake.csv
	awk -f proj3/Top3permake.awk sorted_Caroverall.csv >> CaroverallClassPermake.csv
	echo Top 3 Caroverall cars per make:
	cat CaroverallClassPermake.csv
	rm TotalCaroverall.csv
	rm sorted_Caroverall.csv
	mv CaroverallClassPermake.csv proj3/sampleOP
	echo "\n"

	#Feature 1(print new classes with highest top 3 cars)

	#Racer class
	awk -f proj3/TotalRacer.awk data/data.csv
	sort -t, -k1 -r -n TotalRacer.csv > sorted_Racer.csv
	#append ranking and header
	awk '{print $0}' proj3/header.csv >RacerClass.csv
	awk -f proj3/Ranking.awk sorted_Racer.csv >> RacerClass.csv
	echo Top 3 Racer cars:
	head -4 RacerClass.csv
	rm TotalRacer.csv
	rm sorted_Racer.csv
	mv RacerClass.csv proj3/sampleOP
	echo "\n"

	#caroverall class
	awk -f proj3/TotalCaroverall.awk data/data.csv
	sort -t, -k1 -r -n TotalCaroverall.csv > sorted_Caroverall.csv
	#append ranking and header
	awk '{print $0}' proj3/header.csv > CaroverallClass.csv
	awk -f proj3/Ranking.awk sorted_Caroverall.csv >> CaroverallClass.csv
	echo Top 3 Caroverall cars:
	head -4 CaroverallClass.csv
	rm TotalCaroverall.csv
	rm sorted_Caroverall.csv
	mv CaroverallClass.csv proj3/sampleOP
	echo "\n"

	#Engine class
	awk -f proj3/TotalEngine.awk data/data.csv
	sort -t, -k1 -r -n TotalEngine.csv > sorted_Engine.csv
	#append ranking and header
	awk '{print $0}' proj3/header.csv > EngineClass.csv
	awk -f proj3/Ranking.awk sorted_Engine.csv >> EngineClass.csv
	echo Top 3 Engine cars:
	head -4 EngineClass.csv
	rm TotalEngine.csv
	rm sorted_Engine.csv
	mv EngineClass.csv proj3/sampleOP
	echo "\n"

	#Bodyframe class
	awk -f proj3/TotalBodyframe.awk data/data.csv
	sort -t, -k1 -r -n TotalBodyframe.csv > sorted_Bodyframe.csv
	#append ranking and header
	awk '{print $0}' proj3/header.csv > BodyframeClass.csv
	awk -f proj3/Ranking.awk sorted_Bodyframe.csv >> BodyframeClass.csv
	echo Top 3 Bodyframe cars:
	head -4 BodyframeClass.csv
	rm TotalBodyframe.csv
	rm sorted_Bodyframe.csv
	mv BodyframeClass.csv proj3/sampleOP
	echo "\n"

	#Mods class
	awk -f proj3/TotalMods.awk data/data.csv
	sort -t, -k1 -r -n TotalMods.csv > sorted_Mods.csv
	#append ranking and header
	awk '{print $0}' proj3/header.csv > ModsClass.csv
	awk -f proj3/Ranking.awk sorted_Mods.csv >> ModsClass.csv
	echo Top 3 Mods cars:
	head -4 ModsClass.csv
	rm TotalMods.csv
	rm sorted_Mods.csv
	mv ModsClass.csv proj3/sampleOP
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
	rm option.csv
	rm Ranked_option.csv
	rm sorted_option.csv
	mv result.csv proj3

	#Display the files 
	echo "\n\n"
	#cat proj3/sorted_ranks
	echo "\n\n"
