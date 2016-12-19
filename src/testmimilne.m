%       testmimilne.m
%
%       Resoluci�n de EDIFs utilizando mimilne.m:
%       [Implementaci�n del m�todo de Milne de 4 pasos para la resoluci�n de EDIFs]
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
%           mimilne.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mimilne(f, x0, intervalo, N);     % Resuelve la EDIF por el m�todo de AB orden 4
misgraficas;                    % Pinta las gr�ficas de la soluci�n