.PHONY: all

all: run

run:
	@echo "Running AWK script proj1:"
	awk -f ./awk/code.awk ../data/data.csv > ./output/output.csv
	@echo "Running AWK sort script: "
	awk -f ./awk/sort.awk ./output/output.csv > ./output/sorted.csv
