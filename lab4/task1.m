function task1
  % draw energy levels of electron in potential well
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

  % Compute levels
  jE = (h^2 * pi^2 * n.^2) / ( 2 * aC^2 * m );
  eE = jE / eV

  % Draw levels

  % * Draw axes
  infE   = border_factor * eE(3);
  rootH  = figure;
  axis([-1 aA * border_factor 0 infE]);
  xlabel('x (A)');
  ylabel('U, E (eV)');
  grid on;


  % * Draw well's border
  line([0 0],   [0 infE], 'Color', 'b', 'LineWidth', 2);
  line([aA aA], [0 infE], 'Color', 'b', 'LineWidth', 2);
  line([0 aA], [0 0],    'Color', 'b', 'LineWidth', 2);

  % * Draw levels
  for i = 1:3
    line([0 aA], [eE(i), eE(i)], 'Color', 'r', 'LineWidth', 1);
    text(4.0,eE(i)+0.5,sprintf('E_{%d}',i),'FontSize',13)
  end
end




