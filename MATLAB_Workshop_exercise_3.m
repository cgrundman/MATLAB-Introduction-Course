%% PROBLEM SET 3

clc
clear
close all

%% Exercise 1:
% Given the matrix A = [2 4 1; 6 7 2; 3 5 9]
% a) Let MATLAB find all elements of A that equal 2 and give linear 
% indices, as well as row/column indices out.

A = [2 4 1; 6 7 2; 3 5 9];
ind = find(A == 2);
sz = size(A);
[row, col] = ind2sub(sz, ind);

% b) Let MATLAB find all elements that are larger or equal to 7 and give
% linear indices out. Assign these elements to a new matrix B at the
% same positions as before with all other positions being zeros.

ind_2 = find(A > 6);
B = A;
for i = 1:9
    if B(i) < 7 
        B(i) = 0;
    end
end

% c) Let MATLAB find all elements that are smaller or equal to 2 or
% those which equal 5 (in one logical expression) and assign these
% elements to a new column vector x2.

ind_3 = find(A < 3 | A == 5);
x2 = A(ind_3);

%% Exercise 2:
% Given the arrays x = [1 4 8], y = [2 1 5], z = [2 4 2] and
% A = [3 1 6; 5 2 7; 2 3 5], determine which of the following
% statements will correctly execute and provide the result. If the command
% will not correctly execute, state why not

x = [1 4 8];
y = [2 1 5];
z = [2 4 2];
A = [3 1 6; 5 2 7; 2 3 5];

% a) x + y

sum_x_y = x + y;

% b) x + A

% x + A will not execute correctly, because matrix addition only works when the
% matrices are the same dimension. In this case A is 3x3 and x is 1X3.

% c) x' + y

% x' + y will not execute correctly, because matrix addition only works when the
% matrices are the same dimension. In this case x' is 3X1 and y is 1X3.

% d) A – [x' y'  z']

inv_xyz_from_A = A - [x' y'  z'];

% e) b = [x; y']

% b = [x; y'] will not execute correctly because y has been transformed
% into a column matrix while x is still a row matrix.

% f) c = [x; y]

c = [x; y];

% g) A(:,2) = []

A_ = A;
A_(:,2) = [];

% h) d = [A; x; y]

d = [A; x; y];

%% Exercise 3:
% Solve this system of linear equations using Cramer's rule with MATLAB.
% 2x + 4y - 2z = -6
% 6x + 2y + 2z = 8
% 2x - 2y + 4z = 12

G = [2 4 -2; 6 2 2; 2 -2 4];
w = [-6; 8; 12];
[m,n] = size(G);
j = zeros(m,1);
for i = 1:m
    T = G;
    T(:,i) = w;
    j(i) = det(T)/det(G);
end
disp(j)

%% Exercise 4 (optional):
% a) Calculate Eigenvectors and corresponding Eigenvalues for the
% following matrices:

A = [4 0 1; -2 1 0; -2 0 1];
B = [0 0 2; 1 2 1; 1 0 3];
e = eig(A);
f = eig(B);
h = eig(A,B);

% b) Are the Eigenvectors of each matrix orthogonal?

orth = dot(e, f);
% No, their dot product is not equal to 0.

% c) Verify that the following equations hold for the Eigenvalues li of
% matrix A

