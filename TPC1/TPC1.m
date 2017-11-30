%% TPC 1 - José Domingues
clear, close all, clc;

%% Exercicio 1
N = 1e6;
x = 4*rand(1,N)-2;
y = 4*rand(1,N)-2;
figure(1)
plot(x,y,'.');
axis([-2 2 -2 2])

title('Espaço amostral');
 
a = 2;
b = 1;


hold on
condE = ((x/a).^2+(y/b).^2 <= 1);
plot(x(condE),y(condE),'r.');
axis([-2 2 -2 2])
pE = sum(condE)/N


condC = (x.^2 + y.^2 <= sqrt(2));
plot(x(condC),y(condC),'y.');
axis([-2 2 -2 2])
pC = sum(condC)/N
hold off

figure(4)
pCC = cumsum(condC)./(1:N);
plot(1:N,pCC);

figure(5)
pEE = cumsum(condE)./(1:N);
plot(1:N,pEE);

AreaC = pi*sqrt(2);

AreaE = pi*a*b;

Total = (2-(-2))*(2-(-2));

pCanalitica = AreaC/Total
pEanalitica = AreaE/Total


%% alinea e
C_E = (x(condE).^2+y(condE).^2 <= sqrt(2)); %condicao C sabendo que aconteceu E aconteceu

pC_E = sum(C_E)/sum(condE); %probabilidade de C sabendo que E aconteceu

pCE = sum(condC & condE) / N; %probabilidade de C&E

pC_E_esperada = pCE/pE;





