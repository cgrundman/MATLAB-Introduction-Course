function [patient] = patientdata(file)
% Input the file between '', like 'file.m'
patient_data = importdata(file);
for i = 1:length(patient_data)-1
    iter = i + 1;
    patients(i,:) = strsplit(char(patient_data(iter)));
end
fields = strsplit(char(patient_data(1)));
patient = cell2struct(patients, fields,2);