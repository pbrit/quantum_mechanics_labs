function task3
  % find probability of electron in potential well
  % potential well is infinitely deep well

  clc   %clears all  from the Command Window
  clear %removes all variables from the workspace (memory)
  delete(findall(0,'Type','Figure'));


  %-------------------------------------------------------------
  % PARAMETERS OF TASK

  m = 9.1e-31;          % mass of electron (kg)
  h = 1.05e-34;         % Plank's constant (J*s)
  aA = 5.75;            % width of potential well (A, Angstroem)
  aC = aA * 1e-10;      % width of potential well (m, Angstroem)
  n = 1:3;              % quantum number range
  eV = 1.602e-19;       % single eV (J), See: http://en.wikipedia.org/wiki/Electron_volt

  x = [0:0.01:aA/3; aA/3:0.01:2*aA/3; 2*aA/3:0.01:aA];

  Y = @(n,x) (sqrt(2/aA)*sin(n*pi*x/aA)).^2;

  for i = 1:3
    for j = 1:3
      P(i,j) = trapz(x(j,:),Y(i,x(j,:)));
    end
    P(i,4) = sum(P(i,:));
  end

  P
end


