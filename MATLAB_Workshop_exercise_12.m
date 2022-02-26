%% Sheet 12 – Digital signal processing
% Please write all commands in the MATLAB editor into separate m-files (one 
% for each function or script) and save it in a folder that you 
% specifically dedicate to this workshop. If you don t know how a command 
% is being used type "help [commandname]" into the command window. Comment 
% each code line briefly to document what it is doing.

clc
clear
close all

%% Exercise 1:
% a) Load the impulse response  imp_response_church_48k.wav’ and the other 
% audio files with their respective sampling frequencies into MATLAB.

[church, church_Fs] = audioread('imp_response_church_48k.wav');
[gurkensalat, gurkensalat_Fs] = audioread('gurkensalat.wav');
[tomsdinershort, tomsdinershort_Fs] = audioread('tomsdinershort.wav');
[twister, twister_Fs] = audioread('twister.wav');

% b) Use the function resample(), in order to bring all signals to having 
% the same sampling frequency of 48 kHz.

[P, Q] = rat(48e3/gurkensalat_Fs);
gurkensalat_48k = resample(gurkensalat, P, Q);
tomsdinershort_48k = resample(tomsdinershort, P, Q);
twister_48k = resample(twister, P, Q);

% c) Plot one of the audio signals of your choice (1) in the time domain
% and (2) in the frequency domain. Pay attention to do the spectral
% plot with an appropriate frequency axis.

% Input of the Sound File
x = gurkensalat_48k;
fs = 48e3;

% Perform Calculations
x = x(:, 1);                        
xlen = length(x);                   
t = (0:length(x)-1)/fs;
plot(t*1E+3, x);

wlen = 1024;                        
nfft = 4*wlen;                      
hop = wlen/4;

TimeRes = wlen/fs;                  
FreqRes = 2*fs/wlen;

TimeResGrid = hop/fs;               
FreqResGrid = fs/nfft;

w1 = hanning(wlen, 'periodic');
[~, fS, tS, PSD] = spectrogram(x, w1, wlen-hop, nfft, fs);
Samp = 20*log10(sqrt(PSD.*enbw(w1, fs))*sqrt(2));

w2 = hanning(xlen, 'periodic');
[PS, fX] = periodogram(x, w2, nfft, fs, 'power');
Xamp = 20*log10(sqrt(PS)*sqrt(2));

% Plot Results
figure(1)
subplot(3, 3, [2 3])
plot(t, x)
grid on
xlim([0 max(t)])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Time, s')
ylabel('Amplitude')
title('The signal in the time domain')

subplot(3, 3, [4 7])
plot(fX, Xamp)
grid on
xlim([0 max(fX)])
ylim([min(Xamp)-10 max(Xamp)+10])
view(-90, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
title('Amplitude spectrum of the signal')

subplot(3, 3, [5 6 8 9])
surf(tS, fS, Samp)
shading interp
axis tight
box on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Amplitude spectrogram of the signal')
view(0, 90)

hcol = colorbar('East');
set(hcol, 'FontName', 'Times New Roman', 'FontSize', 12)
ylabel(hcol, 'Magnitude, dB')

disp(['Frequency resolution of the analysis: ' num2str(FreqRes) ' Hz'])
disp(['Time resolution of the analysis: ' num2str(TimeRes) ' s'])
disp(['Resolution of the frequency grid: ' num2str(FreqResGrid) ' Hz'])
disp(['Resolution of the time grid: ' num2str(TimeResGrid) ' s'])
view(-45,65)
colormap bone

% d) Listen to the audio file.

sound(x, fs)

%% Exercise 2:
% The impulse response  imp_response_church_48k.wav’ characterizes the 
% acoustic transmission from a source to the receiver inside a church.
% Convolve one audio signal of your choice with this impulse response to
% create an audio signal at the location of the receiver inside the church.
% How do time signal, spectrum and sound change?

% Change sound to convolve only, everything else will autoupdate
sound_to_convolve = gurkensalat_48k;


new_sound = conv2(church, sound_to_convolve);

% Calculations and variables for Convovled Signals
x = new_sound;
fs = 48e3;

x = x(:, 1);                        
xlen = length(x);                   
t = (0:length(x)-1)/fs;

wlen = 1024;                        
nfft = 4*wlen;                      
hop = wlen/4;

TimeRes = wlen/fs;                  
FreqRes = 2*fs/wlen;

TimeResGrid = hop/fs;               
FreqResGrid = fs/nfft;

w1 = hanning(wlen, 'periodic');
[~, fS, tS, PSD] = spectrogram(x, w1, wlen-hop, nfft, fs);
Samp = 20*log10(sqrt(PSD.*enbw(w1, fs))*sqrt(2));

w2 = hanning(xlen, 'periodic');
[PS, fX] = periodogram(x, w2, nfft, fs, 'power');
Xamp = 20*log10(sqrt(PS)*sqrt(2));

% Ploting Time and Frequency for Convolved Signals
figure(2)
subplot(3, 3, [2 3])
plot(t, x)
grid on
xlim([0 max(t)])
ylim([-1.1*max(abs(x)) 1.1*max(abs(x))])
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Time, s')
ylabel('Amplitude')
title('The signal in the time domain')

subplot(3, 3, [4 7])
plot(fX, Xamp)
grid on
xlim([0 max(fX)])
ylim([min(Xamp)-10 max(Xamp)+10])
view(-90, 90)
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Frequency, Hz')
ylabel('Magnitude, dB')
title('Amplitude spectrum of the signal')

subplot(3, 3, [5 6 8 9])
surf(tS, fS, Samp)
shading interp
axis tight
box on
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12)
xlabel('Time, s')
ylabel('Frequency, Hz')
title('Amplitude spectrogram of the signal')
view(0, 90)

hcol = colorbar('East');
set(hcol, 'FontName', 'Times New Roman', 'FontSize', 12)
ylabel(hcol, 'Magnitude, dB')

disp(['Frequency resolution of the analysis: ' num2str(FreqRes) ' Hz'])
disp(['Time resolution of the analysis: ' num2str(TimeRes) ' s'])
disp(['Resolution of the frequency grid: ' num2str(FreqResGrid) ' Hz'])
disp(['Resolution of the time grid: ' num2str(TimeResGrid) ' s'])
view(-45,65)
colormap bone

% Hearing the Convolved Signal
sound(x, 48e3)

%% Exercise 3 (optional):
% Create a Butterworth low pass filter of 4th order with a cutoff frequency 
% of 600 Hz at the same sampling frequency as before (48 kHz). Filter one
% (clean) audio signal with this filter. How do time signal, spectrum and
% sound change now?


