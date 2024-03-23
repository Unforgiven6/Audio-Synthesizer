% Define parameters
sampling_freq = 1000; % Sampling frequency in Hz
duration = 1; % Duration of the waveform in seconds
frequency = 5; % Frequency of the triangular wave in Hz (lower value for visualization)

% Generate time vector
t = linspace(0, duration, duration * sampling_freq);

% Generate triangular wave
triangular_wave = sawtooth(2 * pi * frequency * t, 0.5);

% Plot the waveform
plot(t, triangular_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Triangular Waveform');