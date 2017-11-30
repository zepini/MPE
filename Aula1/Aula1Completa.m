%% Guião 1 MPE - José Domingues - n76328
clear, close all, clc;
%% PARTE I

n = 100; 
X = ceil(6*rand(1,n));
minX = min(X);
maxX = max(X);
e = [minX:maxX+1]-0.5;
H = histc(X,e);
nBins = length(e)-1;
binCenters = [minX:maxX];
bar(binCenters, H(1:nBins))

%1 
%Os resultados esperados era cada um dos acontecimentos ter ocorrido
%aproximadamente 1/6 das vezes mas visto que o numero de lançamentos foi
%relativamente baixo é normal que nao coincida

%2 n = 1000, n = 10000, n =100000
for i = 3:6
    n = 10^(i);
    X = ceil(6*rand(1,n));
    minX = min(X);
    maxX = max(X);
    e = [minX:maxX+1]-0.5;
    H = histc(X,e);
    nBins = length(e)-1;
    binCenters = [minX:maxX];
    subplot(4,1,i-2)
    bar(binCenters, H(1:nBins))
end


% Soma de dois dados
figure;
for i = 3:6
    n = 10^(i);
    X = ceil(6*rand(1,n));
    Y = ceil(6*rand(1,n));
    Z = X+Y;
    minZ = min(Z);
    maxZ = max(Z);
    e = [minZ:maxZ+1]-0.5;
    H = histc(Z,e);
    nBins = length(e)-1;
    binCenters = [minZ:maxZ];
    subplot(4,1,i-2)
    bar(binCenters, H(1:nBins))
end


%% PARTE II
clear, clc, close all;
%100 lançamentos de uma moeda

%1 -  N = 1000

n = 100;
N = 100000;

for i = 1:N
    moeda = round(rand(1,n));
    %x é o numero de caras obtidas em 100 lançamentos
    %arbitrei que sair moeda é = 1
    x(i) = sum(moeda == 1);
end

m = mean(x);
variancia = var(x);
sigma = std(x);

for i = 1:10
    
    LB = i
    minX = min(x);
    maxX = max(x)
    maxX = maxX;
    xx = minX : 0.1 : maxX;
    e = [minX:LB:maxX+LB]-0.5*LB;
    H = histc(x,e);
    nBins = length(e)-1;
    binCenters = [minX:LB:maxX];
    figure;
    bar(binCenters, H(1:nBins))
    hold on
    k = N*LB;
    y = k*(1/sqrt(2*pi*variancia))*exp(-0.5*((xx-m)./sigma).^2);
%      y = k*(1/sqrt(2*pi*variancia))*exp(-0.5*((xx-m)./sigma).^2);
    
    plot(xx,y,'r')
    hold off
end

















