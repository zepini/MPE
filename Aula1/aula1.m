%% parte 2 - fora de aulas
clear, clc, close all;
%vai lançar 100 vezes uma moeda, seja 0-coroa e 1-cara
soma = [];
N = 100000;
for j=1:5
    for i=1:N
        n = 100;
        x = round(rand(1,n)); %dá 1 valor entre 0 e 1 repetido 100 vezes
        somaAux = sum(x);
        soma = [soma, somaAux];
    end

    
    minX = min(soma);
    maxX = max(soma);
    
    
    LB = j;
    NBarras = (maxX-minX)/LB;
    
    maxAux = maxX;

    if mod(maxX - minX , LB) ~= 0
        nBars = (maxX - minX) / LB;
        maxAux = minX + nBars * LB;
    end
    
    fprintf('A gama de x varia entre %d e %d\n',minX, maxX); 

    %até aqui tenho um vetor com 1000 resultados, agora tenho de fazer um
    %histograma com os valores repetidos
    
    e = [minX:LB:maxAux+LB]-0.5*LB;
    H = histc(soma,e);
    nBins = length(e)-1;
    binCenters = [minX:LB:maxAux];
   % if length(binCenters) == length(H)
    %    binCenters(end) = [];
    %end 
    figure;
    bar(binCenters, H(1:nBins))
    
    m = mean(soma);
    variancia = var(soma);
    desvioPadrao = std(soma);
    
    xx = minX : 0.1 : maxX;
    K = LB * LB * N;
    f = K*(1/sqrt(2*pi*variancia))*exp(-0.5*((xx-m)./desvioPadrao).^2);
    
    hold on
    plot(xx,f,'r');
    title(['Largura de barras: ' num2str(j)])
    xlabel('Gama de valores')
end

%% repete exercicio 1 para um dado que é viciado
%% P [D = 1] = 0.5
%% P2 = P3 = P4 = P5 = P6 = 1/10
clear, clc, close all;

n = 10000000; % n´umero de lanc¸amentos
X = ceil(10*rand(1,n));

for i=1:length(X);
    if X(i) <= 5
        X(i) = 1;
    else
        X(i) = X(i)-4;
    end 
end
    
    
minX = min(X);
maxX = max(X);
e = [minX:maxX+1]-0.5;
H = histc(X,e);
nBins = length(e)-1;
binCenters = [minX:maxX];
bar(binCenters, H(1:nBins))


%%  Resolução do professor
N = 10;
x = rand(1,N);
dado = zeros(1,N);
dado(x < 0.5) = 1;
dado((x>=0.5) & (x<0.6)) = 2;
dado((x>=0.6) & (x<0.7)) = 3;
dado((x>=0.7) & (x<0.8)) = 4;
dado((x>=0.8) & (x<0.9)) = 5;
dado((x>=0.9) & (x<1)) = 6;














