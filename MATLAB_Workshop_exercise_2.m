%% Sheet 2 – Basic functions for vectors and matrices

clc
clear
close all

%% Exercise 1
% a) Generate a vector with 1000 normally distributed random numbers with 
% an average value of 5 and a standard deviation of 0.01.

x = .01.*randn(1000, 1) + 5;

% b) From the vector in a) generate a new vector that contains its elements 
% rounded to the first digit after the decimal dot.

y = round(x, 1);

% c) Compare mean and standard deviation from both vectors (rounded and 
% original).

stats_x = [mean(x) std(x) var(x)];
stats_y = [mean(y) std(y) var(y)];

%% Exercise 2:
% Find the projection of vector a = [3.5355, 3.5355] onto 
% b = [4.9497, -0.7071]

a = [3.5355, 3.5355];
b = [4.9497, -0.7071];
cos_theta = dot(a,b)/(norm(a)*norm(b));
theta_rad = acos(cos_theta);
proj_a_onto_b = norm(a)*cos(theta_rad);

%% Exercise 3:
% Given the matrix A = [2 4 1; 6 7 2; 3 5 9]
% a) assign the first row of A to a vector called x1

A = [2 4 1; 6 7 2; 3 5 9];
x1 = A(1,:);

% b) assign the last two rows of A to a matrix called y

y = A(end-1:end,:);

% c) compute the sum over the columns of A

sum_col1 = sum(A(:,1));
sum_col2 = sum(A(:,2));
sum_col3 = sum(A(:,3));

% d) compute the sum over the rows of A

sum_row1 = sum(A(1,:));
sum_row2 = sum(A(2,:));
sum_row3 = sum(A(3,:));

% e) compute the standard error of the mean of each column of A

stan_err = std(A,0,1)/sqrt(size(A,1));
