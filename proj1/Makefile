# As default, shows all rank options
all: rankedOverall racer engine bodyFrame mods carOverall modsOverall topThree

# Displays top 3 cars
rankedOverall:
	@echo Highest Ranked Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k5 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/output.csv 
	@head -3 Sample_outputs/output.csv
	@rm info.csv

# Displays top 3 racers
racer:
	@echo Highest Racer 
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k6 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/RankRacer.csv
	@head -3 Sample_outputs/RankRacer.csv
	@rm info.csv

# Displays top 3 engines
engine:
	@echo Highest Engine
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k7 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/RankEngine.csv
	@head -3 Sample_outputs/RankEngine.csv 
	@rm info.csv

# Displays top 3 body frames
bodyFrame:
	@echo Highest Body Frame
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k8 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/RankBodyFrame.csv
	@head -3 Sample_outputs/RankBodyFrame.csv
	@rm info.csv

# Displays top 3 mods
mods:
	@echo Highest Mods
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k9 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/RankMods.csv
	@head -3 Sample_outputs/RankMods.csv
	@rm info.csv

# Displays top 3 cars overall
carOverall:
	@echo Highest Car Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k10 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/RankCarOverall.csv
	@head -3 Sample_outputs/RankCarOverall.csv
	@rm info.csv

# Displays top 3 mods overall
modsOverall:
	@echo Highest Mods Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k11 -o info.csv info.csv
	@awk -F, 'NR>1{$$1=++i FS $$1;}1' OFS=, info.csv > Sample_outputs/RankModsOverall.csv
	@head -3 Sample_outputs/RankModsOverall.csv
	@rm info.csv

# Top 3 makes
topThree:
	@echo Top 3 Cars in Make
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k3,3 -k5 -o info.csv info.csv
	@awk -f top3.awk info.csv > Sample_outputs/TopThree.csv
	@rm info.csv
