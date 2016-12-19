%       mieuler.m
%
%       Implementaci�n del m�todo de Euler para la resoluci�n de EDIFs
%
%       Datos de entrada:
%           f  -> funci�n de la EDIF [y' = f(x, y)]
%           x0 -> vector FILA de datos iniciales [y<sub>0]
%           intervalo -> intervalo de resoluci�n num�rica
%           N -> n�mero de subintervalos [N + 1 = n�mero de nodos]
%
%       Datos de salida:
%           t -> vector columna de nodos
%           u -> matriz de valores aproximados [fila-i corresponde a los
%           valores de la soluci�n num�rica en el nodo t(i)].



function [t, u] = mieuler(f, x0, intervalo, N);



% Paso
h = (intervalo(2) - intervalo(1)) / N;

% Vector COLUMNA de nodos
t = [intervalo(1) : h : intervalo(2)]';

% OJO: x0 es un vector fila; M = dimensi�n de la EDIF
% M = size(x0, 2);
% No es necesaria.

% Vector COLUMNA de soluciones
u = x0;     %Lo inicializamos d�ndole los valores iniciales del PVI

% Bucle que implementa el m�todo de Euler [s es una variable auxiliar]
% Va hasta N + 1 pues no hay componente 0 en los vectores de MatLab.
for I = 2 : N + 1
    s = u(I - 1, :);
    u(I, :) = s + h * feval(f, t(I - 1), s')';
    % OBSERVACI�N: EN LAS FUNCIONES DE M�S DE UNA DIMENSI�N DE LAS EDIFs,
    % LOS VECTORES DE "EVALUCI�N Y RESPUESTA" SON VECTORES COLUMNA,
    % MIENTRAS QUE EN ESTE BUCLE, EL VECTOR DE SOLUCIONES NUM�RICAS ES UN
    % VECTOR FILA POR CADA UNO DE LOS NODOS. ESE ES EL MOTIVO DE LA
    % TRANSPOSICI�N DE s Y DEL RESULTADO DE feval.
end

% Eliminamos la variable auxiliar s
clear s;


