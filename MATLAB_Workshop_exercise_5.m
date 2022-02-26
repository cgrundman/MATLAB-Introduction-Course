%% Sheet 5 – Plotting – subplots

% Please write all commands in the MATLAB editor into one single m-file and 
% save it in a folder that you specifically dedicate to this workshop. If
% you don t know how a command is being used type “help [commandname]” into 
% the command window. Comment each code line briefly to document what it is 
% doing.

clc
clear
close all

%% Exercise 1:

% Plot the function y = sin(pi/2*x) in the range of x in [-10;10]
% a) Using the plot command

x = -10:.001:10;
y = sin(pi/2*x);
plot_1 = plot(x, y);
axis([-10 10 -1.25 1.25])
title('y = sin(pi/2*x)')
xlabel('x')
ylabel('y')
grid on

% b) Using the ezplot command

figure()
plot_2 = ezplot('sin(pi*x/2)', [-10 10]);
axis([-10 10 -1.25 1.25])
title('y = sin(pi/2*x)')
xlabel('x')
ylabel('y')
grid on

% c) Add title, labels and modify the limits of x and y-axis such that both
% figures look the same. Use commands in the m-file line to do this.

%% Exercise 2 (similar to Exercise 3 of sheet #4):

% a) Create a figure window containing space for 6 subplots using 2 rows
% and 3 columns.

% b) Show that y = e^-x will show up as a straight line in a 
% semilogarithmic plot by plotting it into the first subplot (with single
% data points). In that, mark the single data points with a symbol of your 
% choice.

% c) Find an example for a function that only shows up as a straight line
% in a double-logarithmic plot and prove it with MATLAB. For that, use the 
% subplot elements 2, 3, 4, and 5 and plot your function with double-linear 
% axis, semilogarithmic in x, and in y direction, and double-logarithmic.

figure()
subplot(2,3,1);
x = 1:100;
y = exp(-x);
semilogy(x, y, 'b')
grid on
axis_handle1 = get(gcf, 'children');

subplot(2, 3, 2);
y = x.^2;
plot(x, y, 'r')
grid on
axis_handle2 = get(gcf, 'children');

subplot(2, 3, 3);
semilogx(x, y, 'g')
grid on
axis_handle3 = get(gcf, 'children');

subplot(2, 3, 4);
loglog(x, y, 'b')
grid on
axis_handle4 = get(gcf, 'children');

subplot(2, 3, 5);
semilogy(x, y, 'r')
grid on
axis_handle5 = get(gcf, 'children');

%% Exercise 3:

% a) From the figure created in Exercise 1, assign the figure handle, and
% the axes handles to newly created variables, such that you can access 
% them.

axis_handles = get(gcf, 'children');

% b) Extract the “position” of the first, second, third and fourth subplot
% (as the subplot command would enumerate them) within the figure.

pos_sub1 = get(axis_handles(5), 'position');

% c) Move the position of subplot 1 into the free space that is left in the
% figure (where subplot 6 would go). Pay attention that everything is
% aligned.

% set(pos_sub1, 'position', [.6916 .1100 .2134 .3412])

% subplot(2,3,6)
% plot_1 = plot(handle1(x), handle1(y));

%% Exercise 4 (optional):

% Create a plot with two y-axes containing 
% y1 = sin(pi/4*x) and
% y2 = 4.22+0.03*cos(pi/4*x + pi/8) 
% in the range of x Î [-10;10]. What isthe range (i.e., the min and max 
% values) of data for y1 and y2?


