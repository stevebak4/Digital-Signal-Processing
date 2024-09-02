
function number = count_aces(time_signal);


fsamp = 8000;
Ts = 1/fsamp;
n = 0:Ts:(length(time_signal)-1)*Ts;

f_to_pass2 = 1209;
f_to_pass1 = 697;


%each digit lasts 0.5 sec followed by a 0.1 sec pause
duration = 0.5
pause = 0.1


tone_start = 0;
tone_end = duration;

current_digit = 1;
id_signal = 0;

number = 0;
 
for num = 1:10; 
  
  disp(num)
  nstart = 0;
  nend = 0;
  flag = 0;
  %if current digit time  is between nstart and nend fill place_of_number with 1 else 0
  place_of_number = zeros(1,length(n));
  for i = 1:length(n);
     if(tone_start <= n(i) ) && ( tone_end >= n(i) )
        nend = i;
        place_of_number(i) = 1;
      end
      
  end       
  
  nstart = nend - fsamp*0.5;
  %subtract one digit from time signal
  one_digit = time_signal.*place_of_number;
  one_digit = one_digit(round(nstart):nend);
  
  %check if one_digit is ace 
  number = number + check_if_number(one_digit,fsamp,f_to_pass1,f_to_pass2);
  
  %go to the next digit of the imput time_signal
  tone_start = tone_start + current_digit*duration + pause;
  tone_end = tone_start + duration;
  
  
 
 end

number

endfunction
