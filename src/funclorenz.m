%   FUNCLORENZ.m
%
%   Función de la EDIF de la ecuación de Lorenz:
%       x' = sigma * (y - x)
%       y' = ro * x - y - x * z

function f = funclorenz(t, x)

sigma = 10;
ro = 100.795; % 99.524; % 100.5; % 24.74; % 13.962; % 1; % 30; % 0.1;
beta = 8/3;

% SOLUCIÓN PERIÓDICA CON EL DATO INICIAL (0, 5, 75)
ro = 100.5;
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

y(1) = sigma * (x(2) - x(1));
y(2) = ro * x(1) - x(2) - x(1) * x(3);
y(3) = x(1) * x(2) - beta * x(3);

f = [y(1); y(2); y(3)];