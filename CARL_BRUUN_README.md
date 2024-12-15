# Adding a New Benchmark to DuckDB

**Author: Carl Bruun (carbr@itu.dk)**

Folder: **benchmark/SSB** includes all changes made in DuckDB in accordance with project-2 of Advanced Data Systems at ITU (2024, MSc., ComSci).

## Folders:
- **/answers**
Includes the results of each supported SSB query: Q1.1, Q3.1, and Q4.1.
Three CSV files for each Scaling Factor of the generated SSB dataset is thus included, totalling 9 files used for result verification during benchmark execution. **these can be ignored**


- **/benchmark_sf(*)**
Three .benchmark file exists for each scaling factor, resulting in three different benchmark sf* folders.
Each folder includes three distinct benchmark files, one for each SSB query.
Each .benchmark file specifies a cached DuckDB file to make subsequent executions faster.


- **/queries**
Contains all SQL files:
3 different load scripts - each targeting specific .tbl files in accordance with requested scaling factor - Load scripts are responsible creating the SSB schema and populating it with correct table data.
3 different queries - one for each supported SSB query: Q1.1, Q3.1, and Q4.1.

## How to run:
To run the benchmark, the project must be cloned and build with CMake.

Generated SSB files are too large for Git, as such, navigate to the SSB folder and run:
$ . data_gen.sh

**DO NOTE:**
The script will clone the dbgen generator, https://github.itu.dk/pito/ads2024-ssb-dbgen, if not already cloned.
Also, **ALL** .tbl files for each scaling factor will be generated and inserted within the SSB folder, approximately 74GB, so please change the scaling factors included within the script before executin it :) 





