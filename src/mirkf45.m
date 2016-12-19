%   mirkf45.m
%
%   Implementa el método de Runge-Kutta-Felhberg
%
%   Datos de entrada [EDIF]:
%       f           -> función de la EDIF
%       x0          -> datos iniciales
%       intervalo   -> intervalo donde queremos resolver numéricamente
%       N           -> número de pasos que daríamos si no variase el paso
%   Datos de entrada [Control]:
%       TOL         -> Tolerancia para el error
%       FAC         -> Factor de incremento para el paso
%       FACMAX      -> Máximo factor de incremento, independiente de la TOL
%       HMAX        -> Paso máximo que dará el método


function [t, u, error] = mirkf45(f, x0, intervalo, N, TOL, FAC, FACMAX, HMAX);


% Inicializamos las constantes internas al método.
P = 4;  % Orden del método de Runge-Kutta primero [4].


% OBSERVACIÓN: Al incializart [vector de nodos] y u [vector de columnas]
% los valores importantes son la primera coordenada; el resto se
% sobreescriben por motivos ajenos a la práctica y no influyen en la misma.

% Inicializamos las variables que usaremos.
%       h = (intervalo(2) - intervalo(1)) / 10 ; %Recomendación del profesor;
%       sin embargo, queda mejor con el que puse:
h = min([HMAX, (intervalo(2) - intervalo(1)) / N]);
t = [intervalo(1); intervalo(1) + h];   % lo inicializamos
I = 2;


% Inicializamos el vector de soluciones
u = [x0; x0; x0] ;


% Inicializamos las variables para controlar los pasos mínimos
HMIN = min([h / 100, 0.00001]);
error = 0;

% Bucle principal
while ((t(I - 1) < intervalo(2)) && (error == 0))
    % Va hasta que t(I - 1) pase del extremo superior para coger también la
    % posibilidad de interpolar en dicho punto. Luego, el nodo que sobre se
    % eliminará tras el bucle.
    
    F1 = feval(f, t(I - 1),                  u(I - 1, :))';
    F2 = feval(f, t(I - 1) + h / 4,         (u(I - 1, :) + h * F1 / 4))';
    F3 = feval(f, t(I - 1) + 3 * h / 8,     (u(I - 1, :) + 3 * h * F1 / 32      + 9 * h * F2 / 32))';
    F4 = feval(f, t(I - 1) + 12 * h / 13,   (u(I - 1, :) + 1932 * h * F1 / 2197 - 7200 * h * F2 / 2197  + 7296 * h * F3 / 2197))';
    F5 = feval(f, t(I - 1) + h,             (u(I - 1, :) + 439/216 * h * F1     - 8 * h * F2            + 3680/513 * h * F3     - 845/4104 * h * F4))';
    F6 = feval(f, t(I - 1) + h / 2,         (u(I - 1, :) - 8/27 * h * F1        + 2 * h * F2            - 3544/2565 * h * F3    + 1859/4104 * h * F4    - 11/40 * h * F5))';
    
    % Vamos a omitir la h como factor o divisor en los siguientes calculos
    % pues se simplifica consigo misma en muchos de ellos. La pondremos
    % cuando sea preciso.
    
    % Y_1 = u(I - 1, :) + h * (25/216 * F1 + 1408/2565 * F3  + 2197/4104 * F4   - F5 / 5);
    % Y_2 = u(I - 1, :) + h * (16/135 * F1 + 6656/12825 * F3 + 28561/56430 * F4 - 9/50 * F5 + 2/55 * F6);
    Y_1 = (25/216 * F1 + 1408/2565 * F3  + 2197/4104 * F4   - F5 / 5);
    Y_2 = (16/135 * F1 + 6656/12825 * F3 + 28561/56430 * F4 - 9/50 * F5 + 2/55 * F6);
    
    ERRORL = norm(Y_2 - Y_1, inf);
    
    if ERRORL < TOL
        t(I) = t(I - 1) + h;
        u(I, :) = u(I - 1, :) + Y_1(:)' * h;
        I = I + 1;
    end

    if ERRORL > 0
        h = min([HMAX, h * min([FACMAX, FAC * ((TOL / ERRORL) ^ (1 / (P + 1)))])]);
    else
        h = min([HMAX, h * FACMAX]);
    end
    if h < HMIN
        error = 1;
    end
end


% Eliminamos las variables auxiliares
clear I;
clear Aux;
clear iniAux;
clear intervaloAux;
clear Inicializador;
clear ERRORL;