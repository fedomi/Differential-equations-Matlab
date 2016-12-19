%   midisplin.m
%
%   Implementa el método de disparo utilizando el método de Runge-Kutta
%   clásico para resolver los problemas de valor inicial asociados.
%
%   Resuelve -u"(t) + p(t)·u'(t) + q(t)·u(t) = r(t) con las codiciones de
%   contorno fijadas.
%
%   Datos de entrada:
%       Intervalo -> Vector [T0, TF] que representa el intervalo donde
%                    resolveremos
%       N -> Número de intervalos con que resolveremos usando los métodos
%            de Runge-Kutta asociados.
%       CondicionEnT0 -> Valor para la condición de contorno en T0
%       CondicionEnTF -> Valor para la condición contorno en TF
%       TipoCondicionEnT0 -> Cero significa que la primera condición de
%                            contorno es de la forma u(T0) = a; en caso
%                            contrario, es de la forma u'(T0) = a.
%       TipoCondicionEnTF -> Cero significa que la primera condición de
%                            contorno es de la forma u(TF) = a; en caso
%                            contrario, es de la forma u'(TF) = a.
%
%   Datos de salida:
%       t -> Vector de nodos
%       u -> Vector de valores de la solución estimada en cada nodo
%       valido -> 0 = El problema de contorno tiene solución única
%                 1 = El problema de contorno no tiene solución o no es única
%                 2 = El problema de contorno tiene múltuples soluciones y
%                 devolvemos una.
%
%   Utiliza:
%       mirk4.m -> Implementa el método de Runge-Kutta de orden 4.
%       funcdisplin1.m -> Devuelve el valor de u" = pu' + qu + r
%       funcdisplin2.m -> Devuelve el valor de u" = pu' + qu

function [t, u, valido] = midisplin(intervalo, N, CondicionEnT0, CondicionEnTF, TipoCondicionEnT0, TipoCondicionEnTF)

valido = 0;

% if ((CondicionEnT0 == 0) && (CondicionEnTF == 0))
%     % Primer PVI
%     f = @funcdisplin2;
%     x0 = [0, 1];
%     [t, y2] = mirk4(f, x0, intervalo, N);
%     % 
%     if (y2(N, 1) == 0)
%         valido = 1;
%     else
%         % Segundo PVI
%         f = @funcdisplin1;
%         x0 = [CondicionEnT0, 0];
%         [t, y1] = mirk4(f, x0, intervalo, N);
%         %
%         s = (CondicionEnTF - y1(N, 1)) / y2(N, 1);
%     end
% elseif ((CondicionEnT0 == 0) && (CondicionEnTF == 1))
%     % Primer PVI
%     f = @funcdisplin2;
%     x0 = [0, 1];
%     [t, y2] = mirk4(f, x0, intervalo, N);
%     % 
%     if (y2(N, 2) == 0)
%         valido = 1;
%     else
%         % Segundo PVI
%         f = @funcdisplin1;
%         x0 = [CondicionEnT0, 0];
%         [t, y1] = mirk4(f, x0, intervalo, N);
%         %
%         s = (CondicionEnTF - y1(N, 2)) / y2(N, 2);
%     end
% elseif (CondicionEnTF == 0)
%     % Primer PVI
%     f = @funcdisplin2;
%     x0 = [1, 0];
%     [t, y2] = mirk4(f, x0, intervalo, N);
%     % 
%     if (y2(N, 1) == 0)
%         valido = 1;
%     else
%         % Segundo PVI
%         f = @funcdisplin1;
%         x0 = [0, CondicionEnT0];
%         [t, y1] = mirk4(f, x0, intervalo, N);
%         %
%         s = (CondicionEnTF - y1(N, 1)) / y2(N, 1);
%     end
% else
%     % Primer PVI
%     f = @funcdisplin2;
%     x0 = [1, 0];
%     [t, y2] = mirk4(f, x0, intervalo, N);
%     % 
%     if (y2(N, 2) == 0)
%         valido = 1;
%     else
%         % Segundo PVI
%         f = @funcdisplin1;
%         x0 = [0, CondicionEnT0];
%         [t, y1] = mirk4(f, x0, intervalo, N);
%         %
%         s = (CondicionEnTF - y1(N, 2)) / y2(N, 2);
%     end
% end
% 
% if (valido == 0)
%     u = y1 + s * y2;
% else
%     % si el homogéneo da una sol válida la devolvemos y valido = 2
% end


% =========================================================================
% =========================================================================
% =========================================================================


if (TipoCondicionEnT0 == 0)
    x0_1 = [CondicionEnT0, 0];
    x0_2 = [0, 1];
else
    x0_1 = [0, CondicionEnT0];
    x0_2 = [1, 0];
end

% Sistema cuasi-homogéneo
    f_1 = @funcdisplin2;
    [t, y1] = mirk4(f_1, x0_2, intervalo, N);
    %y1
    
% Miramos existencia y/o unicidad
if (TipoCondicionEnTF == 0)
    if (y1(N + 1, 1) == 0)
        valido = 1;
    else
        valido = 0;
    end
    %y1
else
    if (y1(N + 1, 2) == 0)
        valido = 1;
    else
        valido = 0;
    end
end
    
% Si hay existencia y unicidad continuamos; si no miramos si hemos tenido
% suerte con el PVI cuasi-homogéneno
if (valido == 0)
    f_2 = @funcdisplin1;
    [t, y2] = mirk4(f_2, x0_1, intervalo, N);
    
    if (TipoCondicionEnTF == 0)
        s = (CondicionEnTF - y2(N + 1, 1)) / y1(N + 1, 1);          
    else
        s = (CondicionEnTF - y2(N + 1, 2)) / y1(N + 1, 2);
    end
    
    %u = y1 + s * y2;
    u = y2 + s * y1; % ESTA ES LA SOLUCION DEL PROBLEMA
else
    if (TipoCondicionEnTF == 0)
        if (y1(N + 1, 1) == CondicionEnTF)
            valido = 2;
            u = y1;
        end
    else
        if (y1(N + 1, 2) == CondicionEnTF)
            valido = 2;
            u = y1;
        end
    end
end

if (valido == 1)
    u = 0;
    % Hay que asignar algo o da error.
end


% hold on;
% figure(1);
% plot(t, y1(:,1), 'c');
% plot(t, y1(:,2), 'b');
% figure(2);
% if (valido == 0)
%     plot(t, y2(:,1), 'g*');    
%     plot(t, y2(:,2), 'r');    
% end
% hold off;
% figure(3);