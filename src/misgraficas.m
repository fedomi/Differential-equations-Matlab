%   Pr�ctica 4, apartado 5
%
%   Pinta las gr�ficas de las soluciones aproximadas de una EDIF y si es
%   multidimensional, tambi�n las gr�ficas individuales de cada componente
%
%   Datos:
%       t -> Vector COLUMNA de nodos t<SUB>i
%       u -> Matriz de resultados num�ricos; seg�n sea su dimensi�n pinta
%       de una forma u otra. Cada fila corresponde a un nodo t<SUB>i 
%
%   Devuelve:
%       Las gr�ficas antes mencionadas.
%
%   Observaci�n: Para problemas multidimensionales, hay una pausa de unos 3
%                segundos entre la aparici�n de las gr�ficas individuales y
%                la gr�fica de la trayectoria.



% PRUEBAS ______________________________________________________________
    % Unidimensional
    %    t = [0:0.01:1];
    %    u = sin(t) + cos(t * pi).^2;
    % Bidimiensional
    %    t = [0:0.01:1];
    %    u = [sin(t); t.*exp(-t)];
    % Tridimensional
    %    t = [0:0.01:1];
    %    u = [cos(t * pi); sin(t * pi * pi); (t + sin(t) - cos(t)).^2];
% ����������������������������������������������������������������������



if (size(u, 2) == 1)
    %ES UNA FUNCI�N UNIDIMENSIONAL -> gr�fica solucion aproximada
    plot(t, u, 'r');
else
    if (size(u, 2) == 2)
        % FUNCI�N BIDIMENSIONAL -> gr�fica compenentes & gr�fica de la trayectoria
        figure(1);
        title('GRAFICAS DE LAS COMPONENTES');
        subplot(2,1,1);
        plot(t, u(:,1), 'r');
        legend('Primera componente frente a los nodos');
        % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
        subplot(2,1,2);
        plot(t, u(:,2), 'g');
        legend('Segunda componente frente a los nodos');
        % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
                % Pausa la aparici�n de la �ltima ventana 3 segundos
                pause(3);
        % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
        figure(2);
        title('GRAFICA DE LA TRAYECTORIA');
        plot(u(:,1), u(:,2), 'r');
    else
        if (size(u, 2) == 3)
            % FUNCI�N TRIDIMENSIONAL -> gr�fica compenentes & gr�fica de la trayectoria
            figure(1);
            subplot(3,1,1);
            plot(t, u(:,1), 'r');
            legend('Primera componente frente a los nodos');
            title('GRAFICAS DE LAS COMPONENTES');
            % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
            subplot(3,1,2);
            plot(t, u(:,2), 'g');
            legend('Segunda componente frente a los nodos');
            % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
            subplot(3,1,3);
            plot(t, u(:,3), 'b');
            legend('Tercera componente frente a los nodos');
            % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
                % Pausa la aparici�n de la �ltima ventana 3 segundos
                pause(3);
            % _�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_�_
            figure(2);
            plot3(u(:,1), u(:,2), u(:,3), 'r');
            title('GRAFICA DE LA TRAYECTORIA');
        end
    end
end


% � 2006, por Roberto Marines.