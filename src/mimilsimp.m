%   mimilsimp.m
%
%   Función que implementa el método de prediccion corrección que usa como
%   Predictor -> Método de Milne de 4 pasos
%   Corrector -> Método de Simpson de 2 pasos
%
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


function [t, u] = mimilsimp(f, x0, intervalo, N)


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


% MILNE [4 pasos]
% u[I] = u[I-4] + 4h/3 * (2 f[I-1] - f[I-2] + 2 f[I-3])
% SIMPSON [2 pasos]
% u[I] = u[I-2] + h/3 * (f[I] + 4 f[I-1] + f[I-2])


% Inicializamos los k? que no se generan [sólo sobreescriben] en el bucle
%k4 = feval(f, t(1), u(1, :)')';
k3 = feval(f, t(2), u(2, :)')';
k2 = feval(f, t(3), u(3, :)')';


% Va hasta N + 1 pues no hay componente 0 en los vectores de MatLab.
for I = 5 : N + 1
    k1 = feval(f, t(I - 1), u(I - 1, :)')';
    
    
    % Predictor [Milne]
    uprev = u(I - 4, :) + (4 * h / 3) * (2 * k1 - k2 + 2 * k3);
    
    
    % Corrector [Simpson]
    fprev = feval(f, t(I), uprev')';
    u(I , :) = u(I - 2, :) + (h / 3) * (fprev + 4 * k1 + k2);
    
       
    %k4 = k3;
    k3 = k2;
    k2 = k1;
    % OBSERVACIÓN: EN LAS FUNCIONES DE MÁS DE UNA DIMENSIÓN DE LAS EDIFs,
    % LOS VECTORES DE "EVALUCIÓN Y RESPUESTA" SON VECTORES COLUMNA,
    % MIENTRAS QUE EN ESTE BUCLE, EL VECTOR DE SOLUCIONES NUMÉRICAS ES UN
    % VECTOR FILA POR CADA UNO DE LOS NODOS.
end


% Eliminamos las variables auxiliares
clear k1;
clear k2;
clear k3;
%clear k4;
clear uprev;
clear fprev;



% © 2006, por Roberto Marines.