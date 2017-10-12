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

figure(2)
condC = (x.^2 + y.^2 <= sqrt(sqrt(2)));
plot(x(condC),y(condC),'y.');
axis([-2 2 -2 2])
pC = sum(condC)/N


figure(3)
condE = ((x/2).^2+y.^2 <= 1);
plot(x(condE),y(condE),'r.');
axis([-2 2 -2 2])
pE = sum(condE)/N

 = cumsum(condM)./(1:N);
plot(1:N,PM);
