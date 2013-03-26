
% y = cos(x)exp(-y^2)
% x -10,10
% y -2,2

clc;
clear all;
delete(findall(0,'Type','figure'));

z = @(x,y) cos(x).*exp(-(y.^2));
x = -10:0.1:10;
y = -2:0.1:2;

[X Y] = meshgrid(x,y);
Z = z(X,Y);

hPlots = surf(X,Y,Z);

colormap(summer);




