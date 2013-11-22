function [fx] = hwtest(x,y)
%
% Author: Matthew Petty
% Written in GNU Octave
% 
% Input: x in domain of f
% Output: f(x) in codomain of f
% 
format long e;
fx=x^3-7*x^2+14*x-6;
return;
