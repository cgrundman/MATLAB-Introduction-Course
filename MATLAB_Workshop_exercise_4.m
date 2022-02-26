%% Sheet 4 – Functions and basic plotting

% Please write all commands in the MATLAB editor into separate m-files
% and save it in a folder that you specifically dedicate to this workshop. 
% If you don t know how a command is being used type "help [commandname]” 
% into the command window. Comment each code line briefly to document what 
% it is doing.

clc
clear
close all

%% Exercise 1:

% Write a function called my_norm_p. This function should accept as input
% a (row or column) vector x and as a second argument the order p according 
% to the p-norm. The function should output the p-norm. Hereby, n is the 
% number of elements of the vector x. When finished with the function, 
% write a script generating a 1000-element normally distributed vector and 
% calling your function my_norm_p to calculate the 1-norm, 2-norm, 3-norm, 
% and 4 norm from this vector.

row_x = 1000;
col_x = 1;
x = randn(row_x,col_x);
for p = 1:4
    my_p_norm(x, p)
end

%% Exercise 2:

% MATLAB contains pre-installed audio-data that can be loaded into the
% workspace.
% a) Type load handel.mat to receive a mono audio signal y and its sampling 
% frequency Fs.

load handel.mat

% b) Plot the signal y with a correct time axis as abscissa.
% c) Attenuate the signal y by a factor of 8 and plot the result on top of
% the original signal using a different color.

[a, b] = size(y);
t = [1:1:a]'./Fs;
ascissa = plot(t,8*y,'b',t,y,'r');

% d) Add title, labels, a grid, and add a legend that explains what each
% curve means. The legend should not cover any part of any curve. Use 
% commands in the m-file to do this.

axis([0 9 -8 10])
title('Sound')
legend('8*y','y')
xlabel('Time (s)')
ylabel('Frequency (Fs)')

% e) Listen to the signal with sound.

sound(y, Fs)

%% Exercise 3 (optional):

% a) Show that y = e^-x" will show up as a straight line in a 
% semilogarithmic plot. In that, mark the single data points with a symbol 
% of your choice.



% b) Find an example for a function that only shows up as a straight line
% in a double-logarithmic plot and prove it with MATLAB. What does the 
% slope of that function in a double-logarithmic plot tell?



%% Functions

% Function of my_p_norm calculates the norm of input vector "x". 

function p_norm = my_p_norm(x, p)
    p_norm = (sum(abs(x).^p))^(1/p);
end
