%% Repetição aula 1 - José Domingues n76328

%% Parte I
n = 1000; % nº de lançamentos
X = ceil(6*rand(1,n));
minX = min(X);
maxX = max(X);
e = [minX:maxX+1]-0.5;
H = histc(X,e);
nBins = length(e)-1;
binCenters = [minX:maxX];
bar(binCenters, H(1:nBins))

%1 - Execute o programa e interprete os resultados. Cada face do dado saiu quantas vezes? Esperava 
% esses resultados? Porquê?

% 2 - Execute o programa para n = 1000, n = 10000 e n = 100000. Comente os resultados.

for i=3:8
    n = 10^i; % nº de lançamentos
    X = ceil(6*rand(1,n));
    minX = min(X);
    maxX = max(X);
    e = [minX:maxX+1]-0.5;
    H = histc(X,e);
    nBins = length(e)-1;
    binCenters = [minX:maxX];
    figure;
    bar(binCenters, H(1:nBins))
end

% 3 - Modifique o programa para simular o resultado da soma obtida com o lanc¸amento de dois dados.
% Execute o programa e comente os resultados.

for i=3:8
    n = 10^i; % nº de lançamentos
    X = ceil(6*rand(1,n));
    Y = ceil(6*rand(1,n));
    Soma = X+Y;
    minSoma = min(Soma);
    maxSoma = max(Soma);
    e = [minSoma:maxSoma+1]-0.5;
    H = histc(Soma,e);
    nBins = length(e)-1;
    binCenters = [minSoma:maxSoma];
    figure;
    bar(binCenters, H(1:nBins))
end


%% Parte II - Escreva um programa que simule 100 lanc¸amentos consecutivos de uma moeda. Denote por x o numero de caras obtidas.
clear, clc, close all
n = 100; %nº de lançamentos
N = 1000000; %nº de simulaçoes

%1 - Exectue o programa para N = 1000 veze. Qual a gama de valores para x?

for i = 1:N
    moeda = round(rand(1,n)); %n lançamentos duma moeda
    x = (moeda == 1);
    soma(i) = sum(x);
end
maxSoma = max(soma);
minSoma = min(soma);
gamaValroes = maxSoma-minSoma;

fprintf('A gama de valroes vai de %d a %d',minSoma,maxSoma);

%2 Faca um histograma do numero de caras sa?das. Varie a largura das barras do histograma entre 1 e 5 e observe o resultado.

for j=1:5
    for i = 1:N
    moeda = round(rand(1,n)); %n lançamentos duma moeda
    x = (moeda == 1);
    soma(i) = sum(x);
    end
    maxSoma = max(soma);
    minSoma = min(soma);
    gamaValores = maxSoma-minSoma;

    fprintf('A gama de valroes vai de %d a %d',minSoma,maxSoma);


    LB = j;
    NBarras = (maxSoma-minSoma)/LB;
    maxAux = maxSoma;
    
%     if(mod(maxSoma-minSoma,LB)) ~=0
%         nBars=(maxSoma-minSoma)/LB;
%         maxAux=minSoma + nBars*LB;
%     end
    
    meanValue = mean(soma);
    variancia = var(soma);
    desvioPadrao = std(soma);
    
    e = [minSoma:LB:maxAux+LB]-0.5*LB;
    H = histc(soma,e);
    nBins=length(e)-1;
    binCenters = [minSoma:LB:maxAux];
    figure;
    bar(binCenters,H(1:nBins));
    hold on
    xx = minSoma : 0.1 : maxSoma;
    K = LB * N;
    f = K*(1/sqrt(2*pi*variancia))*exp(-0.5*((xx-meanValue)./desvioPadrao).^2);
    plot(xx,f,'r');
    hold off;
end




% 3 - Calcule o valor medio, m, de x.

meanValue = mean(soma);

% 4 - Calcule a variancia, sigma^2, e o desvio padrao, sigma, de x.


variancia = var(soma);
desvioPadrao = std(soma);


% feita no for da pergunta 2






















