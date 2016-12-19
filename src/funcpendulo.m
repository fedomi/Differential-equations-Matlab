%       Funci�n para la pr�ctica 4.3
%       Es la funci�n para la ecuaci�n diferencial del p�ndulo
%               x' = y
%               y' = M - 2(beta)y - g/l * sen x
%       [Ecuaci�n del p�ndulo]
%
%       Datos:
%           t -> valor de la variable independiente
%           x -> vector de componentes que guarda x1 y x2 [x e y]
%
%       Resultado:
%           f -> valor de la funci�n de la ecuaci�n diferencial en los
%           puntos t, x1 y x2.
%
%       Par�metros internos:
%           beta, M -> par�metros adicionales; las otras constantes se
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