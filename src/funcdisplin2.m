%   funcdisplin2.m
%
%   u" = p·u' + q·u - r
%   u' = y
%   y' = py + qu - r

function u = funcdisplin2(nodo, x)

u1 = x(2);
u2 = feval(@p, nodo) * x(2) + feval(@q, nodo) * x(1);
u = [u1, u2]';