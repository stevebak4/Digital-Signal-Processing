
function  id_signal = create_number(id_number);
#id_number = "5201700093"


fs = 8000;
Ts =  1/fs;

duration = 0.5
pause = 0.1

disp(id_number)
n = 0:Ts:length(id_number)*(duration + pause);

%break number into its digits
number=str2double(regexp(num2str(id_number),'\d','match'));

tone_start = 0;
tone_end = duration;

current_digit = 1;
id_signal = 0;
 
%create n based on length the time_signal will have 
 
%for every digit of number 
for num = number
  disp(num);
  [f1,f2] = get_digit_frequencies(num);
  
%if current digit time  is between nstart and nend fill place_of_number with 1 else 0  
place_of_number = zeros(1,length(n));
  for i = 1:length(n);
     if(tone_start <= n(i) ) && ( tone_end >= n(i) )
        place_of_number(i) = 1;
      end
  end       
  
  #put x into the right place of the signal
  x = (cos(f1*2*pi*n) + cos(f2*2*pi*n)).*place_of_number;
  
  id_signal = id_signal + x;
  
  %update time values
  tone_start = tone_start + current_digit*duration + pause;
  tone_end = tone_start + duration;
 
end

figure(1)

%plot time_signal of id_number
plot(n,id_signal); %n seconds, signal amplitude
xlabel("Time n")
ylabel("Amplitude")
title("Input time signal")
#print("-color","-deps" ,"time_signal_1.eps"); 


%find and plot the frequency responce of id_signal
X = fft(id_signal);
k=0:length(X)-1;
w=k*(2*pi/length(X)); 
newlen=round(length(X)/2);
newX=X(1:newlen); 
newk=0:newlen-1;
neww=newk*(2*pi/length(X)); 
W = neww/Ts;
f = W/(2*pi);

figure(2)
plot(neww,abs(newX));
ylabel("abs(X)")
xlabel("linear frequency w")
title("X(w)")
#print("-color","-deps" ,"W_signal_1.eps"); 

figure(3)
plot(f,abs(newX));
ylabel("abs(X)")
xlabel("frequency f")
title("Frequencies of input signal")
#print("-color","-deps" ,"F_signal_1.eps"); 


end


