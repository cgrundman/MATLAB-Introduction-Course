%% Sheet 8 – Boolean operators and flow charts
% Please write all commands in the MATLAB editor into one single m-file and 
% save it in a folder that you specifically dedicate to this workshop. If
% you don t know how a command is being used type “help [commandname]” into 
% the command window. Comment each code line briefly to document what it is 
% doing.

clc
clear
close all

%% Exercise 1:
% A “coincidence neuron” is a neuron that outputs a spike (an action
% potential) only if all their input dendrites receive a spike
% simultaneously (i.e., at the same point in time). The goal here is to
% model such a coincidence neuron with 3 independent input dendrites and 
% one output axon. Let a spike be symbolized by a "1" and no spike with a 
% “0”.

% a) Create the three input vectors symbolizing the three dendrites by 
% using a random process that creates a spike in 10% of the instances in 
% time. Let all three vectors have 1000 entries corresponding to 1 second 
% of data (i.e., a sampling frequency of 1000 Hz).

freq = 1000;
th = .7;
strike = zeros(freq, 1);
den1 = abs(randn(freq, 1));
den2 = abs(randn(freq, 1));
den3 = abs(randn(freq, 1));
for i = 1:freq
    if den1(i) >= th && den2(i) >= th && den3(i) >= th
        strike(i) = 1;
    end
end

% b) Calculate the spike rate of each dendrite, i.e., the average number of 
% spikes per second.

den1_strike = 0;
den2_strike = 0;
den3_strike = 0;
for i = 1:freq
    if den1(i) >= th
         den1_strike = den1_strike + 1;
         den1(i) = 1;
    else
         den1(i) = 0;
    end
    if den2(i) >= th
         den2_strike = den2_strike + 1;
         den2(i) = 1;
    else
         den2(i) = 0;
    end
    if den3(i) >= th
         den3_strike = den3_strike + 1;
         den3(i) = 1;
    else
         den3(i) = 0;
    end
end

% c) Create the output of the coincidence neuron by assuming that it only 
% spikes when all three dendrites have a spike at the same instant in time.

% for i = 1:freq
%     if den1(i) >= th && den2(i) >= th && den3(i) >= th
%         disp('Strike!')
%     end
% end

% d) What is the average spike rate (i.e., the number of spikes per second) 
% of the output axon?

sps = 0;
for i = 1:freq
    if den1(i) >= th && den2(i) >= th && den3(i) >= th
        sps = sps + 1;
    end
end

% e) Plot the spike trains of the three input dendrites within one plot
% using different colors. Mark the instances in time that the output neuron 
% spikes with  X’-Symbols in a different color.

figure()
subplot(3, 1, 1);
plot1 = plot(1:freq, den1, 'b', 1:freq, strike, 'gX');
title('Dendrite 1')
xlim([0 freq])
ylim([0.0001 1.01])
xlabel('Impulse') 
ylabel('time (ms)') 

subplot(3, 1, 2);
plot2 = plot(1:freq, den2, 'r', 1:freq, strike, 'gX');
title('Dendrite 2')
xlim([0 freq])
ylim([0 1.01])
xlabel('Impulse') 
ylabel('time (ms)') 

subplot(3, 1, 3);
plot3 = plot(1:freq, den3, 'm', 1:freq, strike, 'gX');
title('Dendrite 3')
xlim([0 freq])
ylim([0 1.01])
xlabel('Impulse') 
ylabel('time (ms)') 

%% Exercise 2:
% Take the same neuron from Exercise 1, but now assume that one of the 
% three dendrites has an inhibitory behavior, i.e., the coincidence neuron 
% spikes if the two excitatory dendrites have a spike at the same time, but 
% only if at that instance in time there is not a spike from the inhibitory 
% dendrite. What is the spike rate of the output axon now?

freq2 = 1000;
th2 = .7;
strike2 = zeros(freq2, 1);
den1 = abs(randn(freq2, 1));
den2 = abs(randn(freq2, 1));
den3 = abs(randn(freq2, 1));
sps2 = 0;

for i = 1:freq2
    if den1(i) >= th2 && den2(i) >= th2 && den3(i) < th2
        strike2(i) = 1;
        sps2 = sps2 + 1;
    end
end
sps2

%% Exercise 3:
% Before you start the actual coding of this exercise, make a flow
% chart about this task!
% Based on the code from Sheet #8, Exercise 1 (coin-flip), modify the
% code such that user gets a second chance to flip the coin only if the
% coin flip took place in a second that is an even number, e.g., at
% 17:33:44, but not at 17:33:45. Use the command clock to access
% the exact time. year month day hour minute second

% clock = fix(clock);
% IS_EVEN = ~mod(clock(6),2);
% r = randi([0 1], 1);
% flip_again = 0
% 
% while flip_again == 0
%     if r == 1
%         disp('Heads!')
%     else
%         disp('Tails :(')
%     end
% 
%     if IS_EVEN == 1
%         flip_again = 1;
%     end
% end
