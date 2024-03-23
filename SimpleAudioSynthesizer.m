function simpleAudioSynthesizer()
    % Create a figure
    fig = figure('Position', [200, 200, 400, 200]);

    % Create frequency slider
    freqSlider = uicontrol('Style', 'slider', 'Min', 100, 'Max', 1000, ...
        'Value', 440, 'Position', [50, 120, 300, 20]);
    freqLabel = uicontrol('Style', 'text', 'Position', [200, 140, 100, 20], ...
        'String', 'Frequency');

    % Create amplitude slider
    ampSlider = uicontrol('Style', 'slider', 'Min', 0, 'Max', 1, ...
        'Value', 0.5, 'Position', [50, 80, 300, 20]);
    ampLabel = uicontrol('Style', 'text', 'Position', [200, 100, 100, 20], ...
        'String', 'Amplitude');

    % Create play button
    playButton = uicontrol('Style', 'pushbutton', 'String', 'Play', ...
        'Position', [175, 20, 50, 40], 'Callback', @playSound);

    % Function to generate and play the sound
    function playSound(~, ~)
        % Get slider values
        frequency = get(freqSlider, 'Value');
        amplitude = get(ampSlider, 'Value');

        % Set duration and sampling frequency
        duration = 2; % seconds
        fs = 44100; % Hz

        % Generate time vector
        t = 0:1/fs:duration;

        % Generate audio signal
        audio = amplitude * sin(2*pi*frequency*t);

        % Play audio
        sound(audio, fs);
    end
end