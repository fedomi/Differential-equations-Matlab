%       testmitrap.m
%
%       Resolución de EDIFs utilizando mitrap.m:
%       [Implementación del método del trapecio para la resolución de EDIFs]
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
%           mitrap.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mitrap(f, x0, intervalo, N);     % Resuelve la EDIF por el método del trapecio
misgraficas;                    % Pinta las gráficas de la solución