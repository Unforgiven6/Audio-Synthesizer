% Define parameters
sampling_freq = 44100; % Sampling frequency in Hz for CD-Quality Audio
duration = 1; % Duration of the waveform in seconds
frequency = 440; % Frequency of the sine wave in Hz (A4 note)

% Generate time vector
t = linspace(0, duration, duration * sampling_freq);

% Generate sine wave
sine_wave = sin(2 * pi * frequency * t);

% Plot the waveform
plot(t, sine_wave);
xlabel('Time (s)');
ylabel('Amplitude');
title('Sine Waveform');