function crcdDrawRibbon(phi, scalefac, wr)
%CRCDDRAWRIBBON
% crcdDrawRibbon(phi, scalefac, wr)
%
% Draws the crcd ribbon.
% phi is angle to backbone curve plane
% scalefac is overall scale
% wr is relative width of ribbon

n = 64;
s = linspace(0,1,n);

% ==1 if you want to draw the backbone
drawBB = 1;

for i = 1:n
    % get the points and frames
    [r, R, EA, EB, T, N, B] = crcdBackFunc(phi,s(i),wr,scalefac);
    
    % Now do some cumbersome unpacking of variables. I know there is a
    % better way to do this, but this is just how I did it, ok?
    
    % here are the coordinates of a point on the backbone
    x(i) = r(1);
    y(i) = r(2);
    z(i) = r(3);
    
    % coordinates of one side of the ribbon
    EAx(i) = EA(1);
    EAy(i) = EA(2);
    EAz(i) = EA(3);
    
    % coordinates of the other side of the ribbon
    EBx(i) = EB(1);
    EBy(i) = EB(2);
    EBz(i) = EB(3);

    % T is the unit tangent to the backbone
    Tx(i) = R(1,3);
    Ty(i) = R(2,3);
    Tz(i) = R(3,3);
    
    % N is the unit normal to the backbone
    Nx(i) = N(1);
    Ny(i) = N(2);
    Nz(i) = N(3);
    
    % B is the bi-normal vector B = T cross N
    Bx(i) = B(1);
    By(i) = B(2);
    Bz(i) = B(3);
    
    % Q and R are just N and B, respectively, rotated about T by an angle
    % alpha. This "roll" motion results in the twist of the ribbon along its
    % length.
    Qx(i) = R(1,1);
    Qy(i) = R(2,1);
    Qz(i) = R(3,1);
    Rx(i) = R(1,2);
    Ry(i) = R(2,2);
    Rz(i) = R(3,2);
    
end

% This draws the ribbon by itself
for i = 1:n-1
    segHan(i) = patch([EAx(i), EBx(i), EBx(i+1), EAx(i+1)], [EAy(i), EBy(i), EBy(i+1), EAy(i+1)], [EAz(i), EBz(i), EBz(i+1), EAz(i+1)], [0.95 0.95 0.95]);
end

% this "dithers" the two copies of the backbone so you can see it
% over the patches
dit = .01*scalefac;
if drawBB == 1
    hold on
    backboneLine1 = plot3(x+dit,y-dit,z-dit,'k');
    set(backboneLine1,'Linewidth',1);
    backboneLine2 = plot3(x-dit,y+dit,z+dit,'k');
    set(backboneLine2,'Linewidth',1);
end