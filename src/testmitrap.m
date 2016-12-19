%       testmitrap.m
%
%       Resoluci�n de EDIFs utilizando mitrap.m:
%       [Implementaci�n del m�todo del trapecio para la resoluci�n de EDIFs]
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
%           mitrap.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mitrap(f, x0, intervalo, N);     % Resuelve la EDIF por el m�todo del trapecio
misgraficas;                    % Pinta las gr�ficas de la soluci�n