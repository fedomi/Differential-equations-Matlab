%       Funci�n para las pr�cticas 4.3 y 10.1
%       Es la funci�n para la ecuaci�n diferencial
%               x' = y
%               y' = -[ALFA(x^2 - BETA)y + x]
%       [Ecuaci�n de Van Der Pol]
%
%       Datos:
%           t -> valor de la variable independiente
%           x -> vector de componentes que guarda x1 y x2 [x e y]
%
%       Resultado:
%           f -> valor de la funci�n de la ecuaci�n diferencial en los
%           puntos t, x1 y x2.
%
%       2006, por Roberto Marines.

function f = funcvanderpol(t, x)

alfa = 1;
beta =    1;
%beta = -0.2;
%beta =  0.2;
%beta =    0;

f = [x(2); -(((x(1) * x(1)) - beta) * alfa * x(2) + x(1))];