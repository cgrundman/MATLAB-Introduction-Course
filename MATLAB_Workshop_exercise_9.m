%% Sheet 9 – while and for-loops
% Please write all commands in the MATLAB editor into one single m-file and 
% save it in a folder that you specifically dedicate to this workshop. If
% you don t know how a command is being used type “help [commandname]” into 
% the command window. Comment each code line briefly to document what it is 
% doing.

clc
clear
close all

%% Exercise 1:
% Find out the 1000th number in the Fibonacci-sequence.

last_digit = 1000;
A = zeros(last_digit, 1);
A(2) = 1;
for i = 3:last_digit
    A(i) = A(i - 1) + A(i - 2);
end
disp(A(1000))

%% Exercise 2:
% Proof numerically that

%   inf
%    E (1/2)^n
%   n=1

% is a finite number. For that, set an arbitrary (modestly high) upper 
% limit of that sum and calculate the sum up to that limit in a loop to get 
% the most probable limit value. Then design a while-loop that calculates 
% the sum indefinitely. It should only be exited if the probable limit 
% value is exceeded. Display a counter variable on the screen to see up to 
% which value the sum has already been calculated.

B = 0;
counter = 1;
while B < 1.001 && counter < 100000
    B = B + (1/2)^counter;
    counter = counter + 1;
end
disp(B)
disp(counter)

%% Exercise 3:
% Proof numerically that

%  inf
%   S 10/x dx
%   0

% does not converge. For that, approximate the integral with a sum.

f=@(x) 10/x;
tol = 1e-30;
count_max = 1000;
count = 0;
x0 = 1;
f0 = f(x0);
x1 = 30;
f1 = f(x1);
while (abs(f1) > tol) && (count < count_max)
    count = count + 1;
      df = f1 - f0;
      dx = x1 - x0;
      x0 = x1;
      f0 = f1;
      x1 = x1 - f1*dx/df;
      f1 = f(x1);
end
disp(x1)
disp(count)

% The value of the intergral increases such that at every increased
% interval, the integral grows by at least a power of magnitude.
