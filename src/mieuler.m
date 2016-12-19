%       mieuler.m
%
%       Implementación del método de Euler para la resolución de EDIFs
%
%       Datos de entrada:
%           f  -> función de la EDIF [y' = f(x, y)]
%           x0 -> vector FILA de datos iniciales [y<sub>0]
%           intervalo -> intervalo de resolución numérica
%           N -> número de subintervalos [N + 1 = número de nodos]
%
%       Datos de salida:
%           t -> vector columna de nodos
%           u -> matriz de valores aproximados [fila-i corresponde a los
%           valores de la solución numérica en el nodo t(i)].



function [t, u] = mieuler(f, x0, intervalo, N);



% Paso
h = (intervalo(2) - intervalo(1)) / N;

% Vector COLUMNA de nodos
t = [intervalo(1) : h : intervalo(2)]';

% OJO: x0 es un vector fila; M = dimensión de la EDIF
% M = size(x0, 2);
% No es necesaria.

% Vector COLUMNA de soluciones
u = x0;     %Lo inicializamos dándole los valores iniciales del PVI

% Bucle que implementa el método de Euler [s es una variable auxiliar]
% Va hasta N + 1 pues no hay componente 0 en los vectores de MatLab.
for I = 2 : N + 1
    s = u(I - 1, :);
    u(I, :) = s + h * feval(f, t(I - 1), s')';
    % OBSERVACIÓN: EN LAS FUNCIONES DE MÁS DE UNA DIMENSIÓN DE LAS EDIFs,
    % LOS VECTORES DE "EVALUCIÓN Y RESPUESTA" SON VECTORES COLUMNA,
    % MIENTRAS QUE EN ESTE BUCLE, EL VECTOR DE SOLUCIONES NUMÉRICAS ES UN
    % VECTOR FILA POR CADA UNO DE LOS NODOS. ESE ES EL MOTIVO DE LA
    % TRANSPOSICIÓN DE s Y DEL RESULTADO DE feval.
end

% Eliminamos la variable auxiliar s
clear s;


