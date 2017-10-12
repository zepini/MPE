%% Aula 2 Repetição
clc, clear, close all;

%% parte 1
N = 10000;
x = rand(1,N); % 10000 numeros random entre 0 e 1
y = rand(1,N); 
plot(x,y,'.');

condM = abs(y-x) < 0.25; %devolde um vetor com 10000 valores, 0 se nao, 1 se sim

xx = x(condM) % o que isto faz é devolver um vetor com os valores que se encontram na condicao
yy = y(condM) %se fizer length disto dá o numero de 1; por isso é que se faz aquilo de um vetor de zeros
% tambem podiamos fazer uma "sum" porque o vetor é so de 1's
hold on;
plot(xx,yy,'y.');
hold off;

probM = length(xx)/N;
pM = sum(condM)/N;

pM100 = sum(condM(1:100))/100;
pM5000 = sum(condM(1:500))/500;


PM = cumsum(condM)./(1:N);
plot(1:N,PM);

%% parte 2

clear, close, clc;

N = 100000;
x = 4*rand(1,N)-2;
y = 4*rand(1,N)-2;

plot(x,y,'.');

hold on;
condC = (y.^2+x.^2 < 2^2);
plot(x(condC),y(condC),'y.'); %x(condC) é o vetor x cujos pontos correspondem à condição
hold off;

pC = sum(condC)/N;

a = -2;
b = 2;
piExp = (sum(condC)/N)*((b-a)^2/4);

%% parte 3 - dados

clear, clc, close;

p66Teorica = ((658*10^15)+(1.013*10^18)+(511*10^15)+(112*10^15)+(11.97*10^15)+(660*10^12))/6^24; %está no caderno como

N = 1000000;

A = ceil( 6 * rand(N, 4));

PA = sum(sum(A == 6, 2) > 0) / N

B1 = ceil( 6 * rand(N, 24));
B2 = ceil( 6 * rand(N, 24));

PB = sum( sum( ((B1 == 6) & (B2 == 6)), 2) > 0) / N


vetor = [PA PB];
bar(vetor)

%% parte 4
close, clc, clear;

L = 999999;

[A,B,C,D] = NUMEROS(L);

pB = length(B)/L;
pC = length(C)/L;
pD = length(D)/L;

%P(B|C)
B_C = B(rem(C,2)==0); %vetor B cujos pontos correspondem à condição
pB_C = length(B_C)/length(C);


%P(B|D)
B_D = B(rem(D,2)==0);
pB_D = length(B_D)/length(D);


%P(BC)
pBC = pB_C * pC

%P(BD)
pBD = pB_D * pD














