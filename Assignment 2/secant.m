function [x,nf] = secant(fname,x0,x1,tol)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% This function computes the root of a given
% function using the secant method. Typically,
% this routine will find a root, but it may not
% be the desired root.
%
% Inputs
%	fname:  a string variable containing
%		the function name
%	x0, x1: initial guesses
%	tol:	desired tolerance
%
% Outputs
%	x:	the approximated root
%	nf:	the number of function
%		evaluations performed by
%		this routine
%
% Error flag
%	if x is returned as x= -0, then
%	this routine did not converge to
%	any root with the given tolerance

format long e;

% Initialize the variables.
x=0;
nf = 0;
maxits = 30;

% The meat of the algorithm. This while loop
% computes iterations of the secant method.

x0prime=feval(fname,x0);
nf=nf+1;

while j <= maxits && abs(x1-x0)>tol
  x1prime=feval(fname,x1);
  nf=nf+1;
  x2 = x1 - x1prime*(x1-x0)/(x1prime-x0prime);
  x0 = x1;
  x0prime=x1prime;
  x1 = x2;
  j = j+1;
end

if abs(x1-x0)>tol
  x=-0;
else
  x=x2;
end

return;
