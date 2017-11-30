%% Guiao 2 - Repetido - José Domingues n76328
clear all, close all, clc;
%% Parte I
% 1 - Representação do espaço amostral S

n = 10^5;

x = rand(1,n);
y = rand(1,n);

plot(x,y,'.');

% 2 - Representação do acontecimento M
M = abs(y-x) < 0.25;
hold on;
plot(x(M),y(M),'.y');
hold off;

% 3 - Probabilidade de M 

probM = sum(M)/length(M);

% 4 - Probabilidade de M com o numero de pontos usados na estimativa

probMcumSum = cumsum(M)./(1:n);

plot(1:n,probMcumSum);


%% Parte II 
clear all, clc, close all;

n = 10^7;

x = 4*rand(1,n)-2;
y = 4*rand(1,n)-2;
plot(x,y,'.');

hold on;
r = 2;
M = (x.^2 + y.^2 < r^2);
plot(x(M),y(M),'.y');
hold off;

% 3 - probabilidade de M

probM = sum(M)./length(M);

% 4 - estimativa de pi

%uma vez que -> (pi*r^2)/areaT = p(M)  <-> pi = (p(M)*areaT)/r^2
areaT = (2-(-2))*(2-(-2));
piExp = probM.*areaT/r^2;


%mostrar a dependencia da estimativa com o numero de pontos

probMcumsum = cumsum(M)./(1:n);
piExp = probMcumsum.*areaT/r^2;
plot(1:n,piExp)





%% Parte III

%1

n = 4;
soma = 0;
somaAux = 0;

N = 1000;

for i = 1:N
    x = ceil(6*rand(1,n));

    cond6em4 = (x == 6);
    if (sum(cond6em4 > 0))
        soma = soma+(sum(cond6em4>0)/sum(cond6em4>0))
    end
    somaAux = somaAux+1;
end
prob6 = soma/somaAux;

%agora pelo menos dois 6 em 24 lançamentos

n = 24;
soma = 0;
somaAux = 0;

N = 1000;

for i = 1:N
    x = ceil(6*rand(1,n));
    y = ceil(6*rand(1,n));
    cond66em24 = ((x == 6) & (y==6));
    if (sum(cond66em24 > 0))
        soma = soma+(sum(cond66em24>0)/sum(cond66em24>0))
    end
    somaAux = somaAux+1;
end
prob66em24 = soma/somaAux;

%% PARTE IV
clear all, clc, close all;

L = 10000;
[A,B,C,D] = NUMEROS(L);

pB = length(B)/length(A)
pC = length(C)/length(A)
pD = length(D)/length(A)

% p(B|C) = p(BC)*p(C)









































