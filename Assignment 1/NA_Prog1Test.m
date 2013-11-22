% This is a script file to test the macheps and quadroot routines.
%
% Save this file with your other matlab files (like startup.m, macheps.m and
% quadroot.m).  Then in the command window type (without the >>)
% >> NA_Prog1Test
%
% It erases any file (in the Matlab path) called prog1run, and
% writes output to a file in the Matlab working directory called prog1run.
%
% When your code is working to your satisfaction, print out and email me
% macheps.m, quadroot.m and prog1run

try
    delete('prog1run')
end

diary prog1run

format long e
myeps = macheps
[r1,r2,erfl]=quadroot(1,1,-2);
disp('zeros of x^2 + x - 2:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(-1,-1,2);
disp('zeros of -x^2 - x + 2:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(1e155,1e155,-2e155);
disp('zeros of 1e155x^2 + 1e155x - 2e155:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(1e-155,1e-155,-2e-155);
disp('zeros of 1e-155x^2 + 1e-155x - 2e-155:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(1,-2,2);
disp('zeros of x^2 - 2x + 2:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(1e-42,-2,2);
disp('zeros of 1e-42x^2 - 2x + 2:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(0,-2,2);
disp('zeros of 0x^2 - 2x + 2:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(0,0,2);
disp('zeros of 0x^2 + 0x + 2:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(3e-7,3,-5e-13);
disp('zeros of 3e-7x^2 + 3x - 5e-13:'),[r1,r2],erfl,disp(' ')
[r1,r2,erfl]=quadroot(-3e-7,-3,5e-13);
disp('zeros of -3e-7x^2 - 3x + 5e-13:'),[r1,r2],erfl,disp(' ')

diary off
