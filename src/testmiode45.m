%   TestMiOde45.m
%
%   Pr�ctica 4, apartado 6
%
%   Resuelve una EDIF utilizando el comando ODE45. Los datos necesarios
%   est�n en mispracticas.m y pinta las componentes y trayectorias de la
%   soluci�n utilizando misgraficas.m
%
%   Datos de entrada:
%       Ninguno expl�cito
%
%   Datos de salida:
%       Ninguno expl�cito
%
%   Utiliza:
%       mispracticas.m
%       misgraficas.m



% mispracticas.m devuelve las variables:
%   f         -> funci�n de la EDIF [u' = f(t, u)]
%   x0        -> vector de valores iniciales
%   intervalo -> intervalo donde resolvemos num�ricamente
%   N         -> n�mero de subintervalos

mispracticas
h = (intervalo(2) - intervalo(1)) / N;
[t, u] = ode45(f, [intervalo(1) : h : intervalo(2)], x0);
misgraficas

% misgraficas.m utiliza las matrices:
%   t -> vector de nodos [columna]
%   u -> matriz de componentes de la solucion [cada fila son los valores en
%        un nodo de t]

