%       Función para la práctica 4.3
%       Es la función para la ecuación diferencial del péndulo
%               x' = y
%               y' = M - 2(beta)y - g/l * sen x
%       [Ecuación del péndulo]
%
%       Datos:
%           t -> valor de la variable independiente
%           x -> vector de componentes que guarda x1 y x2 [x e y]
%
%       Resultado:
%           f -> valor de la función de la ecuación diferencial en los
%           puntos t, x1 y x2.
%
%       Parámetros internos:
%           beta, M -> parámetros adicionales; las otras constantes se
%           suponen fijadas como: l = 1, g = 9,8
%
%       2006, por Roberto Marines.

function f = funcpendulo(t, x)
beta =    0;
%beta = 0.25;
%beta =  1.5;
beta =  1/2;
M =   0;
%M = 0.9;
%M =   1;
M = 1.1;
f = [x(2); M - 2 * beta * x(2) - 9.8 * sin(x(1))];