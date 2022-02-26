%% Sheet 10 – Examples for while and for-loops
% Please write all commands in the MATLAB editor into one single m-file and
% save it in a folder that you specifically dedicate to this workshop. If
% you don%t know how a command is being used type "help [commandname]" into
% the command window. Comment each code line briefly to document what it is 
% doing.

clc
clear
close all

%% Exercise 1:
% Rewrite the program displaying prime numbers from the manuscript (Example 
% 60) using only while-loops (no for-loops) such that only primenumbers (no
% other numbers) are displayed. Use the Debug-Mode to go through the code 
% and verify. What is the 50th prime number?

num_of_primes = 50;
primes = zeros(num_of_primes,1);
prime_num_counter = 1;
num_to_check = 2;

while primes(num_of_primes) == 0
    prime = true; % assume current number being prime;
    divisor = 2;
    while divisor <= floor(sqrt(num_to_check))
        if (mod(num_to_check, divisor) == 0)
            prime = false;
            break;
        end
        divisor = divisor + 1;
    end
    if prime
        primes(prime_num_counter) = num_to_check;
        prime_num_counter = prime_num_counter + 1;
    end
    num_to_check = num_to_check + 1;
end
disp('The 50th prime number:')
disp(primes(50))

%% Exercise 2:
% Consider the number sequence s = [1 2 3 4 5 6 7 8 9 0 9 8 7 6 5 4 3 2 1].
% Let MATLAB calculate the following tasks:
% What is the largest sum of 5 consecutive digits?
% What is the largest product of 4 consecutive numbers?
% What is the smallest sum of 3 consecutive digits?

counter = 1;
s = [1 2 3 4 5 6 7 8 9 0 9 8 7 6 5 4 3 2 1];
[~, num_of_s] = size(s);
max_of_5 = 0;
max_prod = 0;
min_of_3 = 10000;

% Largest sum of 5 consecutive digits
while counter <= num_of_s - 4
    max_i = s(counter) + s(counter+ 1) + s(counter + 2) + s(counter + 3) + s(counter + 4);
    counter = counter + 1;
    if max_i >= max_of_5
        max_of_5 = max_i;
    end
end
disp('The largest sum of 5 consecutive digits:')
disp(max_of_5)

counter = 1;

% Largest product of 4 consecutive digits
while counter <= num_of_s - 3
    max_prod_i = s(counter)*s(counter + 1)*s(counter + 2)*s(counter + 3);
    counter = counter + 1;
    if max_prod_i >= max_prod
        max_prod = max_prod_i;
    end
end
disp('The largest product of 4 consecutive digits:')
disp(max_prod)

counter = 1;

% Smallest sum of 3 consecutive digits
while counter <= num_of_s - 2
    min_i = s(counter) + s(counter+ 1) + s(counter + 2);
    counter = counter + 1;
    if min_i <= min_of_3
        min_of_3 = min_i;
    end
end
disp('The smallest sum of 3 consecutive digits:')
disp(min_of_3)

%% Exercise 3 (optional):
% Implement a Roulette-game! Therefore, let the user choose at the 
% beginning either "red" or “black”, or a number between 0 and 36 
% (input-command) and as a second input how much money the user wants to
% set. Then design the roulette-wheel as a random process and tell the user
% on the command line the result of the current game-trial as well as the 
% amount of money lost or won. Double the amount on a win on "red" or 
% "black" and multiply by 36 on meeting the correct number. Each game trial
% should end with the question whether or not another trial should be done,
% which will start the procedure anew.

game_on = true;

while game_on
    chosen_number = input('Choose a number 1-36:\n');
    chosen_color = input('Chosse a color ("red" or "black"):\n', 's');
    if chosen_color == 'red'
        chosen_color = 1;
    else
        chosen_number = 0;
    end
    bet = input('How much money do you bet?\n');
    roullete_spin_number = randi([1 36], 1);
    roullete_spin_color = randi([0 1], 1);
    if chosen_color == roullete_spin_color
        bet = bet * 2;
        disp('Colors Matched!')
    end
    if chosen_color == roullete_spin_number
        bet = bet * 36;
        disp('Numbers Matched')
    end
    cont = input('Play again? (y or n)\n', 's');
    if cont == 'n' 
        game_on = false;
    end
end
