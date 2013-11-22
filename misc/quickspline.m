function [C,errflag] = quickspline(n,a)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% This program computes the natural cubic spline for
% 3 knots.
% 
% Inputs:
%	n:	a column vector containing the nodes
%	a:	a column vector containing the corresponding
%		function values
%
% Outputs:
%	C:	a vector containing the values of the coefficients
%		of the natural cubic spline:
%       {a0, b0, c0, d0, a1, b1, c1, d1} corresponding to 
%       the standard form cubic polynomials associated with
%       a 3-node system
%
% Error flags:
%	 0	: no error
%	-1	: the inputs were not vectors
%	 1	: the knots were incomplete

format long;
errflag=0;

% First we make sure our vectors are of the appropriate type
[row,col]=size(n);
if col==1
  n=n';
elseif row != 1
  errflag = -1;
  return;
end

[row,col] = size(a);
if col==1
  n=n';
elseif row != 1
  errflag = -1;
  return;
end

% Do we have knots?
if size(a) != size(n)
  errflag = 1;
  return;
end

% I should include a test to make sure the nodes are in order if
% this routine is to see more use.

for k=1:1:col-1	% just to simplify the expressions in the matrix
  h(k)=n(k+1)-n(k);
end

% The Vandermonde matrix for a 3-node system:
% The columns respectively correspond to coefficients
% a0, b0, c0, d0, a1, b1, c1, d1
V=[1,0,0   ,0   ,0,0,0,0;  		% a0=y0
   0,0,0   ,0   ,1,0,0,0;  		% a1=y1
   1,h(1),h(1)^2,h(1)^3,0,0,0,0; 	% middle node continuity
   0,0,0   ,0   ,1,h(2),h(2)^2,h(2)^3; 	% last node continuity
   0,1,2*h(1)   ,3*h(1)^2   ,0,-1,0,0; 	% first derivative continuity
   0,0,2   ,6*h(1)   ,0,0,-2,0; 	% second derivative continuity
   0,0,2   ,0   ,0,0,0,0;		% natural spline at first node
   0,0,0   ,0   ,0,0,2,6*h(2);];	% natural spline at last node

R(1)=a(1);
R(2)=a(2);
R(3)=a(2);
R(4)=a(3);
R(5:8)=zeros;

C=inv(V)*R';

x1=n(1):1/100:n(2);
x2=n(2):1/100:n(3);

sx1=C(1) +C(2)*(x1-n(1)) +C(3)*(x1-n(1)).^2 +C(4)*(x1-n(1)).^3;
sx2=C(5) +C(6)*(x2-n(2)) +C(7)*(x2-n(2)).^2 +C(8)*(x2-n(2)).^3;

figure
plot(n,a,x1,sx1,x2,sx2)

return;
