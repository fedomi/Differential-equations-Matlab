%   testmidiffin.m
%
%   Ejecuta midiffin.m, resolucion de problemas de contorno del tipo:
%       -u" + pu' + qu = r
%       u(T0) = a     
%       u(TF) = b     
%
%   Las funciones involucradas estan en otros archivos.
%   Condiciones de contorno en este subprograma.
%
%   Utiliza
%       p.m
%       q.m
%       r.m
%       midiffin.m


% Práctica 22.i
intervalo = [0, 1];
CondicionT0 = 0;
CondicionTF = 2;
TipoCondicionT0 = 0;
TipoCondicionTF = 0;


% Práctica 22.ii
%intervalo = [0, 5];
%CondicionT0 = -2;
%CondicionTF = 1;
%%TipoCondicionT0 = 0;
%%TipoCondicionTF = 1;


% Práctica 22.iii
%intervalo = [0, 10];
%CondicionT0 = -2;
%CondicionTF = -1;
%%TipoCondicionT0 = 1;
%%TipoCondicionTF = 0;


% Práctica 22.iv
%intervalo = [0, 1];
%CondicionT0 = -2;
%CondicionTF = -1;
%%TipoCondicionT0 = 1;
%%TipoCondicionTF = 1;


% Prueba [exponencial]
%intervalo = [0, 1];
%CondicionT0 = 1;%1;
%CondicionTF = exp(1);
%%TipoCondicionT0 = 0;
%%TipoCondicionTF = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mip = @p;
miq = @q;
mir = @r;
N = 10000;% 5000;%100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


[t, u] = midiffin(mip, miq, mir, intervalo, N, CondicionT0, CondicionTF);

plot(t, u);


%   2006, por Roberto Marines.