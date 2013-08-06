function g = twist2g(v,w,theta)
% g = twist2g(v,w,theta)
% exponential map of se(3) to SE(3)
% g is an element of SE(3) represented as a 4x4 matrix
% v,w, and theta are twist coordinates for the infinitesimal motion in
% the tangent space se(3).
% v and w must be three element column vectors, theta must be scalar

if (w == [0 0 0]')
    % prismatic joint
    g = [eye(3) theta*v; 0 0 0 1];
else
    % revolute joint
    R = eye(3) + hat(w)*sin(theta) + hat(w)^2*(1-cos(theta));
    p = (eye(3) - R)*(hat(w)*v) + w * w' * v * theta;
    g = [R p; 0 0 0 1];
end