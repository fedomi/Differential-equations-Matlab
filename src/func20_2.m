%%%%    Funci�n de la ecuaci�n diferencial de la pr�ctica 20 [b]
%%%%
%%%%    DATOS:
%%%%    x1, x2 - datos para generar y
%%%%        
%%%%
%%%%    RESULTADOS
%%%%    Variable y que almacena el valor de exp(x2)/10 + cos(x2-x1)
%%%%
%%%%    OBSERVACI�N:
%%%%        y     = x'
%%%%        x2    = x(t)
%%%%        x1    = t

function y = func20_2(x1, x2)
y = (exp(x2)) / 10 + cos(x2 - x1);