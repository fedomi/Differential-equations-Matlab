%       testmirk4.m
%
%       Resolución de EDIFs utilizando mirk4.m:
%       [Implementación del método de Runge-Kutta de orden 4 para la resolución de EDIFs]
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
%           mirk4.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mirk4(f, x0, intervalo, N);     % Resuelve la EDIF por el método de RK orden 4
misgraficas;                    % Pinta las gráficas de la solución