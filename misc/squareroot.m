function [sqrtb] = squareroot(b)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% Inputs: b, a positive real number
% Outputs: sqrtb, an approximation of sqrt(b)
%
% Error flags:
%	 0 : no error
%	-1 : the given b is negative, or complex

errflag=0;

if b<0 || isreal(b)==0
  errflag=-1;
  return;
end

pold=b;
maxits=30;
j=1;

while j <= maxits
  pnew = pold - ((pold*pold)-b)/(2*pold);
  j=j+1;
  pold=pnew;
end

sqrtb=pnew;
return;
