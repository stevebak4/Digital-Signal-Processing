
function decoded_array = decode_DTMF(time_signal,fsamp);
    
  
Ts = 1/fsamp;
n = 0:Ts:(length(time_signal)-1)*Ts;


%array of frequencies of each digit
freq_array = [941 1336; 
              697 1209; 697 1336; 697 1477;
              770 1209; 770 1336; 770 1477;
              852 1209; 852 1336; 852 1477]
     
%each digit lasts 0.5 sec followed by a 0.1 sec pause
duration = 0.5
pause = 0.1

%start and end of tone in seconds
tone_start = 0;
tone_end = duration;

current_digit = 1;
id_signal = 0;

number = 0;
 
decoded_array = [] 
#take the transpose of the time signal because it comes from "audioread" and normalize its amplitude
time_signal = time_signal.';
time_signal = time_signal./10000;

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
  
  #take digit from the input signal
  %subtract one digit from time signal
  one_digit = time_signal .* place_of_number;
 
  %take only the place of digit without zeros (between nstart and nend)
  one_digit = one_digit(round(nstart):nend);
  
  
  #pass digit through the band_pass filter of each number and if flag == 1 then the digit is equal to j-1 
  for j = 1:10;  
      f_to_pass1 = freq_array(j,1)
      f_to_pass2 = freq_array(j,2)
      flag = check_if_number(one_digit,fsamp,f_to_pass1,f_to_pass2);
      %save all digits to decoded_array
      if flag == 1;
        decoded_array = [decoded_array (j-1)];
      endif  
  endfor
 
 
  %go to the next digit of the imput time_signal
  tone_start = tone_start + current_digit*duration + pause;
  tone_end = tone_start + duration;
  
  
 
end

decoded_array
 
endfunction
