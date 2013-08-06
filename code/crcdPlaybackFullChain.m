% script that plays back sim data

clear all
close all

% This script loads the files and sets up the kinematics
crcdLoadT2;

theta = zeros(NJ,1)
%crcdUpdateKin_v2;
%crcdDraw_v2;
%crcdSetCam;

% comment this line out if you are running Matlab instead of GNU Octave:
more off
 
load optimizedbtvec.mat

[btrows,btcols] = size(btvec);

%theta = zeros(NJ,1);

for jj = 1:btcols
    theta = [btvec(:,jj) ; -btvec(end:-1:1,jj)];
    crcdUpdateKin_v2;    
    crcdDraw_v2;
	drawnow;
    if (jj == 1)
        crcdSetCam;
    end
    % getframe is not supported in GNU Octave. 
	% uncomment line below if you are running Matlab
    % movv(jj) = getframe(gcf);
    crcdDelete_v2;
end
% 
% set1 = btvec([1 3 5 7 9 11 13],:)';
% set2 = btvec([2 4 6 8 10 12],:)';
% phivec = linspace(0,(btcols-1)/btcols*2*pi,btcols);
% 
% figure
% subplot(1,2,1)
% %plot(phivec,360/2/pi*set1)
% plot(phivec,set1)
% hold on
% legend('1', '3', '5', '7', '9', '11', '13')
% xlabel('\phi (radians)')
% ylabel('\theta_i (radians)');
% title('odd numbered joint angles');
% %axis([0 9 -1.5 1.5])
% 
% subplot(1,2,2)
% %plot(phivec, 360/2/pi*set2)
% plot(phivec, set2)
% legend('2', '4', '6', '8', '10', '12')
% xlabel('\phi (radians)')
% ylabel('\theta_i (radians)');
% title('even numbered joint angles');
% %axis([0 9 -1.5 1.5])
% 
% 

% movie2avi not supported in GNU Octave, uncomment below if running matlab:
% movie2avi([movv movv movv movv movv movv],'optimizedFullChainMovie.avi','Compression','none','FPS',10)
% 
