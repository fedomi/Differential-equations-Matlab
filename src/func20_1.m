%%%%    Función de la ecuación diferencial de la práctica 20 [a]
%%%%
%%%%    DATOS:
%%%%    x1, x2 - datos para generar y
%%%%        
%%%%
%%%%    RESULTADOS
%%%%    Variable y que almacena el valor de x^2 
%%%%    {solución de la EDIF (si x(0)=1) x' = x^2:    1 / (1 - t))}
%%%%
%%%%    OBSERVACIÓN: x'(t) = x(t)^2
%%%%        y     = x'
%%%%        x2    = x(t)
%%%%        x1    = t

function y = func20_1(x1, x2)
y = x2*x2;