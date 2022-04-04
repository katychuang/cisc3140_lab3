lab1:
	@echo Highest Racer
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k5 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@echo Highest Engine
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k6 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@echo Highest Engine
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k7 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@echo Highest Body Frame
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k8 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@echo Highest Mods
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k9 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@echo Highest Car  Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k10 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@echo Highest Mods Overall
	@awk -f prog.awk ../data/data.csv > info.csv
	@sort -V -r -t"," -k11 -o info.csv info.csv
	@awk -F, '{$$1=++i FS $$1;}1' OFS=, info.csv > output.csv
	@head -3 output.csv
	@rm info.csv
