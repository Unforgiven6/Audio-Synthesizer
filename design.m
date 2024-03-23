% Define filter parameters
sampling_freq = 1000; % Sampling frequency in Hz
initial_cutoff_freq = 100; % Initial cutoff frequency in Hz
filter_type = 'low'; % Filter type: 'low' for low-pass filter

% Design the initial filter
filter_order = 4; % Filter order (adjust as needed)
my_filter = designfilt('lowpassfir', ...
                    'FilterOrder', filter_order, ...
                    'CutoffFrequency', initial_cutoff_freq, ...
                    'SampleRate', sampling_freq);

% Generate noisy signal (for demonstration)
t = linspace(0, 1, sampling_freq); % Time vector
signal = sin(2*pi*50*t) + randn(size(t)); % Example signal with noise

% Apply the initial filter to the signal
filtered_signal = my_filter.filter(signal); % Changed from filter(my_filter, signal)

% Plot original and filtered signals
figure;
subplot(2,1,1);
plot(t, signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal');

subplot(2,1,2);
plot(t, filtered_signal);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal');

% Step 6: Create a slider for adjusting the cutoff frequency
fig = figure;
max_cutoff_freq = sampling_freq / 2; % Nyquist frequency
min_cutoff_freq = 0.1; % Set a small positive value for the minimum cutoff frequency
slider = uicontrol('Style', 'slider', ...
                   'Min', min_cutoff_freq, 'Max', max_cutoff_freq, ...
                   'Value', initial_slider_value, ...
                   'SliderStep', slider_step, ...
                   'Position', [20 20 300 20], ...
                   'Callback', @(source, event) slider_callback(source, event, t, signal, max_cutoff_freq));

% Store filter_order, sampling_freq, signal, and t as data associated with the figure handle
guidata(fig, struct('filter_order', filter_order, 'sampling_freq', sampling_freq, 'signal', signal, 't', t));

% Step 7: Define callback function for slider
function slider_callback(source, ~, t, signal, max_cutoff_freq)
    % Retrieve filter_order, sampling_freq, signal, and t from figure handle data
    data = guidata(source);
    filter_order = data.filter_order;
    sampling_freq = data.sampling_freq;
    signal = data.signal;
    t = data.t;
    
    % Normalize cutoff frequency
    normalized_cutoff_freq = get(source, 'Value') / max_cutoff_freq; 
    
    % Denormalize cutoff frequency to actual frequency
    new_cutoff_freq = normalized_cutoff_freq * sampling_freq / 2;
    
    % Design filter using denormalized cutoff frequency
    updated_filter = designfilt('lowpassfir', ...
                                'FilterOrder', filter_order, ...
                                'CutoffFrequency', new_cutoff_freq, ...
                                'SampleRate', sampling_freq);
    
    % Apply the filter to the signal
    filtered_signal = filter(updated_filter, signal);
    
    % Plot re-filtered signal
    subplot(2,1,2);
    plot(t, filtered_signal);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Re-Filtered Signal (Adjusted Cutoff Frequency)');
end
