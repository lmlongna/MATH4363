%This is a script file to test the bisect and secant routines.
%
%It erases any file (in the Matlab path) called prog2run (I removed that), and
%writes output to a file in the Matlab working directory called prog1run.

try 
	delete('prog2run');
end

diary prog2run
format long e

[l,r,nfb] = bisect('fofx',0.7,0.9,1e-8);
p = l+(r-l)/2;
disp(' ')
disp(' ')
disp('   Bisect output:')
disp('root approx:'),p
disp(' ')
disp('error:'),abs(p-pi/4)
disp(' ')
disp('number of fcn evals:'),nfb
disp(' ')
disp(' ')

[x,nfs] = secant('fofx',0.65,0.7,1e-8);
disp('   Secant output:')
disp('root approx:'),x
disp(' ')
disp('error:'),abs(x-pi/4)
disp(' ')
disp('number of fcn evals:'),nfs
diary off
