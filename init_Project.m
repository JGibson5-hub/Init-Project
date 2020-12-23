% The following is a script to standardize all the directories in a work flow
% All the main scripts go in Analysis which will be tracked with git
% all machine created files will not be tracked unless to validate

direc = 'C:\Target\Directory';
mkdir(direc);
mkdir([direc '\Data']);
mkdir([direc '\Analysis']);
mkdir([direc '\Models']);
mkdir([direc '\Figures']);

currentDocNum = 'xxx';
fname = ['Document Template.docx' currentDocNum '.docx'];
copyfile('Document Template.docx',fname);
copyfile(fname,direc);
copyfile('process.m',[direc '\Analysis']);
% Work flow is to dump data into one directory and use tables (MATLAB) to track data
% Will convert to Pandas DataFrame for implementation in Python
copyfile('getMCNPTally.m',[direc '\Analysis']);
copyfile('makeParamTable.m',[direc '\Analysis']);