%   mimilne4.m
%
%   Función que implementa el método de Milne de 4 pasos:
%       y<n+1> = y<n-3> + 4h/3 * (2f<n> - f<n-1> + 2f<n-2>)
%   Inicializa el método utilizando el método de Runge-Kutta de orden 4
%   
%   Datos de entrada:
%       f  -> función de la EDIF [y' = f(x, y)]
%       x0 -> vector FILA de datos iniciales [y<sub>0]
%       intervalo -> intervalo de resolución numérica
%       N -> número de subintervalos [N + 1 = número de nodos]
%
%   Observación: N debería ser >= 4, por supuesto.
%
%   Datos de salida:
%       t -> vector columna de nodos
%       u -> matriz de valores aproximados [fila-i corresponde a los
%            valores de la solución numérica en el nodo t(i)].
%
%   Utiliza:
%       mirk4.m -> Implementación del método de Runge-Kutta de orden 4

function [t, u] = mimilne(f, x0, intervalo, N)


%Hallamos el paso:
h = (intervalo(2) - intervalo(1)) / N;


% Vector COLUMNA de nodos
t = [intervalo(1) : h : intervalo(2)]';


% Vector COLUMNA de soluciones
u = x0;     %Lo inicializamos dándole los valores iniciales del PVI


%INICIALIZAMOS LOS 4 PRIMEROS VALORES POR RUNGE-KUTTA DE ORDEN 4
    intervalo2 = [intervalo(1), intervalo(1) + h / 4];
    [t2, u2] = mirk4(f, x0, intervalo2, 4);
    for I = 1 : 4
        u(I, :) = u2(I, :);
    end
% y borramos las variables auxiliares utilizadas
    clear intervalo2;
    clear t2;
    clear u2;
% ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯


% Bucle que implementa el método de Adams-Bashforth de 4 pasos
% Va hasta N + 1 pues no hay componente 0 en los vectores de MatLab.
for I = 5 : N + 1
    k1 = feval(f, t(I - 1), u(I - 1, :)')';
    k2 = feval(f, t(I - 2), u(I - 2, :)')';
    k3 = feval(f, t(I - 3), u(I - 3, :)')';
    
    u(I , :) = u(I - 4, :) + 4 * h / 3 * (2 * k1 - k2 + 2 * k3);
    
    % OBSERVACIÓN: EN LAS FUNCIONES DE MÁS DE UNA DIMENSIÓN DE LAS EDIFs,
    % LOS VECTORES DE "EVALUCIÓN Y RESPUESTA" SON VECTORES COLUMNA,
    % MIENTRAS QUE EN ESTE BUCLE, EL VECTOR DE SOLUCIONES NUMÉRICAS ES UN
    % VECTOR FILA POR CADA UNO DE LOS NODOS.
end

% Eliminamos las variables auxiliares
clear k1;
clear k2;
clear k3;
clear k4;



% © 2006, por Roberto Marines.