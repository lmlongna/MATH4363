function [l,r,errflag] = findinverse(x,tol)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% This program finds the inverse of a given number.
% 
% Inputs:
%	x:		the number
%	tol:		an acceptable error tolerance for the
%			computed inverse
%
% Outputs:
%	l,r:		bounds of an interval containing 1/x
%
% Error flags:
%	0 : no error
%   -1 : tol is in underflow, defaulted to tol=eps
%	1 : the inverse lies in the overflow region
%	2 : x lies in the underflow region

format long e;
errflag=0;

tol=abs(tol);
if tol < eps
  errflag = -1;
  tol = eps;	% fail gracefully, but still return the error
end

if abs(x) < eps
  errflag=2;	% if x is in the underflow region, there is no
  return;		% way to fail gracefully
end


% First, compute the initial bracketing interval.
if abs(x)>1
  a=0;
  b=1;
else
  a=1;
  b=10^(-floor(log10(abs(x)))); % get the number of consecutive decimal
  						  % digits which equal zero
end

if b==Inf
  b=intmax;
end

aprime = sign(x*x*a-abs(x));
bprime = sign(x*x*b-abs(x));

if aprime*bprime > 0 		% if the initial bracketing interval does
  errflag = 1;				% not contain a root, return an error
  return;					% this should only happen for very small
end						% values for x

% The main algorithm. The second condition was found to be 
% necessary during debugging, but as (b-a)/2 never underflowed
% in my debugging, I am not sure why. I chose not to use the
% maxits method below because it is easy to generate negative values
% if |b-a|>>0.

% maxits=ceil(log2((b-a)/tol));
%for j=1:maxits

while (b - a) > tol && a~=a + ((b-a)/2)
  p = a + ((b - a) / 2); 	% best guess is the midpoint of the bracketing interval
  pprime = sign(x*x*p-abs(x));
  if aprime * pprime < 0		% if the root is to the left of p
    b = p;
    bprime = pprime;
  elseif pprime * bprime < 0 	% if the root is to the right of p
    a = p;
    aprime = pprime;
  else					% in this unlikely condition, p is a root
    a=b=p;
  end 
end

if sign(x)>0
  l=a;
  r=b;
else
  l=-b;
  r=-a;
end

return; 
