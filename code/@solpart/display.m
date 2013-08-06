function display(p)
% SOLPART/DISPLAY Command window display of a polynom
%disp(' ');
disp([inputname(1),' configuration = '])
disp(num2str(p.config));
disp([inputname(1),' size of point array = [',num2str(size(p.patchpoints)),']'])
disp([inputname(1),' color = ', num2str(p.color)]);