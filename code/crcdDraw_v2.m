% crcdDraw_v2.m
%
% Script to draw the continuous rotation compliant device

hanbase = patch(linkbase);

for i = 1:NJ
    han{i} = patch(link{i});
    %showFrame(link{i},1.5,2);
end
