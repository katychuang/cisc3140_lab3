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
	awk -f proj2/Mods.awk data/data.csv > proj2/rankMods.csv
	awk -f proj2/Car_Overall.awk data/data.csv > proj2/rankCar_Overall.csv
p3:
	@echo "Running AWK Script proj3: "
	bash menu.sh
