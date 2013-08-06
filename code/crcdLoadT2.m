% crcdLoadT2.m
%
% Loads stl files for continuous rotation compliant device.
% This is based on crcdLoad_v2. It loads the full chain.
%
mainpath = './'

% linkbase is the fixed base part
linkbase = solpart([mainpath 'manip_base.stl']);

% NJ is the number of joints in the chain
NJ = 26;

% g_s is a 4x4xNJ array where each (:,:,i) entry is the initial
% configuration for link i
g_s = zeros(4,4,NJ);

% w is a 3xNJ array where each (:,NJ) entry is the twist axis for link i
w = zeros(3,NJ);

% q is a 3xNJ array where each (:,NJ) entry is a point on the 
% axis for link i
q = zeros(3,NJ);

for i = 1:12
   g_s(:,:,i) = [1 0 0 0; 0 1 0 0; 0 0 1 (i-1); 0 0 0 1];
   q(:,i) = [0 0 i-1]';
   switch mod(i,2)
       case 0
           link{i} = solpart([mainpath 'crcdTet2.stl']);
           w(:,i) = [1 0 0]';    
       case 1
           link{i} = solpart([mainpath 'crcdTet1.stl']);
           w(:,i) = [0 1 0]';
   end
end

link{13} = solpart([mainpath 'manip_tool_v4.stl']);
g_s(:,:,13) = [1 0 0 0; 0 1 0 0; 0 0 1 12; 0 0 0 1];
w(:,13) = [0 1 0]';
q(:,13) = [0 0 12]';

for i = 14:25
    g_s(:,:,i) = [1 0 0 0; 0 1 0 0; 0 0 1 (i-1); 0 0 0 1];
   q(:,i) = [0 0 i-1]';
   switch mod(i,2)
       case 1
           link{i} = solpart([mainpath 'crcdTet2.stl']);
           w(:,i) = [1 0 0]';    
       case 0
           link{i} = solpart([mainpath 'crcdTet1.stl']);
           w(:,i) = [0 1 0]';
   end
end

link{26} = solpart([mainpath 'manip_tool.stl']);
g_s(:,:,26) = [1 0 0 0; 0 1 0 0; 0 0 1 25; 0 0 0 1];
w(:,26) = [0 1 0]';
q(:,26) = [0 0 25]';


