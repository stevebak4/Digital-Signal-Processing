
function [hd, n] = ideal_bandpass(w1,w2,N);
  
    disp("inside ideal_bandpass") 
    
    a = (N-1)/2;
    m = 0:N-1;
    n = m - a + eps;
    hd = sin(w1*n)./(pi*n) - sin(w2*n)./(pi*n);
    
    disp("exiting ideal_bandpass") 

endfunction
