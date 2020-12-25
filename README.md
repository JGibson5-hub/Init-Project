# Introduction
The following scripts are useful for setting up a project structure and getting tallies to be processed from MNCP ".io" files.
I put as much parameter info in the filename itself then strip the filename

## init_Project.m
This script creates the general folder structure/workflow I use for pulling Tallies from MCNP and putting the data in one folder.
The workflow can be extended to experiments as well.  This workflow:
* Puts details of the model in the filename itself
* Uses the makeTable script to interpret what the filename means
* Process simply generates the table and processes it.  
* There are commented snippets of code in the process file specific to common operations

## getTally.m
need to update

## makeTable.m
need to update