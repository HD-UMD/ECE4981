% We want to create 44,100 samples for every second of audio data. This is a commonly used sampling rate for music files.
global Sampling_Rate
Sampling_Rate = 44100;

% Call the synthesizer function shown below in order to put some audio data
% into the variable named "sound".
sound = Synthesize(475, 0.8, 4);

% Use the MATLAB Audio Toolbox function "soundsc" to play the audio data in
% the variable "sound" over your computer's speakers.
soundsc(sound, Sampling_Rate);


function Audio_Data = Synthesize(Frequency, Amplitude, Duration)

% Make the global variable "Sampling_Rate" available within this function.
global Sampling_Rate

% Convert duration input value in seconds to duration value in samples.
Duration = Duration * Sampling_Rate;

% Create an array "n" that contains the same number of elements as the
% output audio data will contain.
n = 1:1:Duration;

 % Express the number of samples in the audio data as a scalar value "N".
N = length(n); 

% Create an empty array "Audio_Data" for the audio data to be loaded into. Doing this ahead of time allows the MATLAB script to run faster than if we did not do it ahead of time.
Audio_Data = zeros(1,N); 

% Fill the array "Audio_Data" with data sampled from a sine wave. The previously created array "n" is used here to keep track of which sample value is being populated.
% The array "Audio_Data" will be returned by this MATLAB function so that
% it can be played by an audio system.
Audio_Data = Amplitude*sin(2*pi*(Frequency/Sampling_Rate)*n);           
                                                                       
% Plot the audio data that was syntehsized using a stem plot. The x-axis is in seconds in this plot.                                                                      
stem((n/Sampling_Rate), Audio_Data);
axis([0 0.0025 -1.5 1.5])
grid on

end
