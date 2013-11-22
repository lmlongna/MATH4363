function [p] = lagrangeval(x,y,w)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% A subroutine to evaluate the Langrange interpolant for
% a set of knots.
%
% Inputs
%	x: a vector containing the nodes
%	y: the corresponding function values such that
%	   f(x_i)=y_i
%	w: a vector containing the points to be evaluated,
%	   such that x(1) <= w(k) <= x(size(x)) for all k
%
% Outputs
%	p: a vector containing the values of the lagrange
%	   interpolant constructed with along the given nodes
%	   an evaluated at each point in the vector w
%
% Error flags (not returned by the code due to assignment constraints)
%	0: no error
%      -1: inputs aren't vectors	

format long; 

% First,  some input checking
[row,col]=size(x);
if col==1
  x=x';
  col=row;
elseif row != 1
  errflag = -1;
  errflag
  return;
end

its(1)=col; % this value will be used in our loops

[row,col] = size(y);
if col==1
  y=y';
elseif row != 1
  errflag = -1;
  errflag
  return;
end

[row,col] = size(w);
if col==1
  w=w';
  col=row;
elseif row != 1
  errflag = -1;
  errflag
  return;
end

its(2)=col;

if size(x) != size(y)
  errflag = -1;
  return;
end

% This algorithm uses Neville's method to estimate the
% function values at each entry in w

% Variable initialization.
p(1:its(2))=zeros;
q=y'; % this sets the values of each linear lagrange interpolant

% The main loop.
% This generates one Neville table for each value in w, recording
% the final value in the table before generating the next.
for m=1:1:its(2)
  for k=2:1:its(1)
    for l=2:1:k
      q(k,l)=(1/(x(k)-x(k-(l-1))))*((w(m)-x(k-(l-1)))*q(k,l-1) - (w(m)-x(k))*q(k-1,l-1));
    end
  end
  p(m)=q(its(1),its(1));
end

return;

