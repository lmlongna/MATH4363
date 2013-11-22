%This is a script file to test your interpolation routine.
%
%It erases any file (in the Matlab path) called prog2run, and
%writes output to a file in the Matlab working directory called prog1run.
%
%By uncommenting the last line of code below, you can see a plot of your
%interpolator.
%
%If your code is working, expect to see truncation errors on the order
%of [e-5, e-2]

if exist('prog3run','file')==2, delete('prog3run'); end
format short e
diary prog3run

x = 0:2*pi/3:2*pi;  y = sin(x);  w = 3;
pofw = lagrangeval(x,y,w);
disp('degree 3 truncation error:'), pofw - sin(w)

x = 0:2*pi/5:2*pi;  y = sin(x);  w = 3;
pofw = lagrangeval(x,y,w);
disp('degree 5 truncation error:'), pofw - sin(w)

x = 0:2*pi/5:2*pi;  y = sin(x);  w = [3 4];
pofw = lagrangeval(x,y,w);
disp('degree 5 truncation error:'), pofw(:).' - sin(w)

x = 0:2*pi/8:2*pi;  y = sin(x);  w = [3 4 5];
pofw = lagrangeval(x,y,w);
disp('degree 8 truncation error:'), pofw - sin(w)

%If you want to see a plot of your interpolator, uncomment the following line:
w = 0:2*pi/127:2*pi;  plot(x,y,'.',w,lagrangeval(x,y,w)), title('degree 8 interpolation of sin over [0,2pi]')
