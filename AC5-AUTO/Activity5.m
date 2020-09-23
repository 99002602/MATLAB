% Create a text file and save it in your system. Write a MATLAB automation script to read the file and
% manipulate it and save the manipulated file in the same folder with a
% given filename.

% Popular social networking application Instagram was earlier called Burbn. 
% Activity5.txt contains a few lines about Instagram.

% This automation script is used to replace all instances of the word
% 'Instagram' in Activity5.txt with 'Burbn'.

clear all;
clc;
text=fileread('Activity5.txt');
oldStr = 'Instagram';
newStr = 'Burbn';
newtext = strrep(text,oldStr,newStr);
Lines = strsplit(newtext,'\n');
dlmwrite('Replaced.txt',Lines,'');