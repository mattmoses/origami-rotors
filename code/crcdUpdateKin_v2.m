% crcdUpdateKin_v2
%
% updates forward kinematics and Jacobian for 
% continuous rotation compliant device
%
% This uses the product of exponentials form as described in 
% Murray Li Sastry (MLS)
% J is a 6xNJ matrix, the "Spatial Manipulator Jacobian", see MLS page 116-121 
% the ith column of J is the twist axis of the ith joint in the current
% configuration

% initialize the 4x4 transformation matrix
tform = eye(4);

% this loops through each joint, constructing J and finding the
% configuration of each link
for i = 1:NJ
    % first we get the column of J corresponding to joint i
    J(:,i) = adjoint(tform)*[hat(-w(:,i))*q(:,i) ; w(:,i)];
    
    % next we find the transformation of link i
    tform = tform * twist2g(hat(-w(:,i))*q(:,i),w(:,i),theta(i));
    
    % set current configuration to transformation * initial config
    link{i}.config = tform * g_s(:,:,i);
end