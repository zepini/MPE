%% parte 3 - José Domingues
clear, clc, close all;

counter = 0;
n = 10;
for i = 1:n
    N = 4;
    dado = ceil(6*rand(1,N))
    %cada vez que ocorre um 6 counter++
    if(dado == 6)
        counter = counter+1;
        disp('aqui');
    end
end
probabilidade = counter/n;