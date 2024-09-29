
#use this function in order to call decode_DTMF

[time_signal,fsamp] = audioread('secret_number.wav');

fsamp
Ts = 1/fsamp;

number = decode_DTMF(time_signal,fsamp);
