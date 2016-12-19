%       testmirk4.m
%
%       Resoluci�n de EDIFs utilizando mirk4.m:
%       [Implementaci�n del m�todo de Runge-Kutta de orden 4 para la resoluci�n de EDIFs]
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
%           mirk4.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mirk4(f, x0, intervalo, N);     % Resuelve la EDIF por el m�todo de RK orden 4
misgraficas;                    % Pinta las gr�ficas de la soluci�n