%   mieulertr.m
%
%   Implementa el método de predicción-corrección usando como predictor el
%   método de Euler y como corrector el método del trapecio.
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
%

function [t, u] = mieulertr(f, x0, intervalo, N)


h = (intervalo(2) - intervalo(1)) / N;

% Vector COLUMNA de nodos
t = [intervalo(1) : h : intervalo(2)]';

% Vector COLUMNA de soluciones
u = x0;     %Lo inicializamos dándole los valores iniciales del PVI


% Euler: x(n+1)=x(n)+h*f(x(n))
% Trapecio: x(n+1) = x(n) + (h/2) * (f(t(n),x(n)) + f(t(n+1),x(n+1)) 

for I = 2 : N + 1
    uprev = u(I - 1, :);   
    fprev = feval(f, t(I - 1), uprev');
        
    ueuler = uprev + h * fprev';
    u(I, :) = uprev + h / 2 * (fprev + feval(f, t(I - 1), ueuler))';
end

% Eliminamos las variables auxiliares
clear uprev;
clear fprev;
clear ueuler;