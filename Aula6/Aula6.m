%% José Domingue n76328

clear all, clc, close all;

%% Parte 1

%1
N = 10;
p = 0.1;
n = 100;
Xn = rand(N,n) < p;
stem(Xn');

E_Xn_esperado = p;
VAR_Xn = p*(1-p);
% 2
N = 5;  

% Alocar a matriz
Yn = zeros(N, n);


Yn = cumsum(Xn, 2);
hold on
plot(1:100,Yn)

E_Yn_esperado = n*E_Xn_esperado
VAR_Yn_esperado = n*VAR_Xn

media_mais_variancia = E_Yn_esperado+sqrt(VAR_Yn_esperado);
media_menos_variancia = E_Yn_esperado-sqrt(VAR_Yn_esperado);


x = 1:100;
y_mais = media_mais_variancia*x/100;
y_menos = media_menos_variancia*x/100;

plot(x,y_mais);
plot(x,y_menos);



%% 3

clear all, close all, clc;

p = 1/2;
n = 200;
N = 100;


Xn = rand(N,n)<p;
Sn = cumsum(Xn,2)

E = 50*p;
VAR = 50*p*(1-p);

Sn_50 = Sn(:,50);
Sn_100 = Sn(:,100);
Sn_150 = Sn(:,150);
Sn_200 = Sn(:,200);

array = [Sn_50 Sn_100 Sn_150 Sn_200];

for i = 1:4
    subplot(2,2,i)
    hist(array(i));
end




















