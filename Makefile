.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv > ranking.txt | sort -nrk5 | tee ranking.tx
	sort -k5,5 -k2,2rn ranking.txt > TempRanks.txt
	cat  proj1/title TempRanks.txt
p2:
	@echo "Running AWK Script proj2: "
#	awk -f proj2/awk_script/prog.awk data/data.csv | sort -nrk5 |  tee  > proj2/ranking.txt
	awk -f proj2/awk_script/prog.awk data/data.csv > proj2/output_file/report.csv
	awk -f proj2/awk_script/ranking.awk proj2/output_file/report.csv > proj2/output_file/sortedreport.csv
	awk -f proj2/awk_script/top3.awk proj2/output_file/sortedreport.csv > proj2/output_file/top3.csv
	awk -f proj2/awk_script/Racer.awk data/data.csv > proj2/output_file/rankRacer.csv
	awk -f proj2/awk_script/Engine.awk data/data.csv > proj2/output_file/rankEngine.csv
	awk -f proj2/awk_script/Body_Frame.awk data/data.csv > proj2/output_file/rankBody_Frame.csv
	awk -f proj2/awk_script/top3Mods_Overall.awk data/data.csv > proj2/output_file/top3Mods_Overall.csv
	awk -f proj2/awk_script/Mods.awk data/data.csv > proj2/output_file/rankMods.csv
	awk -f proj2/awk_script/Car_Overall.awk data/data.csv > proj2/output_file/rankCar_Overall.csv
	awk -f proj2/awk_script/option.awk data/data.csv

p3:
	@echo "Running AWK Script proj3: "
	#Runs shell script of menu
	bash menu.sh
