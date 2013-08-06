% sets camera parameters for the crcd code snippets

% camlight is not supported in GNU Octave. If you are running Matlab, you 
% can uncommnet this line:
%camlight left

axis equal
view(3)
xlabel('x')
ylabel('y')
zlabel('z')
axis(2*[-2 2 -2 2 0 4])
grid on