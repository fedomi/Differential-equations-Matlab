%       testmirkf45.m
%
%       Resoluci�n de EDIFs utilizando mirkf45.m:
%       [Implementaci�n del m�todo de Runge-Kutta-Fehlberg para la resoluci�n de EDIFs]
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
%           mirkf45.m


% Carga los datos de la EDIF
mispracticas;

% Cargamos los datos necesarios para el control del error
        TOL = 1;% ^ (-3);
        FAC = 0.9;
        FACMAX = 5;
        HMAX = 10 ^ (-3);
% �������������������������������������������������������

%Variable para controlar si el paso es menor que el m�nimo pemitido.
error = 0; 

% Resuelve la EDIF por el m�todo de RK orden 4
[t, u, error] = mirkf45(f, x0, intervalo, N, TOL, FAC, FACMAX, HMAX);


if (error == 1)
    disp('ERROR EN LA EJECUCI�N: Se ha intentado dar un paso menor del m�nimo permitido.');
end

% Pinta las gr�ficas de la soluci�n, si no ha ocurrido ning�n error.
misgraficas;