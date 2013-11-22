function [len,errflag] = hypotenuse(x,y)
%
% Author: Matthew Petty
%
% This program has been modified after grading
% comments by Dr. Mark Arnold, University of Arkansas.
% Changes are denoted by inline comments.
%
% This function computs the length of the hypotenuse
% given the lengths of the corresponding sides of a
% right-angle triangle.
%
% Inputs: x,y are the lengths of the sides of a 
%	right-angled triangle.
%
% Outputs: len is the length of the corresponding
%	hypotenuse.
%
% Errflag:
%	 -1 : The inputs were overflow or underflow.
%	  0 : No error.

% First, the returned variables are initialized.

len = 0;
errflag = 0;

% Second, the inputs are scaled to avoid overflow.

m = max(abs([x,y]));
if m <= eps || m == Inf % If the inputs are unworkable...
  errflag = -1;
  return;
end

x=x/m;
y=y/m;

len = m*sqrt(x^2+y^2);

return;
