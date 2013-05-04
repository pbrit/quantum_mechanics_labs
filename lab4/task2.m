function task2
% draw wave functions of electron in potential well
% potential well is infinitely deep well

  clc
  clear
  delete(findall(0,'Type','Figure'));

  %-------------------------------------------------------------
  % PARAMETERS OF TASK

  m = 9.1e-31;          % mass of electron (kg)
  h = 1.05e-34;         % Plank's constant (J*s)
  aA = 5.75;            % width of potential well (A, Angstroem)
  aC = aA * 1e-10;      % width of potential well (m, Angstroem)
  n = 1:3;              % quantum number range
  eV = 1.602e-19;       % single eV (J), See: http://en.wikipedia.org/wiki/Electron_volt
  border_factor = 1.2
  colors = ['g','c','m']
  text_points = [ 3 .6;      ...
                  3 -0.6;      ...
                  4.5 .6 ];

  % Compute waves
  x = 0:0.01:aA;
  W = @(n,x) sqrt(2/aA) * sin(pi * n * x / aA);

  % * Draw axes
  hor_border = max(W(1,x)) * border_factor;
  grid on;
  axis([-1 aA * border_factor -hor_border hor_border]);
  xlabel('x (A)');
  ylabel('\Psi (A^{-1/2})');

  % * Draw well's border
  line([0 0],   [-hor_border hor_border], 'Color', 'b', 'LineWidth', 2);
  line([aA aA], [-hor_border hor_border], 'Color', 'b', 'LineWidth', 2);

  % * Draw waves
  for i = 1:3
    line(x,W(i,x),'Color',colors(i))
    text(text_points(i,1),text_points(i,2),sprintf('\\Psi_{%d}',i),'FontSize',13)
  end
end
