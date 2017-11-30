%% Guiao 2 - José Domingues 76328
%% PARTE I
clear all, close all, clc;
tic
n = 10^6;
x = rand(1,n);
y = rand(1,n);

condM = abs(y-x)<0.25;
pM = sum(condM)/length(condM);
pMcumSum = cumsum(condM)/(1:n);
plot(1:n,pMcumSum);
toc

%% PARTE II
clear, clc, close all;
%1
n = 1000000;
x = 4*rand(1,n)-2;
y = 4*rand(1,n)-2;

plot(x,y,'.');
% 2 
r = 2;
condM = (x.^2 + y.^2 < r^2);
hold on
plot(x(condM),y(condM),'.');
hold off


%3
probM = sum(condM)/length(condM);

%4 
%se (pi*r^2)/areaT = pM <-> pi = (pM*areaT)/(2*r^2)
areaT = (2*(-2))*(2*(-2));
piExp = (probM*areaT)/(r^2);

%4 plus - mostrar pi de acordo com o numero de repetições.

piCumSum = (cumsum(condM).*areaT./4)./(1:n);

figure;
plot(1:n,piCumSum);


%% PARTE IV
clear all, close all, clc;


%experiencia A
n = 4;
N = 1000;
soma = 0;


for i = 1:N
    dado = ceil(6*rand(1,n));
    condM(i) = sum(sum(dado == 6) > 0);
end

p6em4 = sum(condM)/length(condM)

%experiencia B
n = 24;
for i = 1:N
    dado1 = ceil(6*rand(1,n));
    dado2 = ceil(6*rand(1,n));
    
    cond66em24(i) = sum(sum(dado1 == 6 & dado2 == 6)>0);
    
end
p66em24 = sum(cond66em24)/length(cond66em24)


%% PARTE IV
clear, clc, close all;
L = 999999;
[A,B,C,D] = NUMEROS(L);
%1
pB = length(B)/length(A);
pC = length(C)/length(A);
pD = length(D)/length(A);
    
pB_C = sum(rem(C,2) == 0)/length(C);
pB_D = sum(rem(D,2) == 0)/length(D);
  
pBC = pB_C * pC
pBD = pB_D * pD


    
    
    
    
    
    
    
    
    
    
    
    
    
