%% TPC 1 - José Domingues
clear, close all, clc;

%% Exercicio 1
N = 1e5;
x = 4*rand(1,N)-2;
y = 4*rand(1,N)-2;
figure(1)
plot(x,y,'.');
axis([-2 2 -2 2])

title('Espaço amostral');

a = 2;
b = 1;

figure(2)
condC = (x.^2 + y.^2 <= sqrt(sqrt(2)));
plot(x(condC),y(condC),'y.');
axis([-2 2 -2 2])
pC = sum(condC)/N

figure(3)
condE = ((x/a).^2+(y/b).^2 <= 1);
plot(x(condE),y(condE),'r.');
axis([-2 2 -2 2])
pE = sum(condE)/N

figure(4)
pCC = cumsum(condC)./(1:N);
plot(1:N,pCC);

figure(5)
pEE = cumsum(condE)./(1:N);
plot(1:N,pEE);

AreaC = pi*sqrt(sqrt(2));

AreaE = pi*a*b;

Total = (2-(-2))*(2-(-2));

pCanalitica = AreaC/Total
pEanalitica = AreaE/Total










