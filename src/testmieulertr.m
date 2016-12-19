%       testmieuler.m
%
%       Resoluci�n de EDIFs utilizando mieulertr.m:
%       [Implementaci�n del m�todo de predicci�n(Euler)-correcci�n(trapecio) para la resoluci�n de EDIFs]
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
%           mieulertr.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mieulertr(f, x0, intervalo, N);   % Resuelve la EDIF por el m�todo
misgraficas;                    % Pinta las gr�ficas de la soluci�n