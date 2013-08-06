% script that makes a movie of the CRCD ribbon

clear all
close all

scalefac = .7*33/4/pi;
wr = 0.7;

nthet = 48
phi = linspace(0, (nthet-1)/nthet*2*pi, nthet);

for jj = 1:nthet
    crcdSetCam;
    crcdDrawRibbon(phi(jj), scalefac, wr);
    
	% getframe is not supported in GNU Octave. If you are running Matlab, you can
	% uncomment this line:
	% movv(jj) = getframe(gcf);
    drawnow
	cla

end

% movie2avi is not supported in GNU Octave. If you are running Matlab, you can
% uncomment this line:
% movie2avi([movv movv movv],'newRibbonMovie.avi','Compression','none','FPS',8)