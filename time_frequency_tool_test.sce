//-- To change the default directory,
//   create scilab.ini file at C:\Users\USER\Documents
//   with a statement such as:
//   chdir "C:\yugo\statistics"

//-- To execute a script file like this, type:
//    exec("time_frequency_tool_test.sce")
//   in console or press Ctrl+L on Scinotes

// Time-Frequency toolbox manual was downloaded from:
//  http://atoms.scilab.org/toolboxes/stftb/1.2.3/files/tutorial.pdf

sig1 = fmlin(128, 0, 0.5);

dsp1 = fftshift(abs(fft(sig1)).^2);
plot((-64:63)/128, dsp1);

//-- plot Wigner-Ville distribution of the chirp
tfrwv( sig1, 'plot' ) ;
