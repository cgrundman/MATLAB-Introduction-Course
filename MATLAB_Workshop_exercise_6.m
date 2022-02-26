%% Sheet 6 – Plotting - Advanced Plots
% Please write all commands in the MATLAB editor into one single m-file and 
% save it in a folder that you specifically dedicate to this workshop. If
% you don t know how a command is being used type “help [commandname]” into 
% the command window. Comment each code line briefly to document what it is 
% doing.

clc
clear
close all

%% Exercise 1:
% Using the histogram function, show the difference between the output data 
% of the rand vs randn functions.

a = rand(1000);
subplot(2,1,1);
histogram(a)

b = randn(1000);
subplot(2,1,2);
histogram(b)

%% Exercise 2:
% Use the function peaks to get three output arguments assigned to 
% variables x, y, and z. This function will create coordinates x, y and 2-
% dimensional data z by scaling Gaussian distributions.

[x, y, z] = peaks();

% a) Create from the data in z a surface plot with appropriate labelling of 
% the three axes.

figure()
subplot(2,1,1);
surf(x, y, z)
xlabel('x')
ylabel('y')
zlabel('z')

% b) Create from the data in z an image plot with imagesc also with
% appropriate labelling of both axes and a color bar.

subplot(2,1,2);
imagesc(z)
xlabel('x')
ylabel('y')
colorbar

%% Exercise 3:
% a) Generate a family of curves representing eight parallel horizontal 
% lines who consist of the same vertical distance to the preceding
% horizontal line. Store these curves as columns in a matrix called
% colormatrix.

x3 = [-5:0.25:5];
k = zeros(length(x3), 1);
for i = 1:8
    colormatrix(i,:) = k + i;
end

% b) Generate a “rainbow-plot” by using the plot command.

figure()
plot(x3, colormatrix)
axis([-5 5 0 9])
legend('y=1', 'y=2', 'y=3', 'y=4', 'y=5', 'y=6', 'y=7', 'y=8')

% c) Change the color of each line using commands such that the plot looks 
% like a rainbow made out of lines. For that set the property  Color’ to 
% appropriate values. The function hsv2rgb may be helpful here. 
% Furthermore, set the line width of each line to a value of 3.

rbl = get(gca, 'children');
set(rbl, 'linewidth', 3)
for i = 1:8
    set(rbl(i),'color', hsv2rgb([1-(i/8) 1 1]))
end
