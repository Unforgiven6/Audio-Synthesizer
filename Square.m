% Define parameters
sampling_freq = 1000; % Sampling frequency in Hz
duration = 1; % Duration of the waveform in seconds
frequency = 5; % Frequency of the square wave in Hz (lower value for visualization)

% Generate time vector
t = linspace(0, duration, duration * sampling_freq);

% Generate square wave
square_wave = square(2 * pi * frequency * t);

% Plot the waveform
plot(t, square_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Square Waveform');