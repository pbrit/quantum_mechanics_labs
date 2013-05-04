function Data_Packet
% set parameters of task

%-------------------------------------------------------------
% PARAMETERS OF TASK
global m h E0 k0 v0 d0 x0 U0 q0 x1 x2 xBegin xEnd dt;
global flagStop;

m = 9.1e-31;                %mass of electron (kg)
h = 1.05e-34;               %Plank's constant (J*s)
E0 = 24.;                    %energy of electron (eV)
k0 = sqrt(2*E0*1.6e-19*m)/h*1.e-10;
v0 = sqrt(2*E0*1.6e-19/m);  %velocity of electron (m/s)
d0 = 6;                    %half-width of wave packet (A, Angstroem)
x0 = -20;                 %center of wave packet (A, Angstroem)
U0 = 20;                    %height of potential barrier (eV)
q0 = sqrt(2*U0*1.6e-19*m)/h*1.e-10;
x1 = 0;                     %coordinates of potential barrier
x2 = 2.3;                    %coordinates of potential barrier


%-------------------------------------------------------------
% TINE AND SPACE PARAMETERS

% time points, (fs, femtosecond)

% begin and end of line segment of axis 'x'
xBegin = -40;
xEnd = 40;

% time step (fs, femtosecond)
dt=0.02;

% if flagStop = 1 then stop program
% when packet come running to boundery
% if flagStop = 0 then program nonstop
flagStop = 0;
