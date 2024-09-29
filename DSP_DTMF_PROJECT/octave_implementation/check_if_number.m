

function is_number = check_if_number(time_signal,fsamp,f_to_pass1,f_to_pass2);
 
  
  Ts = 1/fsamp;
   
  disp("inside check_if_ace") 
  %getting the frequency response for each of the two frequencies we want to pass
  h_bandpass1 = use_bandpass(f_to_pass1,fsamp);
  h_bandpass2 = use_bandpass(f_to_pass2,fsamp);

  %add h1 and h2 to pass both f_to_pass1 and f_to_pass2  
  h_bandpass = h_bandpass1 + h_bandpass2;
  
  %calculate the output y
  y = filter(h_bandpass,1,time_signal);

  #figure(12)  
  fr=0:0.01:pi;
  Xw=freqz(time_signal,1,fr);
  Hw=freqz(h_bandpass,1,fr);
  Yw=freqz(y,1,fr);
  #subplot(311);
  #plot(fr,abs(Xw));
  #subplot(312);
  #plot(fr,abs(Hw));
  #subplot(313);
  #plot(fr,abs(Yw));
   
  %find the frequency response of the final band_pass filter 
  H = fft(h_bandpass);
  newlen = round(length(H)/2);
  newH = H(1:newlen);
  k = 0:newlen-1;
  neww = k*(2*pi/length(H));
  W = neww/Ts;
  f= W/(2*pi);
  
  figure(13);
  plot(f,abs(newH),'r');
  title("Frequency Responce of bandpass filter");
  ylabel("Frequency Response");
  xlabel("Frequency (Hz)");
  #print("-color","-deps" ,"Band_pass_filter_response_3.eps"); 

  %Calculate and plot Fourier trasnform of input time_signal
  
  Xw = fft(time_signal);
  newlen = round(length(Xw)/2);
  newX = Xw(1:newlen);
  newk = 0:newlen-1;
  neww = newk*(2*pi/length(Xw));
  W = neww/Ts;
  f = W/(2*pi);
  
  #figure(14)
  #plot(f,abs(newX));
  #title("X(w)");
  #ylabel("abs(X(w))");
  #xlabel("Frequency (Hz)");
  #print("-color","-deps" ,"F_Input_signal_3.eps"); 


  %Calculate and plot Fourier trasnform of y
  Yw = fft(y);
  newlen = round(length(Yw)/2);
  newY = Yw(1:newlen);
  newk = 0:newlen-1;
  neww = newk*(2*pi/length(Yw));
  W = neww/Ts;
  f = W/(2*pi);
  
  #figure(15)
  #plot(f,abs(newY));
  #title("Y(w)");
  #ylabel("abs(Y(w))");
  #xlabel("Frequency (Hz)");
  #print("-color","-deps" ,"Filtered_signal_number3_3.eps"); 

  
  flag = 0;
  counter = 0;
  for i = 1:length(newY) -1;
    if (abs(newY(i)) >1300)
      counter = counter + 1;
    endif
              
  endfor
  
  if counter >= 2
    is_number = 1;
    disp("Number Found !!!!!!")
  else 
    is_number = 0;
  endif  

  disp("exiting check_if_number") 

endfunction
