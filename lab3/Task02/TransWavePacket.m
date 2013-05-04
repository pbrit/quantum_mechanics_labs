function Tw = TransWavePacket(m,h,U0,x1,x2,E0,x0,d0)
% plot dependence of Transmission Factor of wave packet on half-width

%clc   %clears all  from the Command Window
%clear %removes all variables from the workspace (memory) 

%-------------------------------------------------------------
% PARAMETERS OF TASK
%global m h E0 k0 v0 d0 x0 U0 q0 x1 x2 xBegin xEnd dt;
%global flagStop;

%m = 9.1e-31;                %mass of electron (kg)
%h = 1.05e-34;               %Plank's constant (J*s)
%E0 = 15;                    %energy of electron (eV)
k0 = sqrt(2*E0*1.6e-19*m)/h*1.e-10; 
%v0 = sqrt(2*E0*1.6e-19/m);  %velocity of electron (m/s)
%d0 = 8;                    %half-width of wave packet (A, Angstroem)
%x0 = -20;                 %center of wave packet (A, Angstroem)
%U0 = 20;                    %height of potential barrier (eV)
q0 = sqrt(2*U0*1.6e-19*m)/h*1.e-10;
%x1 = 0;                     %coordinates of potential barrier
%x2 = 2.5;                    %coordinates of potential barrier
a = x2 - x1;



    kBegin = k0 - 4/d0;
    kEnd = k0 + 4/d0;
    dk =(kEnd-kBegin)/1000;
    k = kBegin:dk:kEnd;
    E = (h*k).^2*1.e+20/2/m/1.6e-19;
    
    
    f = abs(CkFun(d0,k0,x0,k)).^2.*Trans(m,h,U0,a,E);
    Tw = trapz(k,f);
    
function Ck = CkFun(d0,k0,x0,k)
    Ck = sqrt(d0/pi^0.5)*exp(-((k-k0)*d0).^2/2 - i*k*x0);

    


function T = TFun(h,m,k,t) 
    T = exp(- i*h/2/m*k.^2*1.e+20*t*1.e-15);
    
function T = Trans(m,h,U0,a,E)
% calculate Transmission Factor for monochromatic electron


    k = 1/h*sqrt(2*m*E*1.6e-19)*1.e-10;
    q = 1/h*sqrt(2*m*(E - U0)*1.6e-19)*1.e-10;
    det = ((k.^2 + q.^2).*sin(q*a) + 2*i*k.*q.*cos(q*a));

    n1 = find(abs(q(:)*a) == 0);
    n2 = find(abs(q(:)*a) > 0);

   
    tc(n2) = 2*i*k(n2).*q(n2)./det(n2);

    if(length(n1) > 0)
        tc(n1) = 2*i./(k(n1)*a + 2*i);
    end

    T = abs(tc).^2;

    