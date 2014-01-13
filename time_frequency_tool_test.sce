//-- To change the default directory,
//   create scilab.ini file at C:\Users\USER\Documents
//   with a statement such as:
//   chdir "C:\yugo\statistics"

//-- To execute a script file like this, type:
//    exec("time_frequency_tool_test.sce")
//   in console or press Ctrl+L on Scinotes

//--- To make the graph window clear, type:
//    clf
clf

// Time-Frequency toolbox manual was downloaded from:
//  http://atoms.scilab.org/toolboxes/stftb/1.2.3/files/tutorial.pdf

//-- fmlin(number of points, initial normalized frequency, final normalized frequency)
sig1 = fmlin(128, 0, 0.5);

// Element-by-element multiplicative operations are obtained using .* , .^ , ./ , .\ or .'.
// http://help.scilab.org/docs/5.3.0/en_US/dot.html
// fftshift; Shift zero-frequency component of discrete Fourier transform to center of spectrum
dsp1 = fftshift(abs(fft(sig1)).^2);

//-- Here dsp1 is a simple array of 128 components --
// plot((-64:63)/128, dsp1);  //-- first argument is an array for x coordinate 

//-- get Wigner-Ville distribution of the chirp as a 2d array 
wvsig = tfrwv( sig1);

//-- prepare arrays for time and frequency
tary = 0:127;
tmp = linspace( 0, 0.5, 129);
fary = tmp(1:128); 
// customizing 3d plot in Scilab is still being learned
//plot3d( tary, fary, wvsig);

tfrwv( sig1, 'plot' ) ;
