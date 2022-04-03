.PHONY: all

# As default 'make' target, run all targets
all: p1 p2 p3

p1:
	@echo "Running AWK Script proj1: "
	awk -f proj1/prog.awk data/data.csv | sort -nrk5 | tee ranking.tx

p2:
	@echo "Running AWK Script proj2: "
	awk -f proj2/prog.awk data/data.csv | sort -nrk5 |  tee  > proj2/ranking.txt
	awk -f proj2/top3Mods_Overall.awk data/data.csv > proj2/top3Mods_Overall.csv

p3:
	@echo "Running AWK Script proj3: "
	bash menu.sh
