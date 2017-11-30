%% Aula 2 - MPE - José Domingues
clear, clc, close all;

%% parte 1

%% exercicio 3-probabilidade de M;
N = 10^4; %numero de experiencias a realizar.

x = rand(1,N);%possibilidades do primeiro
y = rand(1,N);%possibilidades do segundo

plot(x,y,'.');

M = abs(x-y) < 0.25;
hold on;
plot(x(M),y(M),'y.');
hold off;

probM = sum(M)/N;

%% exercicio 4- TENTA USAR O COMANDO CUMSUM(X);
N = 10^4;
x=rand(1,N);
y=rand(1,N);
condM = abs(x-y)<0.25;
pM100 = sum(condM(1:100))/100;
pM5000 = sum(condM(1:500))/500;

PM = cumsum(condM)/(1:N);
plot(1:N,PM);