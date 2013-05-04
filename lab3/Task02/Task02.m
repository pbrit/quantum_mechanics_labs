function Task02
% plot dependence of Transmission Factor of wave packet on half-width

clc   %clears all  from the Command Window
clear %removes all variables from the workspace (memory) 





d0 = [2 3 4 5 6 7 8 9 10];
T = [0.235 0.177 0.136 0.105 0.080 0.060 0.043 0.031 0.022];

%Es = 15:0.05:60;
%SplineT1 = spline(E01,T1,Es);



m = 9.1e-31;                %mass of electron (kg)
h = 1.05e-34;               %Plank's constant (J*s)
E0 = 33;                    %energy of electron (eV)
%k0 = sqrt(2*E0*1.6e-19*m)/h*1.e-10; 
%v0 = sqrt(2*E0*1.6e-19/m);  %velocity of electron (m/s)
%d0 = 8;                    %half-width of wave packet (A, Angstroem)
x0 = -40;                 %center of wave packet (A, Angstroem)
U0 = 35;                    %height of potential barrier (eV)
%q0 = sqrt(2*U0*1.6e-19*m)/h*1.e-10;
x1 = 0;                     %coordinates of potential barrier
x2 = 4;                    %coordinates of potential barrier


d0w = 2:0.1:10
N = length(d0w)
for(i = 1:N)
Tt = TransWavePacket(m,h,U0,x1,x2,E0,x0,d0w(i))
Tw(i) = Tt; 
end

%plot(d0w, Tw);

plot(d0w,Tw,d0,T,'ro');
grid on
axis([2 10 0.0 0.3]);
xlabel('d_{0} (A)')
ylabel('T')
title('Transmission Factor   T = T(d_{0})');
