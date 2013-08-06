function [r, Rotation, EA, EB, T, N, B] = crcdBackFunc(phi,s,wr,scale)
%CRCDBACKFUNC Creates backbone curve for a 
% Continuous Rotation Compliant Device.
%
% [r, Rotation, EA, EB, T, N, B] = crcdBackFunc(phi,s,wr,scale)
% phi is the angle of the moving platform and s is
%  a normalized length along the backbone.
%
% 0 <= phi < 2*pi
% 0 <= s <= 1
%
% r is a 3x1 vector to a point on the backbone.
% Rotation is a 3x3 matrix containing the frame at point r.
% EA and EB are 3x1 vectors from point at r to the sides of the ribbon.
%
% wr is the half-width of the ribbon.
% scale controls the size of the backbone curve.
% The total length of the curve is scale*4*pi.
%
% T, N, and B are the tangent, normal, and bi-normal vectors to
%  the backbone curve, respectively.

if (s <= 1/8)
    % first get point on backbone curve
    x = cos(phi) * (1 - cos(4*pi*s));
    y = sin(phi) * (1 - cos(4*pi*s));
    z = sin(4*pi*s);
    
    % next get unit tangent vector of backbone curve
    Tx = cos(phi) * (sin(4*pi*s));
    Ty = sin(phi) * (sin(4*pi*s));
    Tz = cos(4*pi*s);
    
    % unit normal to backbone curve
    Nx = cos(phi) * cos(4*pi*s);
    Ny = sin(phi) * cos(4*pi*s);
    Nz = -sin(4*pi*s);
    
    alpha = phi;
end


if (s > 1/8) && (s <= 1/2)
    % first get point on backbone curve
    x = cos(phi) * (1 - cos(4*pi*s));
    y = sin(phi) * (1 - cos(4*pi*s));
    z = 2-sin(4*pi*s);
    
    % next get unit tangent vector of backbone curve
    Tx = cos(phi) * (sin(4*pi*s));
    Ty = sin(phi) * (sin(4*pi*s));
    Tz = -cos(4*pi*s);
    
    % unit normal to backbone curve
    Nx = cos(phi) * cos(4*pi*s);
    Ny = sin(phi) * cos(4*pi*s);
    Nz = sin(4*pi*s);
    
    alpha = phi + pi;
end

if (s > 1/2) && (s <= 7/8)
    % first get point on backbone curve
    x = cos(phi) * (-1 + cos(4*pi*s));
    y = sin(phi) * (-1 + cos(4*pi*s));
    z = 2-sin(4*pi*s);
    
    % next get unit tangent vector of backbone curve
    Tx = cos(phi) * (-sin(4*pi*s));
    Ty = sin(phi) * (-sin(4*pi*s));
    Tz = -cos(4*pi*s);
    
    % unit normal to backbone curve
    Nx = -cos(phi) * cos(4*pi*s);
    Ny = -sin(phi) * cos(4*pi*s);
    Nz = sin(4*pi*s);    
    
    alpha = phi;
end

if (s > 7/8)
    % first get point on backbone curve
    x = cos(phi) * (-1 + cos(4*pi*s));
    y = sin(phi) * (-1 + cos(4*pi*s));
    z = 4+sin(4*pi*s);
    
    % next get unit tangent vector of backbone curve
    Tx = cos(phi) * (-sin(4*pi*s));
    Ty = sin(phi) * (-sin(4*pi*s));
    Tz = cos(4*pi*s);
    
    % unit normal to backbone curve
    Nx = -cos(phi) * cos(4*pi*s);
    Ny = -sin(phi) * cos(4*pi*s);
    Nz = -sin(4*pi*s);    
    
    alpha = phi + pi;
end

x = scale*x;
y = scale*y;
z = scale*z;

% find coordinates of points along each edge of the virtual ribbon
% wr = 1; % half-width of ribbon

% get the binormal vector B = T cross N
Bx = Ty*Nz - Tz*Ny;
By = Tz*Nx - Tx*Nz;
Bz = Tx*Ny - Ty*Nx;

Rx = cos(alpha)*Bx + sin(alpha)*Nx;
Ry = cos(alpha)*By + sin(alpha)*Ny;
Rz = cos(alpha)*Bz + sin(alpha)*Nz;

Qx = cos(alpha)*Nx - sin(alpha)*Bx;
Qy = cos(alpha)*Ny - sin(alpha)*By;
Qz = cos(alpha)*Nz - sin(alpha)*Bz;

EA = [0;0;0];
EB = [0;0;0];

EA(1) = x - wr*Rx;
EA(2) = y - wr*Ry;
EA(3) = z - wr*Rz;
EB(1) = x + wr*Rx;
EB(2) = y + wr*Ry;
EB(3) = z + wr*Rz;

r = [x;y;z];

desX = [Qx;Qy;Qz];
desY = [Rx;Ry;Rz];
desZ = [Tx;Ty;Tz];
 
Rotation = [desX, desY, desZ];

T = [Tx; Ty; Tz];
N = [Nx; Ny; Nz];
B = [Bx; By; Bz];

