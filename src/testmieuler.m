%       testmieuler.m
%
%       Resoluci�n de EDIFs utilizando mieuler.m:
%       [Implementaci�n del m�todo de Euler para la resoluci�n de EDIFs]
%
%       Datos de entrada:
%           ninguno
%           recibe los datos desde mispracticas.m
%
%       Datos de salida:
%           gr�ficas obtenidas por misgraficas.m
%
%       Utiliza:
%           mispracticas.m
%           misgraficas.m
%           mieuler.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mieuler(f, x0, intervalo, N);   % Resuelve la EDIF por el m�todo de Euler
misgraficas;                    % Pinta las gr�ficas de la soluci�n