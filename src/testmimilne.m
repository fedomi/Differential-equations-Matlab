%       testmimilne.m
%
%       Resolución de EDIFs utilizando mimilne.m:
%       [Implementación del método de Milne de 4 pasos para la resolución de EDIFs]
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
%           mimilne.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mimilne(f, x0, intervalo, N);     % Resuelve la EDIF por el método de AB orden 4
misgraficas;                    % Pinta las gráficas de la solución