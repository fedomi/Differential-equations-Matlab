%       testmirkf45.m
%
%       Resolución de EDIFs utilizando mirkf45.m:
%       [Implementación del método de Runge-Kutta-Fehlberg para la resolución de EDIFs]
%
%       Datos de entrada:
%           ninguno
%           recibe los datos desde mispracticas.m
%
%       Datos de salida:
%           gráficas obtenidas por misgraficas.m
%
%       Utiliza:
%           mispracticas.m
%           misgraficas.m
%           mirkf45.m


% Carga los datos de la EDIF
mispracticas;

% Cargamos los datos necesarios para el control del error
        TOL = 1;% ^ (-3);
        FAC = 0.9;
        FACMAX = 5;
        HMAX = 10 ^ (-3);
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

%Variable para controlar si el paso es menor que el mínimo pemitido.
error = 0; 

% Resuelve la EDIF por el método de RK orden 4
[t, u, error] = mirkf45(f, x0, intervalo, N, TOL, FAC, FACMAX, HMAX);


if (error == 1)
    disp('ERROR EN LA EJECUCIÓN: Se ha intentado dar un paso menor del mínimo permitido.');
end

% Pinta las gráficas de la solución, si no ha ocurrido ningún error.
misgraficas;