.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p2:
	@echo "Running AWK Script proj2: "
	awk -f proj2/prog.awk data/data.csv | sort -nrk5 |  tee  > proj2/ranking.txt
	awk -f proj2/Racer.awk data/data.csv > proj2/rankRacer.csv
	awk -f proj2/Engine.awk data/data.csv > proj2/rankEngine.csv
	awk -f proj2/Body_Frame.awk data/data.csv > proj2/rankBody_Frame.csv
	awk -f proj2/top3Mods_Overall.awk data/data.csv > proj2/top3Mods_Overall.csv

p3:
	@echo "Running AWK Script proj3: "
	#Makefile needs to be cleaned up
	#awk file produces three seperate files: top_3, ranks, and headers (headers added to the final files)
	awk -f proj3/prog1.awk data/data.csv

	#moved to proj3 directory
	mv top_3 proj3
	mv ranks proj3 
	mv headers proj3

	#sorts ranks in descending order via scores and placed in a 
	#new file: sorted_ranks. Sorts top_3 via maker first then ranks
	sort -k1,1rn proj3/ranks > "sorted_ranks"
	sort -k4,4 -k1,1rn proj3/top_3 > "top_3"

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

	#Display the files
	echo "\n\n"
	#Display cars sorted by score in Descending order
	cat proj3/sorted_ranks
	#grep -A3 "Make" proj3/sorted_ranks
	echo "\n\n"
	#Displays only the top 3 cars for each Maker
	awk -f proj3/prog2.awk proj3/top_3
	
############################################################################
	#Lab3 
	awk -f proj3/prog3.awk data/data.csv
	mv classScore proj3 | mv headers2 proj3
	sort -k2,2rn proj3/classScore > proj3/tmpS
	cat proj3/headers2 proj3/tmpS > proj3/classScore
	rm proj3/tmpS
	grep -A3 "Score" proj3/classScore
