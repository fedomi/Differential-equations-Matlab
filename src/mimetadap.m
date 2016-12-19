%   mimetadap.m
%
%   Resuelve una EDIF mediante metodos adaptativos
%
%   Datos de entrada:
%       f  -> función de la EDIF
%       x0 -> datos iniciales
%       intevalo -> intervalo donde resolveremos numéricamente
%       N -> número de subintervalos; nos da el paso inicial.
%       metodo -> @archivo *.m donde se evalue el metodo
%       orden -> orden del método pasado en el parámetro anterior
%       TOL -> tolerancia máxima del error local
%
%   Datos de salida
%       t -> vector columna de nodos
%       u -> vector de soluciones numéricas [una columna por dimensión]
%



function [t, u] = mimetadap(f, x0, intervalo, N, metodo, orden, TOL)

% Constantes para el método adaptativo.
FAC = 0.9;
FACMAX = 1.5;
HMAX = 0.001;

% Paso
h = (intervalo(2) - intervalo(1)) / N;

% Inicializamos t un poco arbitrariamente, pues no conozco h ni N.
t = [intervalo(1) ;0; 0; 0; 0];
% Algo parecido para u
u = [x0; x0; x0];

% Inicializamos el contador de pasos para el bucle
I = 1;

while (t(I) < intervalo(2))
    % Llamamos al método elegido para evaluar el Error Local
    intervalo_aux = [t(I), t(I) + 2 * h];
    x0_aux = u(I, :);
    [t_aux1; u_aux1] = feval(metodo, [f, x0_aux, intervalo_aux, 2]);    % Método con dos pasos de h
    [t_aux2; u_aux2] = feval(metodo, [f, x0_aux, intervalo_aux, 1]);    % Método con un paso de 2*h
    
    % Hallamos el error local
    ERRORL = norm(u_aux1(3, :) - u_aux2(2, :));
    
    if (ERRORL < TOL * h)
        % Aceptamos el paso y pasamos al paso siguiente
        I = I + 1;
        u(I) = u_aux1(2, :);
        % En caso contrario, cambiamos h y repetimos el mismo paso
    end
    h = min([HMAX, h * FACMAX, h * FAC * ((TOL * h / ERRORL) ^ (1 / orden))]);
end


% 6/Abr/2006, por Roberto Marines