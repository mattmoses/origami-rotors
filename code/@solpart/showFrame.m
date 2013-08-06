function showFrame(p,L,weight)
% SOLPART/SHOWFRAME draw coordinate frame of a part
% showFrame(p,L,weight) draws a red, green, blue triad at the 
% frame of part p. L is the length of the lines and weight is their
% LineWidth.

g = p.config;
x = g(1,4);
y = g(2,4);
z = g(3,4);

line([x L*g(1,1)+x],[y L*g(2,1)+y],[z L*g(3,1)+z],'Color','red','LineWidth',weight);
line([x L*g(1,2)+x],[y L*g(2,2)+y],[z L*g(3,2)+z],'Color','green','LineWidth',weight);
line([x L*g(1,3)+x],[y L*g(2,3)+y],[z L*g(3,3)+z],'Color','blue','LineWidth',weight);

