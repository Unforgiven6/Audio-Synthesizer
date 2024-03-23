# Audio-Synthesizer
An **audio synthesizer** that converts mechanical or electrical energy into sound energy and often use controls that enable the user to adjust the **properties** of the generated sound. 

The controls provided by a synthesizer depend on the kind of applications the synthesizer is designed for. While some synthesizer controls are used adjust the most basic physical properties of the generated sound output, namely, the amplitude (which determines the loudness or intensity) and the pitch (the audio frequency, which determines how shrill the generated sound is), others serve more sophisticated purposes such as changing the resonant frequency of the low-pass filter through which the input signal is passed. 

**Envelopes:** a table of data points that is output over a specified period of time.
An x-y plot that shows how any given attribute of the output signal (such as pitch) should evolveover time. 
Envelopes enable a synthesizer to change sound characteristics **automatically** over time, unlike sliders that need to be varied manually.

**Four Stages of an envelope:** attack, decay, sustain, and release.
**Attack:** the synthesizer tunes up the desired sound attribute (the quantity plotted along the y-axis, say amplitude) to a peak value.
**Decay:** the quantity is made to decrease untilit hits a certain user-defined value.
**Sustain:** sustains the amplitude at the user-defined value resulting from the decay stage.
**Release:** allows the quantity fade out until its value reaches 0.

![image](https://github.com/Unforgiven6/Audio-Synthesizer/assets/80782918/1cc244e9-f6f5-4a32-8e28-fe724a4f97ec)

**Plan:** Using MATLAB, write a code to design a synthesizer. Choose an oscillator waveform and add to it a linear filter with adjustable parameters to obtain different sounds.
