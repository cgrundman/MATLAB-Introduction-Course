%% SHEET 1
% Please write all commands in the MATLAB editor into separate m-files (one 
% for each function or script) and save it in a folder that you
% specifically dedicate to this workshop. If you don't know how a command 
% is being used type "help [commandname]” into the command window. Comment 
% each code line briefly to document what it is doing.

clc
clear
close all

%% EXERCISE 1

% Part A add all prices into a row vector
prices = [1.55 1.39 -0.50 0.65 2.15 0.79 1.99 2.19 0.99 2.49 0.55 0.79];

% Part B add last for prices to a column vector prices_col
prices_col = [0.99; 2.49; 0.55; 0.79];

% Part C return sizes of prices and prrices_col vectors
size_prices = size(prices);
size_prices_col = size(prices_col);

% Part D calculate sum of prices vector
sum_prices = sum(prices);

% Part E display sum
char_msg = "The sum is:";
disp(char_msg);
disp(sum_prices);

% Part F sort prices vector in ascending order
prices_sorted = sort(prices);

% Part G ouput 5th element of prices vector
prices(5)

% Part H output odd elements of prices vector
prices(1:2:end)

% Part I output 3 highest prices
prices_sorted(end-2:end)

% Part J calculate net price of prices before VAT
net_prices = sum(prices)*(1 - .19);

% Part K find median value
med = median(prices);

%% EXERCISE 2

% a) define row vector v
v = (0:2:10);

% b) define column vector w
w = (0:-1:-5).';

% c) add and subtract v and w
vector_add = v + w.';
vector_subtract = v - w.';

% d) perform element-wise multiplcation
elem_mult_v_w = vector_add.*vector_subtract;

% e) Generate a vector linvec, which contains 5 linearly spaced 
% elements from 0 to 10.
linvec = linspace(0, 10, 5);

% f) double linvec elements
disp(linvec*2)

% g) linvec elements to the power of 1.7
disp(linvec.^1.7)

% h) create a logoarithmically spaced vector from 0.01 to 100 
log_spaces_vector = logspace(-2,2,5);