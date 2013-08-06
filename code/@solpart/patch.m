function phandle = patch(p)
% SOLPART/PATCH graphical display of solid part using patch

movepoints = p.config * [p.patchpoints; ones(1,p.nverts)];

newX = reshape(movepoints(1,:),3, p.nverts/3);
newY = reshape(movepoints(2,:),3, p.nverts/3);
newZ = reshape(movepoints(3,:),3, p.nverts/3);

phandle = patch(newX, newY, newZ,p.color);
set(phandle,'FaceLighting','flat');
set(phandle,'EdgeColor', p.color);

set(phandle,'EdgeLighting','flat');