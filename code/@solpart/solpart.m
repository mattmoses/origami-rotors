function p = solpart(a)
%SOLPART Solid part object constructor.
%   p = solpart(a) creates a solid part object from an stl file.

if nargin == 0
   p.config = [];
   p.patchpoints = [];
   p.color = [];
   p.nverts = [];
   p = class(p,'solpart');
elseif isa(a,'solpart')
   p = a;
else
   fid = fopen(a,'r');
   if(fid<0)
       display('Error opening file');
       p.config = [];
       p.patchpoints = [];
       p.color = [];
       p.nverts = [];
       p = class(p,'solpart');
   else
       % get and write first line
       
       junk = fgetl(fid);

       bigX = [];
       bigY = [];
       bigZ = [];
       nverts = 0;

       % convert facets
       line = fgetl(fid);
          while( strcmp(line,'endsolid') ~= 1)
             facNorm = str2num(line(16:end));     
             outerloop = fgetl(fid);
             line = fgetl(fid);
             v1 = str2num(line(16:end));
             line = fgetl(fid);
             v2 = str2num(line(16:end));
             line = fgetl(fid);
             v3 = str2num(line(16:end));
             nverts = nverts + 3;
             foo = [v1;v2;v3];
             X = foo(:,1);
             Y = foo(:,2);
             Z = foo(:,3);
             %C = [.1 .5 .5];
             %patch(X,Y,Z,C);    
             bigX = [bigX,X(1),X(2),X(3)];
             bigY = [bigY,Y(1),Y(2),Y(3)];
             bigZ = [bigZ,Z(1),Z(2),Z(3)];     
             endloop = fgetl(fid);     
             endfacet = fgetl(fid);
             line = fgetl(fid);
          end
       fclose(fid);
       p.config = eye(4);
       p.patchpoints = [bigX;bigY;bigZ];
       p.color = [.3 .5 .5];
       p.nverts = nverts;
       p = class(p,'solpart'); 
   end   
end