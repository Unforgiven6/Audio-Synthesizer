% Define parameters
fs = 44100; % Sampling frequency (Hz)
dur = 2; % Duration of the envelope (seconds)
t = 0:1/fs:dur; % Time vector

% Envelope parameters
attackTime = 0.1; % Attack time (seconds)
decayTime = 0.2; % Decay time (seconds)
sustainLevel = 0.1; % Sustain level (0 to 1)
releaseTime = 0.3; % Release time (seconds)

% Generate envelope
envelope = zeros(size(t));
envelope(t <= attackTime) = t(t <= attackTime) / attackTime; % Attack stage
envelope(t > attackTime & t <= (attackTime + decayTime)) = 1 - (1 - sustainLevel) * ((t(t > attackTime & t <= (attackTime + decayTime)) - attackTime) / decayTime); % Decay stage
envelope(t > (attackTime + decayTime) & t <= (dur - releaseTime)) = sustainLevel; % Sustain stage
envelope(t > (dur - releaseTime)) = sustainLevel - (sustainLevel * (t(t > (dur - releaseTime)) - (dur - releaseTime)) / releaseTime); % Release stage

% Plot envelope
figure;
plot(t, envelope);
title('Envelope');
xlabel('Time (s)');
ylabel('Amplitude');
ylim([0 1.1]);

% Generate simple sinusoidal tone
frequency = 200; % Frequency of the tone (Hz)
tone = sin(2*pi*frequency*t);

% Apply envelope to the tone
envelopedTone = envelope .* tone;

% Play the sound
sound(envelopedTone, fs);

% To listen to the sound without clipping, scale the amplitude
scaledTone = envelopedTone / max(abs(envelopedTone));
sound(scaledTone, fs);
