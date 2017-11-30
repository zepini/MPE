%% Parte I
clear all, close all, clc;
N = 512;
load trab03.mat; % ´e criada a vari´avel y
figure(1);
imagesc(reshape(y,N,N));
colormap(gray);
colorbar

% 1 Quantos valores diferentes tem a variavel y?
nValoresUnicos_y = length(unique(y));

% a) Histograma de y
unique_y = unique(y);
figure(2)
hist(y,unique_y)

%ou entao faziamos 
hist(y,length(unique(y))) %porque faz o histograma de y com length(y) divisoes

%b - De quantos bits necessita para representar os dados contidos em y?

nBitsNecessarios = log2(length(unique(y)));

% Exercicio 2 

%a)

%retirar componente DC a y
yDC = mean(y);
yAC = y - yDC;

%adicionar ruido gaussiano com media nula e desvio padrao sigma

sigma = std(y);
wnoise = 0+sigma*randn(length(y),1); %desvio padrao multiplica-se, a media adiciona-se
%figure(3);hist(wnoise,length(wnoise));

y_ruido = yAC + wnoise;

y_recuperado = round(y_ruido);

figure(4);
imagesc(reshape(y_recuperado,N,N));
colormap(gray);
colorbar

%b) correr 5 vezes o programa para SNR entre 100 e 1 -> 20dB e 0dB

SNR_target = [100 75 50 25 10 5 2.5 1 0.5 0];
figure;
for i=1:length(SNR_target)
    
   sigmaNoise = sqrt(var(yAC)/SNR_target(i));
   
   wnoise = 0+sigmaNoise*randn(length(yAC),1);
   
   y_ruido = yAC + wnoise;
   
   y_recuperado = round(y_ruido);
   
   
   subplot(length(SNR_target)/2, 2, i);
   imagesc(reshape(y_recuperado,N,N)); 
   colormap(gray); 
   colorbar 
   title(['SNR\_target ',num2str(SNR_target(i))])
end



%2
%conversao para binario
y_bin = de2bi(y,8,'left-msb');
%conversao de unipolar para bipolar 
y_bin_polar = 2*y_bin-1;

%ruido gaussiano
% sigmaNoise = sqrt(var(y_bin_polar)/SNR_target(1));
% wnoise = 0+sigmaNoise*randn(length(y_bin_polar),1);
wnoise = wgnoise(y_bin_polar,SNR_target(1));


%soma de y com o ruido

y_ruido = y_bin_polar + wnoise;

%filtragem no recetor -> aqui faz sentido apanhar os >0 porque ou é
%positivo ou negativo, neste caso um round nao fazia puto de sentido. Assim
%fica já convertido em unipolar outra vez
y_recuperado = y_ruido > 0;

y_dec_rx = y_recuperado * [128 64 32 16 8 4 2 1]';

figure;
imagesc(reshape(y_dec_rx, N, N))
colormap(gray);
colorbar

% 4

ydif = diff([0;y]);
hist(ydif,length(ydif))




















