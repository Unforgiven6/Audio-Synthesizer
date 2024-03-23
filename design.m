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

% Create a slider for adjusting the cutoff frequency
fig = figure;
slider = uicontrol('Style', 'slider', ...
                   'Min', slider_range(1), 'Max', slider_range(2), ...
                   'Value', initial_slider_value, ...
                   'SliderStep', slider_step, ...
                   'Position', [20 20 300 20], ...
                   'Callback', @(source, event) slider_callback(source, event, t, signal));

% Store filter_order, sampling_freq, signal, and t as data associated with the figure handle
guidata(fig, struct('filter_order', filter_order, 'sampling_freq', sampling_freq, 'signal', signal, 't', t));

% Define callback function for slider
function slider_callback(source, event, t, signal)
    % Retrieve filter_order, sampling_freq, signal, and t from figure handle data
    data = guidata(source);
    filter_order = data.filter_order;
    sampling_freq = data.sampling_freq;
    signal = data.signal;
    t = data.t;
    
    new_cutoff_freq = get(source, 'Value');
    updated_filter = designfilt('lowpassfir', ...
                                'FilterOrder', filter_order, ...
                                'CutoffFrequency', new_cutoff_freq, ...
                                'SampleRate', sampling_freq);
    filtered_signal = updated_filter.filter(signal);
    
    % Plot re-filtered signal
    subplot(2,1,2);
    plot(t, filtered_signal);
    xlabel('Time (s)');
    ylabel('Amplitude');
    title('Re-Filtered Signal (Adjusted Cutoff Frequency)');
end