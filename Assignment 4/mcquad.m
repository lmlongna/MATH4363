function [s] = mcquad(fcn,a,b,n)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% A routine to approximate definite integrals over k-dimensional
% rectangular regions using Monte-Carlo regions.
%
% Inputs
%	fcn:	the string variable giving the 
%		name of the integrand m-file
%	a:	a vector giving originating endpoints
%	b:	a vector giving the terminating endpoints
%	n:	the number of function samples to take
%
% Outputs
%	s: 	the computed integral

format short e;	

% Variable initilization and input testing
if size(a) != size(b)
  disp ('Integral region incorrectly specified.');
  return;
end

[r,c]=size(a);
if r != c && r == 1
  a=a';
end

[r,c]=size(b);
if r != c && r == 1
  b=b';
  r=c;
end

if size(n) != [1,1]
  disp ('n was not scalar');
  return;
end

if n < 1
  disp ('Nonsensical number of samples specified.');
  return;
end

% Begin Monte-Carlo integration algorithm
s = 0;
x=zeros(1,9);

for k=1:n
  x=a+(b-a).*rand(r,1);
  s=s+feval(fcn,x);
end

v=1;

for k=1:r
  v = v*(abs(b(k)-a(k)));
end

s=s*v/n; % division by zero ruled out above

return;
