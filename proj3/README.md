# proj3
Contributor: Huang Yan, Mohammed Alam

`data.csv` file contains information of cars and owners

* Using the provided `data.csv` file, extract relevant fields.
* Sum up the relevant fields to get a score used to rank each car.
* Sort in descending order using scores and set in a seperate file (sorted_ranks)
* To get the top three cars of each maker, sort by maker first then ranking
* At the end, will display the original set of data
* Followed by the sorted ranks in descending order
* Followed by the top three cars of each maker

Group new featrues:
* 1) Using `data.csv` file extract top 3 cars for each following new classes:
* Racer
* Caroverall
* Engine
* Bodyframe
* Mods
* 2) Enable end user modified search for cars with dependencies:
* Brand
* Year
* Amount of cars for display

**Files and Directory:**

```
.
|-- Makefile
|-- README.md
|-- data/
|   `-- data.csv
|-- proj1/
|-- proj2/
`-- proj3/
    |-- data/
        data.csv
    |-- README.md
    |-- prog1.awk
    |-- prog2.awk
    |-- TotalRacer.awk
    |-- TotalCaroverall.awk
    |-- TotalEngine.awk
    |-- TotalBodyframe.awk
    |-- TotalMods.awk
    |-- Ranking.awk
    |-- option.awk
    `-- SelectTop.awk
```

Instructions: run comand `make p3 -s` from root directory
