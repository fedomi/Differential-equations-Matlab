%   funcion testmimetadap.m
%
%   NO REALIZAR ESTA PRÁCTICA!!!!!!!!!!!!!
%
%   Evalua un método adaptativo (dado un método) estimando el error
%   mediante la diferencia entre [2 pasos de h] y [un paso de 2h]
%
%   Datos de entrada
%       [...] TERMINAR

function testmimetadap(metodo, orden, tol);

mispracticas
%
metodo = @mieuler;
orden = 1;
tol = (10^(-3));
%
[t, u] = mimetadap(f, x0, intervalo, N, metodo, orden, tol)
misgraficas
misgraficas2

% 6/Abr/2006, por Roberto Marines.