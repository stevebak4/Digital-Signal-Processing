
function [hd,n]=ideal_highpass(wc,N);
  a=(N-1)/2;
  m=(0:1:(N-1));
  n=m-a+eps;
  hd=(sin(pi*n)./(pi*n)) - (sin(wc*n)./(pi*n));
end
