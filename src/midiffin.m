%   midiffin.m
%
%   Implementa el método de diferencias finitas para problemas lineales.
%       -u" + pu' + qu = r
%       u(T0) = a     
%       u(TF) = b     
%
%   Datos de entrada:
%       p -> @funcion p
%       q -> @funcion q
%       r -> @funcion r
%       Intervalo -> Vector [T0, TF] que representa el intervalo donde
%                    resolveremos
%       N -> Numero de subintervalos en que dividiremos [T0, TF]
%       CondicionEnT0 -> Valor para la condición de contorno en T0
%       CondicionEnTF -> Valor para la condición contorno en TF
%
%   Datos de salida:
%       t -> Vector de nodos
%       u -> Vector de valores de la solución estimada en cada nodo


function [t, u] = midiffin(p, q, r, Intervalo, N, CondicionEnT0, CondicionEnTF)

h = (Intervalo(2) - Intervalo(1)) / (N - 1); % El -1 es para que t y u sean de la misma longitud.
t = [Intervalo(1) : h : Intervalo(2)];

% CONSTRUIMOS LA MATRIZ TRIDIAGONAL A = [C A B] y el vector R (Au = R)
% Diagonal principal:
A = zeros(1, N);
for I = 1 : N
    A(I) = 2 + ((h ^ 2) * feval(q, t(I)));
end
% Diagonal superior [B] e inferior [C]
B = zeros(1, N - 1);
C = zeros(1, N - 1);
for I = 1 : N 
    vp = feval(p, t(I));
    B(I) = 1 - (h * vp / 2);
    C(I) = 1 + (h * vp / 2);
end
% CONSTRUIMOS EL VECTOR COLUMNA R [Au = R]
R = zeros(N, 1);
for I = 1 : N
    R(I) = (h ^ 2) * feval(r, t(I));
end
% Agregamos a R las condiciones de contorno
R(1) = R(1) + CondicionEnT0 * C(1);
R(N) = R(N) + CondicionEnTF * B(N);
% Y, finalmente, borramos de las diagonales B y C los elementos que sobran
% y que han sido auxiliares para el vector R.
B = B(1 : N - 1);
C = C(2 : N);

% Ya tenemos las matrices del sistema de ecuaciones lineal Au = b
%       /  A1   - B1                          \
%       | - C2   A2   - B2                    |
%       |       - C3   A3  ...                |
%   A = |.....................................|
%       |          ...   AN-2  - BN-2         |
%       |               - CN-1  AN-1   - BN-1 |
%       \                       - CN     AN   /
% Donde "Ai = A(i), Bi = B(i) y Ci = C(i - 1)"
% Resolvamos el sistema [NOTA: Se realizara por el metodo para resolucion
% de sistemas tridiagonales que aparecen en las paginas 152..157 del libro
% "Metodos Numericos (2ª edicion)" de Juan Antonio Infante y Jose Maria Rey
% [editorial Piramide].
% Recuerdese que los B y C tienen el signo cambiado.

M = zeros(1, N);
G = zeros(1, N);
CKMK = zeros(1, N - 1);
%
M(1) = A(1);
G(1) = R(1) / M(1);
%
for I = 2 : N
    CKMK(I - 1) = - (B(I - 1) / M(I - 1));
    %
    M(I) = A(I) - CKMK(I - 1) * (- C(I - 1));
    %
    G(I) = (R(I) - G(I - 1) * (- C(I - 1))) / M(I);
end
%
u = zeros(N, 1);
u(N) = G(N);
%
for I = 1 : N - 1
    K = N - I;
    %
    u(K) = G(K) - (CKMK(K) * u(K + 1));
end

% Eliminamos las variables auxiliares
clear M;
clear G;
clear CKMK;
clear K;


% =========================================================================
% Pruebas para la funcion exponencial [vemos la resolucion del sistema]:
%     h = zeros(N, 1);
%     h(1) = A(1) * u(1) - B(1) * u(2);
%     for I = 2 : N - 1
%         h(I) = -C(I - 1) * u(I - 1) + A(I) * u(I) - B(I) * u(I + 1);
%     end
%     h(N) = -C(N - 1) * u(N - 1) + A(N) * u(N);
%     %
%     figure(1);
%     title('Diferencia entre el vector R y el vector Au calculado numericamente');
%     plot(t, R - h);
%     figure(2);
%     title('Comparacion entre la exponencial [rojo] y la solucion numerica [azul]');
%     hold on;
%     plot(t, exp(t), 'r');
%     plot(t, u, 'b');
%     figure(3);
% =========================================================================


% 2006, por Roberto Marines.