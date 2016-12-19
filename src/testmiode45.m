%   TestMiOde45.m
%
%   Práctica 4, apartado 6
%
%   Resuelve una EDIF utilizando el comando ODE45. Los datos necesarios
%   están en mispracticas.m y pinta las componentes y trayectorias de la
%   solución utilizando misgraficas.m
%
%   Datos de entrada:
%       Ninguno explícito
%
%   Datos de salida:
%       Ninguno explícito
%
%   Utiliza:
%       mispracticas.m
%       misgraficas.m



% mispracticas.m devuelve las variables:
%   f         -> función de la EDIF [u' = f(t, u)]
%   x0        -> vector de valores iniciales
%   intervalo -> intervalo donde resolvemos numéricamente
%   N         -> número de subintervalos

mispracticas
h = (intervalo(2) - intervalo(1)) / N;
[t, u] = ode45(f, [intervalo(1) : h : intervalo(2)], x0);
misgraficas

% misgraficas.m utiliza las matrices:
%   t -> vector de nodos [columna]
%   u -> matriz de componentes de la solucion [cada fila son los valores en
%        un nodo de t]

