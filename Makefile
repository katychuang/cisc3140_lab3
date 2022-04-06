.PHONY: all

# As default 'make' target, run all targets
# This would mean that all proj1, proj2, and proj3 will be run in the three projects.

all: proj1 proj2 proj3

# Each targets will allow for the activation of the AWK scripts in every project subfolders as well as the additional feature scripts.

# In proj1 target using 'make proj1', it allows for the scripts to run which then outputs the parsed data into a .txt document named ranking. 

proj1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.txt

# This target allows for 'make proj2' to activate which runs each script from the subfolder proj2 and outputs it into a .txt document as well. 

proj2:
	@echo "Running AWK Script proj2: "
	awk -f proj2/prog.awk data/data.csv | sort -nrk5 | tee ranking.txt

# proj3 target allows for 'make proj3' to activate. This will allow for the two AWK programs within the subfolder to activate and sorts the data from the data.csv table.

proj3:
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

	#Display the files
	echo "\n\n"
	cat proj3/sorted_ranks
	echo "\n\n"
	cat proj3/top_3
