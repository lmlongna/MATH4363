function eps = macheps
%
% Author: Matthew Petty
%
% This subroutine approximates the machine epsilon,
% defined as the smallest positive float such that
%
% 		fl(1 + mu) > 1
%
% to within a factor of 2. To do this, the subroutine
% converges to mu from above. It is virtually identical
% to the sample code posted on the class website.
% I have retyped the code and studied it to ensure
% I have a clear understanding of the algorithm.

m = 0.1;		% this value works as well as the sample
t = 1.0 + m;	% remember, t is a float
while t > 1.0 
  m = m/2;
  t = 1.0 + m; % assign a new value to t
end
mu = 2*m;

disp(m);		% for author's purposes
