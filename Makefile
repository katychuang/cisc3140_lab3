.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p2:
	@echo "Running AWK Script proj2: "
	# awk -f proj2/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx
	
	# run awk script and print output to report.csv
	awk -f proj2/prog.awk data/data.csv > proj2/report.csv

	# paste -d' ' <(cut -d' ' -f1-5 proj2/report.csv ) <(cut -d' ' -f6- proj2/report.csv |sort -n) > proj2/sortedreport.csv

	# run awk script to calculate racer total for each car and save output to output1.csv
	awk -f proj2/script1.awk data/data.csv | sort -t, -k2rn > proj2/output1.csv	

	# run awk script to rank cars based on racer total and save output to output2.csv
	awk -f proj2/script2.awk proj2/output1.csv > proj2/output2.csv
	
	# run awk script to print top 3 cars based on racer total and save output to output3.csv
	awk -f proj2/script3.awk proj2/output2.csv > proj2/output3.csv

	# run awk script to calculate engine total for each car and save output to output4.csv
	awk -f proj2/script4.awk data/data.csv | sort -t, -k2rn > proj2/output4.csv

	# run awk script to rank cars based on engine total and save output to output5.csv
	awk -f proj2/script5.awk proj2/output4.csv > proj2/output5.csv

	# run awk script to print top 3 cars based on engine total and save output to output6.csv
	awk -f proj2/script6.awk proj2/output5.csv > proj2/output6.csv

	# run awk script to calculate body frame total for each car and save output to output7.csv
	awk -f proj2/script7.awk data/data.csv | sort -t, -k2rn > proj2/output7.csv

	# run awk script to rank cars based on body frame total and save output to output8.csv
	awk -f proj2/script8.awk proj2/output7.csv > proj2/output8.csv

	# run awk script to print top 3 cars based on body frame total and save output to output9.csv
	awk -f proj2/script9.awk proj2/output8.csv > proj2/output9.csv

	# run awk script to calculate mods total for each car and save output to output10.csv
	awk -f proj2/script10.awk data/data.csv | sort -t, -k2rn > proj2/output10.csv

	# run awk script to rank cars based on mods total and save output to output11.csv
	awk -f proj2/script11.awk proj2/output10.csv > proj2/output11.csv

	# run awk script to print top 3 cars based on mods total and save output to output12.csv
	awk -f proj2/script12.awk proj2/output11.csv > proj2/output12.csv

	# run awk script to calculate mods overall for each car and save output to output13.csv
	awk -f proj2/script13.awk data/data.csv | sort -t, -k2rn > proj2/output13.csv

	# run awk script to rank cars based on mods overall and save output to output14.csv
	awk -f proj2/script14.awk proj2/output13.csv > proj2/output14.csv	

	# run awk script to print top 3 cars based on mods overall and save output to output15.csv
	awk -f proj2/script15.awk proj2/output14.csv > proj2/output15.csv

	# run awk script to calculate car overall for each car and save output to output16.csv
	awk -f proj2/script16.awk data/data.csv | sort -t, -k2rn > proj2/output16.csv	

	# run awk script to rank cars based on mods overall and save output to output17.csv
	awk -f proj2/script17.awk proj2/output16.csv > proj2/output17.csv	

	# run awk script to print top 3 cars based on car overall and save output to outptu18.csv
	awk -f proj2/script18.awk proj2/output17.csv > proj2/output18.csv

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

	#Display the files
	echo "\n\n"
	cat proj3/sorted_ranks
	echo "\n\n"
	cat proj3/top_3
