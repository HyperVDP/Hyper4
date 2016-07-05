# HyPer4 Analysis Tools

The tools in this directory automate the analysis of HyPer4.  Currently implemented:

1. gen\_configs.sh: Generates HyPer4 source code configurations for a range of match-action stages and maximum number of primitives permitted per stage.  All configurations are placed in their own folder, hp4/p4src/test/config\_XY, where X is the maximum number of stages and Y is the maximum number of primitives per stage.  To use this script, include a value for X as the first command line argument and a value for Y as the second.  All configurations config\_<1 ... X><1 ... Y> will be generated.  At the same time, gen\_configs.sh invokes CLOC to count the lines of code, generating two reports in results\_byfile.csv and results\_sum.csv.  These are parsed by locs\_reporter.py and locs\_reporter\_prims.py.  The last thing gen\_configs.sh does for each configuration is use grep to count the number of table declarations across all .p4 files in the configuration.
2. locs\_reporter.py: Generates a summary .csv report, results\_sum.csv, of the lines of code for every configuration of HyPer4 in the hp4/p4src/test directory.
3. locs\_reporter\_prims.py: Generates a summary .csv report, results\_prims.csv, of the averages lines of code required per implemented primitive for every configuration of HyPer4 in the hp4/p4src/test directory.  Assumes that the currently implemented primitives are modify\_field, add\_header, add\_to\_field, truncate, and drop.
4. tables\_reporter.py: Generates a summary .csv report, results\_tables.csv, of the number of table declarations present in every configuration of HyPer4 in the hp4/p4src/test directory.

## Instructions

First, run gen\_configs.sh:
```bash
gen_configs.sh <max stages> <max primitives per stage>
```

Second, run any of the other three tools in any order as necessary, supplying --numstages and --nuprimitives arguments, e.g.,:
```bash
locs_reporter.py --numstages 3 --numprimitives 3
```
