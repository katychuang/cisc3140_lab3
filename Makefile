.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3


p1:
	@echo "Running AWK Program script proj1: "
	awk -f proj1/awk/prog.awk data/data.csv > proj1/output/output.csv
	@echo "Running AWK Sort script proj1: "
	awk -f proj1/awk/sort.awk proj1/output/output.csv > proj1/output/sorted.csv
	@echo "Running AWK Classes script proj1: "
	awk -f proj1/awk/classes.awk data/data.csv > proj1/output/classes.csv
p2:
	@echo "Running AWK Script proj2: "
	awk -f proj2/awk/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p3:
	@echo "Running AWK Script proj3: "
	#awk file produces three seperate files: top_3, ranks, and headers (headers added to the final files)
	awk -f proj3/awk/prog1.awk data/data.csv

	#moved to proj3 directory
	mv top_3 proj3
	mv ranks proj3 
	mv headers proj3

	#sorts ranks in descending order via scores and placed in a 
	#new file: sorted_ranks.
	sort -k5,5rn -t ',' proj3/ranks.csv > "proj3/Output/sorted_ranks.csv"

	# Sorts top_3 via make first then ranks, prints top 3 cars of each make
	sort -k3,3 -k5,5rn -t ',' proj3/top_3.csv | awk -f proj3/awk/AddRanking.awk | \
	awk -f proj3/awk/SortTotal.awk > "proj3/Output/top_3_by_make.csv" 

	#Adding headers to final files
	cat proj3/headers.csv proj3/Output/sorted_ranks.csv > "sorted_ranks.csv"
	cat proj3/headers.csv proj3/Output/top_3_by_make.csv > "top_3_by_make.csv"
	#moved to proj3 directory
	mv sorted_ranks.csv proj3/Output
	mv top_3_by_make.csv proj3/Output

	#Display the files
	echo "\nSorted Ranks\n"
	cat proj3/Output/sorted_ranks.csv
	echo "\nTop 3 of each make\n"
	cat proj3/Output/top_3_by_make.csv
