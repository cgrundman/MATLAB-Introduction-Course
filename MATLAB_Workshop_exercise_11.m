%% Sheet 11 – Functions, Structs, File I/O
% Please write all commands in the MATLAB editor into separate m-files (one 
% for each function or script) and save it in a folder that you
% specifically dedicate to this workshop. If you don't know how a command 
% is being used type "help [commandname]” into the command window. Comment 
% each code line briefly to document what it is doing.

clc
clear
close all

%% Exercise 1:
% Create a function that reads in patient data from the text file
% allpatientdata.m provided in the Lernraum. The function should get
% as an input the file name of the txt-file. The function should output a
% struct array with all the information provided in the text file. Name the
% field names of the struct in an intuitive way.

[patient] = patientdata('allpatientdata.m');
patient(1).Name
patient(1).Gender
patient(6).Height

%% Exercise 2:
% Download the patient_info.zip from the Lernraum. It contains pictures and 
% sound files (voice samples) from each patient. The file name indicates 
% the patient s ID number. Read in these files into MATLAB and add this 
% data to the struct array from exercise 1. Use a loop to do this task.

read = dir('patient_info');
iter = 0;
i = 3;
    [patient] = patientdata('allpatientdata.m');
while iter < 6
    iter = iter + 1;
    img = imread(read(i).name);
    [sounds,fs] = audioread(read(i+1).name);
    patient(iter).img = img;
    patient(iter).sounds = sounds;
    patient(iter).fs = fs;
    i = i + 2;
end

