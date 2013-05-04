function free_movement()

% function 'free_movement()' plots wave packet
% in different time points


clc   %clears all  from the Command Window
clear %removes all variables from the workspace (memory)

%-------------------------------------------------------------
% PARAMETERS OF TASK

m = 9.1e-31;                % mass of electron (kg)
h = 1.05e-34;               % Plank's constant (J*s)
E0 = 50;                    % energy of electron (eV)
v0 = sqrt(2*E0*1.6e-19/m);  % velocity of electron (m/s)
d0 = 1.5;                   % half-width of wave packet (A, Angstroem)
x0 = 10.0;                  % center of wave packet (A, Angstroem)

%-------------------------------------------------------------
% TINE AND SPACE PARAMETERS

% time points, (fs, femtosecond)
t0 = 0;
t1 = 1.0;
t2 = 2*t1;
t3 = 3*t1;
t4= 4*t1;

% begin and end of line segment of axis 'x'
xBegin = 0;
xEnd = 120;
% step along axis 'x'
dx = (xEnd - xBegin)/1000;

% array of coordinates 'x' (A, Angstroem)
x = xBegin:dx:xEnd;

% array of values of wave packet in time 't0'
y0 = RoFun(x,x0,v0,h,m,d0,t0);
% array of values of wave packet in time 't1'
y1 = RoFun(x,x0,v0,h,m,d0,t1);
% array of values of wave packet in time 't2'
y2 = RoFun(x,x0,v0,h,m,d0,t2);
% array of values of wave packet in time 't3'
y3 = RoFun(x,x0,v0,h,m,d0,t3);
% array of values of wave packet in time 't4'
y4 = RoFun(x,x0,v0,h,m,d0,t4);

% plots lines y0(x), y1(x), y2(x), y3(x), y4(x)
plot(x,y0,x,y1,x,y2,x,y3,x,y4);

% appearance of plot
grid on
title('\rho ( x, t )');
xlabel('x (A)')
ylabel('\rho (1/A)')
hText0 = text(x0, max(y0),['   t= ',num2str(t0),'  fs']);
set(hText0,'Color',[1.0 0.0 0.0],'FontSize',[12]);
hText1 = text(x0+v0*1.e+10*t1*1.0e-15, max(y1),['   t= ',num2str(t1),'  fs']);
set(hText1,'Color',[1.0 0.0 0.0],'FontSize',[12]);
hText2 = text(x0+v0*1.e+10*t2*1.0e-15, max(y2),['   t= ',num2str(t2),'  fs']);
set(hText2,'Color',[1.0 0.0 0.0],'FontSize',[12]);
hText3 = text(x0+v0*1.e+10*t3*1.0e-15, max(y3),['   t= ',num2str(t3),'  fs']);
set(hText3,'Color',[1.0 0.0 0.0],'FontSize',[12]);
hText4 = text(x0+v0*1.e+10*t4*1.0e-15, max(y4),['   t= ',num2str(t4),'  fs']);
set(hText4,'Color',[1.0 0.0 0.0],'FontSize',[12]);


% half-width of wave packet (A, Angstroem)
function d = dFun(h,m,d0,t)
d = d0*sqrt(1 + ((h*t*1.0e-15)/(m*d0*d0*1.0e-20))^2);


% amplitude of wave packet (1/A, 1/Angstroem)
function A = AFun(h,m,d0,t)
A = 1/(d0*pi^0.5*sqrt(1 + ((h*t*1.e-15)/(m*d0*d0*1.e-20))^2));

% density distribution of probability of electron
% space distribution of wave packet in time 't'
function Ro = RoFun(x,x0,v0,h,m,d0,t)
Ro =AFun(h,m,d0,t)*exp(-(x-x0 - v0*1.e+10*t*1.e-15).^2/dFun(h,m,d0,t)^2);


