clear all, close all, clc;

N = 512;
load trab03.mat;
figure(1);
imagesc(reshape(y,N,N));
colormap(gray);
colorbar


%% 1 - a)
figure;
y_unique = length(unique(y));

hist(y,y_unique);

%% 1 - b)

nBits = log2(y_unique);


%% 2


y_DC = mean(y);
y_AC = y-y_DC;


SNR_target = [0 0.1 0.7 1 20 50 75 100];
for i = 1:length(SNR_target)
    subplot(4,2,i)
    Psignal = sum(abs(y_AC).^2)/length(y_AC) %potencia do sinal
    
    
    sigma = sqrt(Psignal/SNR_target(i));% sigma = sqrt((Psignal/SNR_target));
    wn = sigma*randn(512^2,1);
    yr = y_AC + wn;
    
    Pnoise = mean(wn.^2);  % que � igual � variancia

    SNR = Psignal/Pnoise; % sigma = sqrt((Psignal/SNR_target));

    y_recovered = round(yr);

    

    imagesc(reshape(yr, N, N));
    colormap(gray);
    colorbar
    title('Imagem Original');
end


%% 3




% SNR_target = [0 0.1 0.7 1 20 50 75 100];
% 
% binary_string=dec2bin(y,8);
% binary_data=rem(double(binary_string),2); % converte string em n�s
% ytx_binary=2*binary_data-1; % convers�o para polar -> fica uma matriz com 512^2 linhas e 8 colunas 
% 
% Pytx_binary = 1; %porque ou � 1 ou -1

% sigma = sqrt((Pytx_binary)/SNR_target(5));
% wn_binary = sigma*randn(512^2,8); %-> porque agora cada bit � corrompido por uma amostra de bit diferente
% 
% yrx_binary = ytx_binary + wn_binary;
% 
% yrx_binary_noNoise = sign(yrx_binary); %se for > 0 � 1, se for < 0 � -1
% yrx_matrix_noNoise = ((yrx_binary_noNoise+1)/2); %-> fica 0 e 2, e divididindo por 2 fica 0 ou 1
% 
% y_decimal_value=yrx_matrix_noNoise*[128 64 32 16 8 4 2 1]' ;
% % binary_byte vetor linha neste caso
% 
% 
%  figure
% imagesc(reshape(y_decimal_value, N, N));
% colormap(gray);
% colorbar
% title('Imagem Original');
SNR_linear = [0 0.1 0.7 1 20 50 75 100];


% Converter os valores em decimal para binario com 8 bits
y_bin = de2bi(y, 8, 'left-msb');

% Converter os valores decimais unipolares para bipolares
y_bin = 2 * y_bin - 1;

% Alternativamente
% dec2bin converte cada elemento de y num string de 0 e 1
binary_string = dec2bin(y, 8);
% Converter a string em n�s
binary_data = rem(double(binary_string), 2);
% conversao para polar
balanced_binary = 2 * binary_data - 1;

% Potencia do sinal binario a transmitir
Py_bin = sum(sum(abs(y_bin).^2)) / numel(y_bin)

% Nao � necessario remover a componente DC porque o sinal j� se encontra
% centrado em 0 
for k = 1 : length(SNR_linear)
    
    % 2. Ruido Gaussiano Branco
    noise = wgnoise(y_bin, SNR_linear(k));
    
    % Trasmissaoo por canal ruidoso
    y_tx = y_bin + noise;
    
    % 3. Filtragem no recetor (remo��o de ruido e conversao de polar para binario)
    y_bin_filter = y_tx > 0;
    
    % Conversaoo para decimal
    y_dec_rx = y_bin_filter * [128 64 32 16 8 4 2 1]';
    
    % 4. Valor de SNR
    % Esperada -> conversao da SNR linear para dB
    % Experimental -> usa a potencia do sinal e a variancia do ruido
    SNR_dB_esperada(k) = 10*log10(SNR_linear(k)); 
    Pnoise = var(noise);    % Potencia do ruido
    SNR_dB_experimental(k) = 10*log10(Py_bin / Pnoise(1));
    
    % 5. Reconstrucao da imagem
    % Imagem original
    figure(1 + length(SNR_linear) + k)
    subplot(121)
    imagesc(reshape(y, N, N));
    colormap(gray);
    colorbar
    title('Imagem Original');
    
    % Imagem com ruido
    subplot(122)
    imagesc(reshape(y_dec_rx, N, N))
    colormap(gray);
    colorbar
    title(['TX- BIN : Imagem com SNR_{linear}= ' num2str(SNR_linear(k))]);
end;

%% Exercicio 4 - Alinea a)
% Considere uma nova variavel ydiff = diff(y)
% (a) Fa�a o histograma de ydiff e compare com o histograma de y. Explique,
% qualitativamente as diferen�as


ydiff = diff([0; y]);
%ydiff = diff(y); %este s� da 512^1 -1 logo d� asneira

% Histograma 
%figure(2 * length(SNR_linear) + 2);
figure;
histogram(ydiff, unique(ydiff))
title('Histograma das diferen�as consecutivas do sinal y');
ylabel('Frequencia absoluta');
xlabel('Valores das diferen�as consecutivas');




%% ex 5
a = [1 -1];
b = 1;

yq = floor(y/2); %equivalente a y>>1

ydifq = diff(0:yq);

offset = abs(min(ydifq));
ydifq_offset = ydifq + offset;

% Converter os valores em decimal para binario com 8 bits
y_bin = de2bi(ydifq_offset, 8, 'left-msb');

% Converter os valores decimais unipolares para bipolares
y_bin = 2 * y_bin - 1;

% Alternativamente
% dec2bin converte cada elemento de y num string de 0 e 1
binary_string = dec2bin(y, 8);
% Converter a string em n�s
ydifq_bin = rem(double(binary_string), 2);
 yclean = filter(b, a, ydifq);
% Converter de ook para bpsk (binário -> polar)
ydifq_bpsk = 2 * ydifq_bin - 1;
%potencia do sinal a transmitir
Ps = sum(sum(abs(ydifq_bpsk).^2)) / numel(ydifq_bpsk);


for kk = 1 : length(SNR_linear)
        
        % Ruido Gaussiano branco para a SNR desejada
        noise = wgnoise(ydifq_bpsk, SNR_linear(kk));
        
        % Sinal a transmitir - Diferencas consecutivas do sinal decimal 
        % codificado em bpsk com ruido analogico 
        ydifq_tx = ydifq_bpsk + noise;
        
        % Recetor - remocao do ruido analagico
        ydifq_rx = round(ydifq_tx);
        
        % (e) Recetor - Conversao para binario
        ydifq_bin_rx = ydifq_rx > 0;
        
        % Conversao para decimal
        ydec_rx = ydifq_bin_rx * (2.^(7:-1:0))';
        
        % Corrigir o offset efetuado �s diferencas consecutivas
        ydec_rx = ydec_rx - offset;
        
        % Matched filter do transmissor (diferencas consecutivas)
        % Reconstrucao o sinal yq 
        ydec_rx = filter(b, a, ydec_rx);
            
        % Imagem filtrada sem ruido
        figure
        subplot(121)
        imagesc(reshape(yclean, N, N));
        colormap(gray);
        colorbar
        title(['Imagem Quantizada sem ruído. Nº bits = ' num2str(7)]);

        % Imagem filtrada com ruído
        subplot(122)
        imagesc(reshape(ydec_rx, N, N))
        colormap(gray);
        colorbar
        title(['Imagem Quantizada com ruído.Nº bits = ' num2str(7) ', SNR = ' num2str(SNR_linear(kk))]);;
        
        % Valor de SNR
        SNR_dB_esperada(kk) = 10*log10(SNR_linear(kk)); 
        Pnoise = var(noise);    % Potencia do ruido
        SNR_dB_experimental(kk) = 10*log10(Ps / Pnoise(1));

    end;














% Os valores est�o bastante concentrados em torno de 0, ao contrario do
% histograma de y, que estavam distribuidos de forma aleatoria logo ir� ser
% preciso transmitir menos informa��o

%% Exercício 5

% (f) Numero de bits a considerar na filtragem
n = 7 : -1 : 4;

% Parametros do filtro IIR
a = [1 -1];
b = 1;

for k = n
    % (a) Quantizar para k bits (remover os n bits menos significativos).
    % Dividir por 2^K equivale a fazer um shift de k bits à direita,
    % removendo k bits ao número
    yq = floor(y / 2^(8 - k));
    
    % (b) Diferenças consecutivas (é necessário concatenar um elemento no
    % início para obter o valor do 1º elemento -> condição inicial do
    % filtro das diferenças consecutivas é o elemento 0 (garantir
    % causalidade))
    ydifq = diff([0 ; yq]);
    
    % Offset ás diferenças consecutivas para codificar os valores das
    % diferenças consecutivas só com número positivos, para de seguida
    % converter para binário
    offset = abs(min(ydifq));
    ydifq_offset = ydifq + offset;
    
    ydifq_bin = de2bi(ydifq_offset, k+1, 'left-msb');
    
    % Converter de ook para bpsk (binário -> polar)
    ydifq_bpsk = 2 * ydifq_bin - 1;
    
    % (d) Filtragem do sinal sem ruído (Teste do filtro IIR)
    yclean = filter(b, a, ydifq);
    
    % Potencia do sinal a transmitir
    Ps = sum(sum(abs(ydifq_bpsk).^2)) / numel(ydifq_bpsk);
    
    % Adicionar ruído analógico para o sinal quantizado, para várias SNR's
    for kk = 1 : length(SNR_linear)
        
        % Ruído Gaussiano branco para a SNR desejada
        noise = wgnoise(ydifq_bpsk, SNR_linear(kk));
        
        % Sinal a transmitir - Diferenças consecutivas do sinal decimal 
        % codificado em bpsk com ruído analógico 
        ydifq_tx = ydifq_bpsk + noise;
        
        % Recetor - remoção do ruído analógico
        ydifq_rx = round(ydifq_tx);
        
        % (e) Recetor - Conversão para binário
        ydifq_bin_rx = ydifq_rx > 0;
        
        % Conversão para decimal
        ydec_rx = ydifq_bin_rx * (2.^(k:-1:0))';
        
        % Corrigir o offset efetuado às diferenças consecutivas
        ydec_rx = ydec_rx - offset;
        
        % Matched filter do transmissor (diferenças consecutivas)
        % Reconstrução o sinal yq 
        ydec_rx = filter(b, a, ydec_rx);
            
        % Imagem filtrada sem ruído
        figure
        subplot(121)
        imagesc(reshape(yclean, N, N));
        colormap(gray);
        colorbar
        title(['Imagem Quantizada sem ruído. Nº bits = ' num2str(k)]);

        % Imagem filtrada com ruído
        subplot(122)
        imagesc(reshape(ydec_rx, N, N))
        colormap(gray);
        colorbar
        title(['Imagem Quantizada com ruído.Nº bits = ' num2str(k) ', SNR = ' num2str(SNR_linear(kk))]);;
        
        % Valor de SNR
        SNR_dB_esperada(kk) = 10*log10(SNR_linear(kk)); 
        Pnoise = var(noise);    % Potencia do ruído
        SNR_dB_experimental(kk) = 10*log10(Ps / Pnoise(1));

    end;
            
    % Tabela de SNR's
    fprintf('\nTabela de SNR''s para %d bits de quantização', k);
    T = table(SNR_linear' ,SNR_dB_esperada', SNR_dB_experimental', 'VariableNames', ...
        {'SNR_linear', 'SNR_dB_esperada', 'SNR_dB_experimental'})
end;

% (g) A técnica de codificação apresentada só funciona para SNR muito
% elevadas porque basta um erro num bit para a descodificação dos restantes
% ficar severamente afetada. Um erro num bit implica um erro em todos os
% bits seguintes, pois no processo de filtragem (que desfaz a operação do
% cálculo das diferenças sucessivas) irá obter um valor no bit erróneo
% diferente do transmitido, e em seguida propaga esse erro para os
% restantes através da realimentação do filtro. Deste modo, um erro afeta
% todos os bits recebidos seguintes, pelo que a distorção na imagem
% apresenta um aspeto estruturado, ao invés do exercício 3, em que um erro
% num bit afeta só esse bit, logo a distorção é aleatória






