%       testmieuler.m
%
%       Resolución de EDIFs utilizando mimilsimp.m:
%       [Implementación del método de predicción(Milne)-corrección(Simpson) para la resolución de EDIFs]
%
%       Datos de entrada:
%           ninguno
%           recibe los datos desde mispracticas.m
%
%       Datos de salida:
%           gráficas obtenidas por misgraficas.m
%
%       Utiliza:
%           mispracticas.m
%           misgraficas.m
%           mimilsimp.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mimilsimp(f, x0, intervalo, N);   % Resuelve la EDIF por el método
%figure(1);
%hold on
misgraficas;                    % Pinta las gráficas de la solución

%plot(t, u(:, 1) , 'g')
%[t, u] = ode45(f, [intervalo(1), intervalo(2)], x0);
%plot(t, u(:, 1),  'r')