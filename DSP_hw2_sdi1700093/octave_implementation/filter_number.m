

function y = filter_number(time_signal);


fp = 770;
fs = 697;
fsamp = 8000;
Ts = 1/fsamp;




#n = 0:Ts:(length(time_signal)-1)*Ts;
n = 0:Ts:6;

ws = 2*pi*fs/fsamp;
wp = 2*pi*fp/fsamp;
wc = (ws + wp)/2;
dw = wp - ws;

N = ceil(6.27.*pi/dw)
hd = ideal_highpass(wc,N);
w_hamm = (hamming(N))';
h = hd.*w_hamm;


   
%each digit lasts 0.5 sec followed by a 0.1 sec pause
duration = 0.5
pause = 0.1

%start and end of tone in seconds
tone_start = 0;
tone_end = duration;

current_digit = 1;
id_signal = 0;

y_signal = 0  
for num = 1:10;

  nstart = 0;
  nend = 0;
  flag = 0;
    
  
  %if current digit time  is between nstart and nend fill place_of_number with 1 else 0
  place_of_number = zeros(1,length(n));
  for i = 1:length(n);
     if(tone_start <= n(i) ) && ( tone_end >= n(i) )
        nend = i;
        place_of_number(i) = 1;
      else 
        place_of_number(i) = 0;
      endif  
      
  end       

  nstart = nend - fsamp*0.5;

  %subtract one digit from time signal
  one_digit = time_signal .* place_of_number;

  %take only the place of digit without zeros (between nstart and nend)
  one_digit = one_digit(round(nstart):nend);

  out = filter(h,1,one_digit);

  flag2 = 0;
  counter = 0;
  %cut from the time signal every filtered part
  %each filtered digit will not have amplitude bigger than 1.5
  %if we had a perfect filter it would not have amplitude > 1 but there are some inconsistencies with amplitude = 1.2
  for i = 1:length(out) -1;
    if out(i) > 1.5;
      flag2 = 1;
      break
    endif    
  endfor
  if flag2 == 1;
    y_signal = [y_signal out];
  endif  
  %go to the next digit of the imput time_signal
  tone_start = tone_start + current_digit*duration + pause;
  tone_end = tone_start + duration;

endfor

%make n into the length of the filtered signal
n = 0:Ts:(length(y_signal)-1)*Ts;
y = y_signal

figure(5)
fr=0:0.01:pi;
Xw=freqz(time_signal,1,fr);
Hw=freqz(h,1,fr);
Yw=freqz(y,1,fr);
subplot(311);
plot(fr,abs(Xw));
subplot(312);
plot(fr,abs(Hw));
subplot(313);
plot(fr,abs(Yw));
title("Comparing frequencies before and after filtering");

%Find and plot the frequency responce of H
H = fft(h);
newlen = round(length(H)/2);
newH = H(1:newlen);
k = 0:newlen-1;
neww = k*(2*pi/length(H));
W = neww/Ts;
f= W/(2*pi);
figure(6);
plot(f,abs(newH),'r');
title("Frequency Responce of highpass filter");
ylabel("Frequency Response");
xlabel("Frequency (Hz)");
#print("-color","-deps" ,"High_pass_filter_response_2.eps"); 


%Find and plot the frequency responce of Xw
Xw = fft(time_signal);
newlen = round(length(Xw)/2);
newX = Xw(1:newlen);
newk = 0:newlen-1;
neww = newk*(2*pi/length(Xw));
W = neww/Ts;
f = W/(2*pi);
figure(7)
plot(f,abs(newX));
ylabel("abs(X)")
xlabel("frequency f")
title("Frequencies of input signal")
#print("-color","-deps" ,"Input_signal_2.eps"); 


%Find and plot the frequency responce of Yw
Yw = fft(y);
newlen = round(length(Yw)/2);
newY = Yw(1:newlen);
newk = 0:newlen-1;
neww = newk*(2*pi/length(Yw));
W = neww/Ts;
f = W/(2*pi);

%Plot final output signal
figure(8)
plot(f,abs(newY));
ylabel("abs(Y)")
xlabel("frequency f")
title("Frequencies of filtered signal")
#print("-color","-deps" ,"Filtered_signal_2.eps"); 


figure(9)
plot(n,y)
xlabel("Time n")
ylabel("Amplitude")
title("Output y time signal without frequencies")
#print("-color","-deps" ,"y_signal_2.eps"); 




endfunction






