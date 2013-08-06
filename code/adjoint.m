function A = adjoint(g)
% function A = adjoint(g)
% Returns 6x6 adjoint matrix given
% a 4x4 representation of an element of SE(3)
% A = [R hat(p)R; 0 R]

R = [g(1,1) g(1,2) g(1,3);g(2,1) g(2,2) g(2,3);g(3,1) g(3,2) g(3,3)];
p = [g(1,4);g(2,4);g(3,4)];
A = [R hat(p)*R; zeros(3,3) R];