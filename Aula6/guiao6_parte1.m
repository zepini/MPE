%% Repetição do guião 6 - José Domingues 76328
clear all, clc, close all;

%% 1) 
n = 100;
N = 5;


p = 0.1;
Xn1 = rand(N,n) < p;
Xn0 = Xn1 == 0;

stem(Xn1(1,:)')

%% 2
Yn = cumsum(Xn1')

hold on 
plot(Yn);
hold off

%% 3
clear all, clc, close all;

N = 100;
n = 200;
p = 1/2;

Xn = rand(N,n) < p;

Sn = cumsum(Xn,2);

%a)
%Média esperada
media = (n*p);
%variancia esperada
variancia = n*p*(1-p);

%fdp
fdp = 1/sqrt(2*pi*variancia) * exp(-((76:125) - media).^2/(2 * variancia));

%gerar hists com 10 bins de Xn nos intervalos desejados
S50 = hist(Sn(:,50),10); % Xn, n = [1,50]
S100 = hist(Sn(:,100)-Sn(:,50),10); % Xn, n = [51,100]
S150 = hist(Sn(:,150)-Sn(:,100),10);
S200 = hist(Sn(:,200)-Sn(:,150),10);

xS = 0:50/10:50-50/10
xS = linspace(0,50,10)

% Factor = sum(S50 + S100 + S150 + S200);

array = [S50; S100; S150 ;S200];

subplot(221)
bar(xS, S50)
hold on
plot(fdp)

subplot(222)
bar(xS, S100)
hold on
plot(fdp)

subplot(223)
bar(xS, S150)
hold on
plot(fdp)

subplot(224)
bar(xS, S200);
hold on
plot(fdp)



%% 4
clear all, clc, close
t = 0:0.001:100-0.001;

%taxa media de chegadas por segundo
lambda = 1;
%nota ---> np=lambda*t
































