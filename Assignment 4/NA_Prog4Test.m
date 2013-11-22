%This is a script file to test the Monte-Carlo integration routine.
%
%It erases any file (in the Matlab path) called pro42run (I removed that), and
%writes output to a file in the Matlab working directory called prog1run.

try 
	delete('prog4run');
end

diary prog4run
format long e

a=[1,-2,1,-2,0,1,1,-1,0];
b=[2,0,3,1,3,2,3,1,2];
n=[512,2096,32768,262144,2097152];


[r,c]=size(n);
for k=1:c
  integral(k)=mcquad('fmc',a,b,n(k));
end;

integral=integral';
integral(c,4)=0;

for k=1:c
  integral(k,2) = n(k);
  integral(k,3) = 1/sqrt(n(k)); % division by zero ruled out above
  integral(k,4) = abs(5856-integral(k,1)) / 5856;
end

disp('First column: approximation, Second: n, Third: 1/sqrt(n), Fourth: relative error.');
disp(integral);
diary off;

return;
