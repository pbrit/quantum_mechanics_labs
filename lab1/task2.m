
clc;
clear all;
delete(findall(0,'Type','figure'));

%Функции Бесселя

x = 0:0.1:20;
y0=besselj(0,x/2);
y1=besselj(3,x);

hPl=plot(x, y0, x, y1);

set(hPl,'LineWidth',3);

axis([0 10.0 -1.25 1.25]);

hy=line([0 0], [-1.25 1.25]);   %ось Oy
set(hy,'LineWidth',2,'color','black');

hx=line( [0 10.0], [0 0]);   %ось Ox
set(hx,'LineWidth',2,'color','black');

hAx=gca;
set(hAx,'xtick',[0 1 2 3 4 5 6 7 8 9 10],'ytick',[-1.0 -0.75 -0.5 -0.25 0.0 0.25 0.5 0.75 1.0],'FontSize',[14]);

hAx=gca;
set(hAx,'FontSize',[18]);

legend('J_{0}(z)','J_{3}(z)');

text( 9.5, -0.05, 'z','FontSize',[16]);

grid on;
