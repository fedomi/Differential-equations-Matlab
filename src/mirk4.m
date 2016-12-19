%       mirk4.m
%
%       Implementaci�n del m�todo de Runge-Kutta de orden 4 para la resoluci�n de EDIFs
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



function [t, u] = mirk4(f, x0, intervalo, N)


% Paso
h = (intervalo(2) - intervalo(1)) / N;

% Vector COLUMNA de nodos
t = [intervalo(1) : h : intervalo(2)]';

% OJO: x0 es un vector fila; M = dimensi�n de la EDIF
% M = size(x0, 2);
% No es necesaria.

% Vector COLUMNA de soluciones
u = x0;     %Lo inicializamos d�ndole los valores iniciales del PVI

% Bucle que implementa el m�todo de RK4 [c1, c2, k1, k2, k3, k4 son variables auxiliares]
% Va hasta N + 1 pues no hay componente 0 en los vectores de MatLab.
for I = 2 : N + 1
    c1 = t(I - 1);      
    c2 = u(I - 1, :)';
    
    k1 = feval(f, c1      , c2           );
    k2 = feval(f, c1 + h/2, c2 + h/2 * k1);
    k3 = feval(f, c1 + h/2, c2 + h/2 * k2);
    k4 = feval(f, c1 +  h , c2 +  h  * k3);
    
    u(I , :) = u(I - 1, :) + h/6 * (k1 + 2 * k2 + 2 * k3 + k4)';
        
    % OBSERVACI�N: EN LAS FUNCIONES DE M�S DE UNA DIMENSI�N DE LAS EDIFs,
    % LOS VECTORES DE "EVALUCI�N Y RESPUESTA" SON VECTORES COLUMNA,
    % MIENTRAS QUE EN ESTE BUCLE, EL VECTOR DE SOLUCIONES NUM�RICAS ES UN
    % VECTOR FILA POR CADA UNO DE LOS NODOS. ESE ES EL MOTIVO DE LA
    % TRANSPOSICI�N DE LOS u(?, :) Y DE LOS k? EN LA F�RMULA FINAL.
end

% Eliminamos las variables auxiliares
clear c1;
clear c2;
clear k1;
clear k2;
clear k3;
clear k4;

