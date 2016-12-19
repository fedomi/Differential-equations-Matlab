%   testmidisplin.m
%
%   Ejecuta midisplin.m
%
%   Utiliza midisplin.m, mirk4.m, p.m, q.m, r.m
%   Resuelve -u" + pu' + qu = r
%   Condiciones de contorno en este archivo.


% Práctica 22.i
intervalo = [0, 1];
CondicionT0 = 0;
CondicionTF = 2;
TipoCondicionT0 = 0;
TipoCondicionTF = 0;


% Práctica 22.ii
% intervalo = [0, 5];
% CondicionT0 = -2;
% CondicionTF = 1;
% TipoCondicionT0 = 0;
% TipoCondicionTF = 1;


% Práctica 22.iii
% intervalo = [0, 10];
% CondicionT0 = -2;
% CondicionTF = -1;
% TipoCondicionT0 = 1;
% TipoCondicionTF = 0;


% Práctica 22.iv
% intervalo = [0, 1];
% CondicionT0 = -2;
% CondicionTF = -1;
% TipoCondicionT0 = 1;
% TipoCondicionTF = 1;


% Prueba [seno/coseno] [exponencial]
%intervalo = [0, 1];
%CondicionT0 = 1;%1;
%CondicionTF = exp(1);
%TipoCondicionT0 = 0;
%TipoCondicionTF = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 100;

[t, u, valido] = midisplin(intervalo, N, CondicionT0, CondicionTF, TipoCondicionT0, TipoCondicionTF);

if (valido == 1)
    disp('El problema de contorno no tiene solución o tiene infinitas soluciones.');
else
    if (valido == 2)
        disp('El problema de contorno no tiene una única solución.');
        disp('Esta es una solución del mismo.');
    end
    hold on;
    %axis equal;
    plot(t, u(:, 1), 'r');
    plot(t, u(:, 2), 'g');
end