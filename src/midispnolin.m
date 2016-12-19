%   midispnolin.m
%
%   Implementa el método de disparo para problemas no lineales.
%       u" = f(x, u, u')
%       u(T0) = a     <ó>     u'(T0) = a
%       u(TF) = b     <ó>     u'(TF) = b
%
%   Datos de entrada:
%       f -> @función de la EDIF: u" = f(x, u, u')
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
%       TOL -> Tolerancia para el error numerico del metodo.
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

function [t, u, valido] = midispnolin(f, intervalo, N, CondicionT0, CondicionTF, TipoCondicionT0, TipoCondicionTF, TOL)

valido = 0;
Salir = 0;
NumeroVueltas = 0;
MaxVueltas = 10;

% Para simplificar un poco el codigo y corregir un pequeño error.
M = N + 1;

if (TipoCondicionT0 == 0) 
    if (TipoCondicionTF == 0)
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u(T0)=a, u(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        %
        CIni0 = [CondicionT0, s0];
        [trk, urk0] = mirk4(f, CIni0, intervalo, N);
        %
        s1 = s0 + (CondicionTF - urk0(M, 1)) / (intervalo(2) - intervalo(1));
        %
        while (Salir == 0)
            CIni1 = [CondicionT0, s1];
            [trk, urk1] = mirk4(f, CIni1, intervalo, N);
            %
            if (abs(urk1(M, 1) - CondicionTF) <= TOL) 
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(M, 1) - CondicionTF) * (s1 - s0) / (urk1(M, 1) - urk0(M, 1)) );
                s0 = aux;
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
            plot(t, u);
        end
    else
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u(T0)=a, u'(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        %
        CIni0 = [CondicionT0, s0];
        [trk, urk0] = mirk4(f, CIni0, intervalo, N);
        %
        s1 = s0 + (CondicionT0 - urk0(M, 1)) / (intervalo(2) - intervalo(1));
        %
        while (Salir == 0)
            CIni1 = [CondicionT0, s1];
            [trk, urk1] = mirk4(f, CIni1, intervalo, N);
            %
            if (abs(urk1(M, 2) - CondicionTF) <= TOL)
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(M, 2) - CondicionTF) * (s1 - s0) / (urk1(M, 2) - urk0(M, 2)) );
                s0 = aux;
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
        end
    end
else
    if (TipoCondicionTF == 0)
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u'(T0)=a, u(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        %
        CIni0 = [s0, CondicionT0];
        [trk, urk0] = mirk4(f, CIni0, intervalo, N);
        %
        s1 = s0 + (CondicionT0 - urk0(M, 1)) / (intervalo(2) - intervalo(1));
        %
        while (Salir == 0)
            CIni1 = [s1, CondicionT0];
            [trk, urk1] = mirk4(f, CIni1, intervalo, N);
            %
            if (abs(urk1(M, 1) - CondicionTF) <= TOL)
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(M, 1) - CondicionTF) * (s1 - s0) / (urk1(M, 1) - urk0(M, 1)) );
                s0 = aux;
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
        end
    else
        % ==================================
        % ==== CONDICIONES DE CONTORNO: u'(T0)=a, u'(TF)=b
        % ==================================
        s0 = (CondicionTF - CondicionT0) / (intervalo(2) - intervalo(1));
        %
        CIni0 = [s0, CondicionT0];
        [trk, urk0] = mirk4(f, CIni0, intervalo, N);
        %
        s1 = s0 + (CondicionT0 - urk0(M, 1)) / (intervalo(2) - intervalo(1));
        %
        while (Salir == 0)
            CIni1 = [s1, CondicionT0];
            [trk, urk1] = mirk4(f, CIni1, intervalo, N);
            %
            if (abs(urk1(M, 2) - CondicionTF) <= TOL)
                OK = 0;
            else
                OK = 1;
            end
            %
            if (OK == 0)
                Salir = 1;
            else
                aux = s1;
                s1 = s1 - ( (urk1(M, 2) - CondicionTF) * (s1 - s0) / (urk1(M, 2) - urk0(M, 2)) );
                s0 = aux;
                %
                urk0 = urk1;
                %
                NumeroVueltas = NumeroVueltas + 1;
                if (NumeroVueltas > MaxVueltas)
                    Salir = 2;
                end         
            end
        end
        %
        t = trk;
        u = urk1;
        if (Salir == 1)
            valido = 0;
        else
            valido = 1;
        end
    end    
end



% 2006, por Roberto Marines.