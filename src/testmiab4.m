%       testmiab4.m
%
%       Resolución de EDIFs utilizando miab4.m:
%       [Implementación del método de Adams-Bashforth de 4 pasos para la resolución de EDIFs]
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
%           miab4.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = miab4(f, x0, intervalo, N);     % Resuelve la EDIF por el método de AB orden 4
misgraficas;                    % Pinta las gráficas de la solución