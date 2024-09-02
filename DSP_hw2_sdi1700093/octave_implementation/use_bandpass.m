

%This function uses the ideal_bandpass filter along with a Hamming window 
%and returns it's impulse response
function h_bandpass = use_bandpass(f_to_pass,fsamp);
  disp("inside use_bandpass") 
  
  Ts = 1/fsamp;

  fs1 = f_to_pass - 40;
  fp1 = f_to_pass - 20;
  fp2 = f_to_pass + 20;
  fs2 = f_to_pass + 40;



  wp1 = 2*pi*fp1/fsamp;
  wp2 = 2*pi*fp2/fsamp;
  ws1 = 2*pi*fs1/fsamp;
  ws2 = 2*pi*fs2/fsamp;
  
  wc1 = (wp1+ws1)/2;
  wc2 = (wp2+ws2)/2;
  dw = ws2 - wp2;

  N = round(6.27*pi/dw) +2; %I could not use ceil here as in had sometimes output 1254 and sometimes 1255
  
  ideal_h = ideal_bandpass(wc1,wc2,N);
  w_hamm = (hamming(N))';
  h_bandpass= w_hamm.*ideal_h;
 
  
  
  disp("exiting use_bandpass") 

  
  
  
endfunction
