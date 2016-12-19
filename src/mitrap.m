%       mitrap.m
%
%       Implementación del método del trapecio para la resolución de EDIFs
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



function [t, u] = mitrap(f, x0, intervalo, N)


% Paso
h = (intervalo(2) - intervalo(1)) / N;

% Vector COLUMNA de nodos
t = [intervalo(1) : h : intervalo(2)]';


% Vector COLUMNA de soluciones
u = x0;     %Lo inicializamos dándole los valores iniciales del PVI

% Creamos el "vector" auxiliar z [matriz 4 filas y dim EDIF columnas]:
z = zeros(4, size(u, 2));

% Bucle que implementa el método del trapecio
% Va hasta N + 1 pues no hay componente 0 en los vectores de MatLab.
for I = 2 : N + 1
    
    z(1, :) = u(I - 1, :);
    for J = 1 : 3
        z(J + 1, :) = z(1, :) + h / 2 * (feval(f, t(I - 1), z(1, :)') + feval(f, t(I - 1) + h, z(J, :)'))';
    end
    u(I, :) = z(4, :);
    
    % OBSERVACIÓN: Las transposiciones de vectores vienen dadas por
    % trabajar, tanto la función de la EDIF como los vectores de nodos y
    % soluciones, con vectores columna en todas partes.
end

% Eliminamos las variables auxiliares
clear z;

