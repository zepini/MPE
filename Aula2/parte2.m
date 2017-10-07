%% parte 2 - José Domingues
close, clc, clear;

% exercicio 1

N = 10^8;
b = 2;
a = -2;
x = rand(1,N)*(b-a)-2;
y = rand(1,N)*4-2;

plot(x,y,'.');
hold on;
M = (y.^2+x.^2<4);
plot(x(M),y(M),'y.');
hold off;

pM = sum(M)/N;

% exercicio 2

piExp = (sum(M)/N)*((b-a)^2/4);