function [f] = fmc(nodes)
%
% Author: Matthew Petty
% Written in GNU Octave
%
% This is a program for testing mcquad.m

[r,c]=size(nodes);

if r != c && r == 1
  nodes=nodes';
  r=c;
end

if r ~= 9
  disp('9 nodes were not passed');
end

f=0;

for k=1:r
  f=f+nodes(k)^2;
end

return;
