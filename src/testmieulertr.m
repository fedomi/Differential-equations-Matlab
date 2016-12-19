%       testmieuler.m
%
%       Resolución de EDIFs utilizando mieulertr.m:
%       [Implementación del método de predicción(Euler)-corrección(trapecio) para la resolución de EDIFs]
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
%           mieulertr.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mieulertr(f, x0, intervalo, N);   % Resuelve la EDIF por el método
misgraficas;                    % Pinta las gráficas de la solución