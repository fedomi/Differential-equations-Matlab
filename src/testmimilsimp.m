%       testmieuler.m
%
%       Resoluci�n de EDIFs utilizando mimilsimp.m:
%       [Implementaci�n del m�todo de predicci�n(Milne)-correcci�n(Simpson) para la resoluci�n de EDIFs]
%
%       Datos de entrada:
%           ninguno
%           recibe los datos desde mispracticas.m
%
%       Datos de salida:
%           gr�ficas obtenidas por misgraficas.m
%
%       Utiliza:
%           mispracticas.m
%           misgraficas.m
%           mimilsimp.m



mispracticas;                   % Carga los datos de la EDIF
[t, u] = mimilsimp(f, x0, intervalo, N);   % Resuelve la EDIF por el m�todo
%figure(1);
%hold on
misgraficas;                    % Pinta las gr�ficas de la soluci�n

%plot(t, u(:, 1) , 'g')
%[t, u] = ode45(f, [intervalo(1), intervalo(2)], x0);
%plot(t, u(:, 1),  'r')