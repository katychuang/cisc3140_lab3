# proj3


#Lab One - Description#

`data.csv` file contains information of cars and owners

* Using the provided `data.csv` file, extract relevant fields.
* Sum up the relevant fields to get a score used to rank each car.
* Sort in descending order using scores and set in a seperate file (sorted_ranks)
* To get the top three cars of each maker, sort by maker first then ranking
* At the end, will display the original set of data
* Followed by the sorted ranks in descending order
* Followed by the top three cars of each maker

#Lab Three - New Features#

* User Interface is now formatted as a shell script menu to run all operations
* Seperate aggregate scores for specific classes (Racer, Engine, Body Frame, Mods, Mods Overall, Car Overall)
* Display all Cars in the show
* Gives user ability to customize the number of cars displayed (1-10)
* Gives user ability to customize which car maker to display in Third option

#Installation#
* Used on Linux System
* AWK - sudo apt-get install gawk
* Make - sudo apt-get install build-essential

#Usage#
* Intended as a car show program that runs basic queries

#Files and Directory#

```
.
|-- menu.sh
|-- Makefile
|-- README.md
|-- data/
|   `-- data.csv
|-- proj1/
|-- proj2/
`-- proj3/
    |-- README.md
    |-- prog1.awk
    |-- prog2.awk
    |-- prog3.awk
    `-- prog4.awk


4 directories, 13 files
```

#Instructions#
* From Terminal, Run command `make p3` or `bash menu.sh` in root directory of program

#Authors and Acknowledgement
* Members of the group that contributed to the lab exercise
* *Huimin*
* *Jiao Jiao*
* *Naldy*
* *Jinwei*
* *Armando*
* *Jiayi*
* *Kamille*


