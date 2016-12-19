%       Función para la práctica 4.1
%       Es la función para la ecuación diferencial
%               x' = y
%               y' = -16x + 4sen(2t)
%       [Ecuación del corazón]
%
%       Datos:
%           t -> valor de la variable independiente
%           x -> vector de componentes que guarda x1 y x2
%
%       Resultado:
%           f -> valor de la función de la ecuación diferencial en los
%           puntos t, x1 y x2.
%
%       2006, por Roberto Marines.

function f = funcorazon(t, x)
f = [x(2); -16 * x(1) + 4 * sin(2 * t)];