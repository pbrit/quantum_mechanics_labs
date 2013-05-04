function Task01
% plot dependence of Transmission Factor of wave packet on energy

clc   %clears all  from the Command Window
clear %removes all variables from the workspace (memory) 


%-------------------------------------------------------------
% PARAMETERS OF TASK

m = 9.1e-31;                %mass of electron (kg)
h = 1.05e-34;               %Plank's constant (J*s)
U0 = 20;                    %height of potential barrier (eV)
a = 2.5;                     %width of potential barrier (A, Angstroem)

% plot T = T(E) for monochromatic electron
EBegin = 10;
EEnd = 60;
E = EBegin:0.01:EEnd;
% calculate Transmission Factor for monochromatic electron
T = Trans(m,h,U0,a,E);



% d0 = 8 (A)
E01 = [15 17.5 20 22.5 25 27.5 30 32.5 35 ...
    37.5 40 42.5 45 47.5 50 52.5 55 57.5 60];
T1 = [0.012 0.041 0.152 0.463 0.825 0.911 0.848 0.825 0.857 ...
    0.910 0.959 0.986 0.992 0.984 0.971 0.961 0.957 0.958 0.964];

Es = 15:0.05:60;
SplineT1 = spline(E01,T1,Es);


plot(E,T,Es,SplineT1);
grid on
axis([EBegin EEnd 0.0 1.0]);
xlabel('E (eV)')
ylabel('T')
title('Transmission Factor   T = T(E)');