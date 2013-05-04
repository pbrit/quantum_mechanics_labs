function Move_Packet

%  start and stop of cyrle simulated
%  move of wave packet, plots wave packet 
%  in different time points

% handle of figure
global hFig1;
% handles of contrles 'pushbutton'
global hBut1 hBut2 hBut3 hBut4 ;
% handles of contrles 'text'
global hTxtys1 hTxtys1T hTxtys2 hTxtys2T hTxtys3 hTxtys3T;
global hTxtys4 hTxtys4T;


% set for controls next mode: 'Enable off' or 'Enable on'
set(hBut1,'Visible','on','Enable','off');
set(hBut2,'Visible','on','Enable','on');
set(hBut4,'Visible','on','Enable','on');

set(hTxtys1,'Visible','on','Enable','on');
set(hTxtys1T,'Visible','on','Enable','on');
set(hTxtys2,'Visible','on','Enable','on');
set(hTxtys2T,'Visible','on','Enable','on');
set(hTxtys3,'Visible','on','Enable','on');
set(hTxtys3T,'Visible','on','Enable','on');
set(hTxtys4,'Visible','on','Enable','on');
set(hTxtys4T,'Visible','on','Enable','on');

% flag for stop and move of wave packet
global mov;
mov = 1;
cla; % deletes from the current axes all graphics objects 

%-------------------------------------------------------------
% PARAMETERS OF TASK
global m h E0 k0 v0 d0 x0 U0 q0 x1 x2 xBegin xEnd dt;
global flagStop;
%Data_Packet;

%m = 9.1e-31;                %mass of electron (kg)
%h = 1.05e-34;               %Plank's constant (J*s)
%E0 = 20;                    %energy of electron (eV)
%k0 = sqrt(2*E0*1.6e-19*m)/h*1.e-10 
%v0 = sqrt(2*E0*1.6e-19/m);  %velocity of electron (m/s)
%d0 = 4;                    %half-width of wave packet (A, Angstroem)
%x0 = -30.0;                 %center of wave packet (A, Angstroem)
%U0 = 20;                    %height of potential barrier (eV)
%q0 = sqrt(2*U0*1.6e-19*m)/h*1.e-10
%x1 = 0;                     %coordinates of potential barrier
%x2 = 5;                    %coordinates of potential barrier


%-------------------------------------------------------------
% TINE AND SPACE PARAMETERS

% time points, (fs, femtosecond)

% begin and end of line segment of axis 'x'
%xBegin = -60;
%xEnd = 60;
Lx = xEnd - xBegin;
%tEnd = Lx/v0*1.e+5

% step along axis 'x'
dx = Lx/200; 

% array of coordinates 'x' (A, Angstroem)
x = xBegin:dx:xEnd;      

Nx = length(x);

% start time
t0 = 0;
% array of values of wave packet in time 't0'
y0 = abs(PsiFun(x,x0,k0,h,m,d0,x1,x2,q0,Lx,t0)).^2;

y = y0;
t = t0;

% begin and end of line segment of axis 'y'
yBottom = 0;
yTop = max(y0)*1.25;



% plots lines y0(x) 
plot(x,y0);

% appearance of plot
axis([xBegin xEnd yBottom yTop]);
grid on
xlabel('x (A),  A - Angstroem')
ylabel('\rho (1/A)')

maxE =max([E0,U0]); 
yE = E0*yTop/maxE/2;
yU = U0*yTop/maxE/2;
line([xBegin xEnd],[yE yE],'LineWidth',2,'Color',[1 0 1]);
str = num2str(E0);
str = [' E0 = ',str,' eV'];
text(xBegin, yE, str,'VerticalAlignment','Bottom');
line([x1 x1 x2 x2],[0 yU yU 0],'LineWidth',3,'Color',[0 0.2 0.8]);
str = num2str(U0);
str = [' U0 = ',str,' eV'];
text(x1, yU, str,'VerticalAlignment','Bottom');
dk = 1/sqrt(2)/d0;
E2 = h*h*(k0+dk)^2*1e+20/2/m/1.6e-19;
if(k0>dk)
    E1 = h*h*(k0-dk)^2*1e+20/2/m/1.6e-19;
else
    E1 = 0;
end
yE1 = E1*yTop/maxE/2;
yE2 = E2*yTop/maxE/2;
line([xBegin xEnd],[yE1 yE1],'LineWidth',2,'Color',[0.8 0.5 0.8]);
str = num2str(E1);
str = [' E1 = ',str,' eV'];
text(xBegin, yE1, str,'VerticalAlignment','Bottom');
line([xBegin xEnd],[yE2 yE2],'LineWidth',2,'Color',[0.8 0.5 0.8]);
str = num2str(E2);
str = [' E2 = ',str,' eV'];
text(xBegin, yE2, str,'VerticalAlignment','Bottom');


% time step (fs, femtosecond)
%dt=0.05;
    
% cyrle simulated move of wave packet 
i=0;
while 1
    
    if(flagStop == 0)
        i = i+1;
    end
        yValue1 = abs(y(1));
        yValueN = abs(y(Nx));
    
    flag1 = ((flagStop == 1)&(yValue1 < 0.001*yTop)&(yValueN < 0.001*yTop));    
    if(flag1)
        i = i+1;
    end

    flag2 = ((flagStop == 1)&((yValue1 >= 0.001*yTop)|(yValueN >= 0.001*yTop)));    
    if(flag2)
        mov = -1;
    end

    
    line(x,y,'EraseMode','xor','LineWidth',2,'Color',[1 0.2 0]);
    axis([xBegin xEnd yBottom yTop]);
    grid on
    
    pause(0.001);

    % print of time
    str = num2str(t);
    set(hTxtys1,'String',str);

   
    m1 = find (x(:)>=xBegin & x(:)<=x1);
    % print of amplitude of wave packet
    if(length(m1)>1)
    str = num2str(trapz(x(m1),y(m1)));
    set(hTxtys2,'String',str);
    end

    m2 = find (x(:)>=x1 & x(:)<=x2);
    % print of amplitude of wave packet
    if(length(m2)>1)
    str = num2str(trapz(x(m2),y(m2)));
    set(hTxtys3,'String',str);
    end
    
    m3 = find (x(:)>=x2 & x(:)<=xEnd);
    % print of amplitude of wave packet
    if(length(m3)>1)
    str = num2str(trapz(x(m3),y(m3)));
    set(hTxtys4,'String',str);
    end
    

    t = dt*i;
    %y = [];
    yb = abs(PsiFun(x,x0,k0,h,m,d0,x1,x2,q0,Lx,t)).^2;

    
    
    
    % testing of state of controls 
    while 1 
        if(mov == -1) % <Stop>
            set(hBut1,'Visible','on','Enable','on');  % <Start>
            set(hBut2,'Visible','on','Enable','off'); % <Stop>
            set(hBut3,'Visible','on','Enable','on');  % <Move>
        end
    
        if(mov == 1) % <Move>
            set(hBut1,'Visible','on','Enable','off'); % <Start>
            set(hBut2,'Visible','on','Enable','on');  % <Stop>
            set(hBut3,'Visible','on','Enable','off'); % <Move>
            break
        end
  
        if(mov == 2) % <Close>
            break
        end
        
        pause(0.001);
    end
    
    line(x,y,'EraseMode','xor','LineWidth',2,'Color',[1 0.2 0]);
    drawnow;

     y = yb;
   
    % testing of state of control <Close>
   if mov == 2  
        close(hFig1);
        break
   end
   
end


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


