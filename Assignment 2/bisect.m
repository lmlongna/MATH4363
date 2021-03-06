function [l,r,nf] = bisect(fname,a,b,tol)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% This program finds one root of a given function
% subroutine using the bisection method.
% 
% Inputs:
%	fname: 	a string variable containing the name
%		of the function subroutine
%	a, b:	the endpoints of the initial root-bracketing
%		interval. fname(a)*fname(b) must be <0 else
%		this program returns nothing useful
%	tol:	an acceptable error tolerance for the
%		computed root
%
% Outputs:
%	l, r:	the left and right endpoints of the final
%		root-bracketing interval
%	nf:	the total number of function evaluations
%		used in the computation of l and r
%

% First, the returned variables are initialized.

format long e;

l = a;
r = b;
aprime = feval(fname,l);
bprime = feval(fname,r);
tol=abs(tol);
nf = 2;

if sign(aprime)*sign(bprime)>=0	% if the initial bracketing interval
	return;			% doesn't contain a root, just exit

end
if tol < eps
	return;
end
% I would prefer to throw error flags for the last two conditions,
% but the assigned output arguments constrain me from doing so.	

% N = ceil(log2((b-a)/tol));	% compute the number of iterations required

% I do not think a for loop is the best method. If the tolerance is small
% and the initial bracketing interval large, N could overflow and the 
% for loop would run forever. So I will use a while loop.

while (b - a) >= tol
  p = a + ((b - a) / 2); 	% best guess is the midpoint of the bracketing interval
  pprime = feval(fname,p);
  nf = nf + 1;
  if sign(aprime) * sign(pprime) < 0 % if the root is to the left of p
    b = p;
    bprime = pprime;
  elseif sign(pprime) * sign(bprime) < 0 % if the root is to the right of p
    a = p;
    aprime = pprime;
  else				% in this unlikely condition, p is a root
    a = b = p;
  end
end

l=a;
r=b;

% For debugging:
% disp ('Left: '), disp(l);
% disp ('Right: '), disp(r);
% disp ('nf: '), disp(nf);

return; 
