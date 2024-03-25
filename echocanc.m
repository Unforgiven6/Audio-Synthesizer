% Load the audio data, custom here
%load voice.mat

% Set the sampling frequency, whatever it is
Fs = 32000;

% Define the length and decay factor of the echo
N = 10000;
a = 0.4;

% Create the impulse response for the echo
h1 = zeros(1, N);
h1(1) = 1;
h1(N) = a * 1;

% Filter the original audio to generate the echo, y is input signal
echo = filter(1, h1, y);

% Set a new sampling frequency for the filtered audio
Fs2 = 32000;

% Play the echo
sound(echo, Fs2);
