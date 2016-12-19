%   testmidispnolin.m
%
%   Ejecuta midispnolin.m
%
%   Utiliza midispnolin.m, mirk4.m
%   Resuelve u" = f(t, u, u')
%   Condiciones de contorno en este archivo.



% Prueba [exponencial]
% f = @exponencial;
% intervalo = [0, 1];
% CondicionT0 = 1;
% CondicionTF = exp(1);
% TipoCondicionT0 = 0;%1;
% TipoCondicionTF = 0;%01;
% 
% % Practica 24, (i):
%  f = @funcdispnolin;
%  intervalo = [1, 2];
%  CondicionT0 = 0;
%  CondicionTF = 2;
%  TipoCondicionT0 = 0; %1; %0;
% TipoCondicionTF = 0; %1; %0;

% Practica 24, (ii):
 f = @funcdispnolin;
 intervalo = [1, 2];
 CondicionT0 = 1;
 CondicionTF = -1;
 TipoCondicionT0 = 0; %1; %0;
 TipoCondicionTF = 0; %1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N = 100;
TOL = 10^(-15);%0.001;

[t, u, valido] = midispnolin(f, intervalo, N, CondicionT0, CondicionTF, TipoCondicionT0, TipoCondicionTF, TOL);

if (valido == 1)
    disp('No se ha encontrado solución para el problema.');
else
    hold on;
    %axis equal;
    plot(t, u(:, 1), 'r');
    plot(t, u(:, 2), 'g');
    %expm = exp(t);
    %plot(t, expm, 'b');
end