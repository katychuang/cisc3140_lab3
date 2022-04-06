# As default, shows all rank options
all: rankedOverall racer engine bodyFrame mods carOverall modsOverall

# Displays top 3 cars
rankedOverall:
	@echo Highest Ranked Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k5 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv 
	@head -3 output.csv
	@rm info.csv

# Displays top 3 racers
racer:
	@echo Highest Racer i
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k6 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > RankRacer.csv
	@head -3 RankRacer.csv
	@rm info.csv

# Displays top 3 engines
engine:
	@echo Highest Engine
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k7 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > RankEngine.csv
	@head -3 RankEngine.csv 
	@rm info.csv

# Displays top 3 body frames
bodyFrame:
	@echo Highest Body Frame
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k8 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > RankBodyFrame.csv
	@head -3 RankBodyFrame.csv
	@rm info.csv

# Displays top 3 mods
mods:
	@echo Highest Mods
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k9 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > RankMods.csv
	@head -3 RankMods.csv
	@rm info.csv

# Displays top 3 cars overall
carOverall:
	@echo Highest Car Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k10 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > RankCarOverall.csv
	@head -3 RankCarOverall.csv
	@rm info.csv

# Displays top 3 mods overall
modsOverall:
	@echo Highest Mods Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k11 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > RankModsOverall.csv
	@head -3 RankModsOverall.csv
	@rm info.csv
