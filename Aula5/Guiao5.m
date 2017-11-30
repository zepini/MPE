%% Guiao 5 - José Domingues 76328
clear all, close all, clc;

img = imread('skin.jpg');
hsv = rgb2hsv(img);
h = hsv(:,:,1);
s = hsv(:,:,2);

% 1 
h = ceil(99*h)+1;
s = ceil(99*s)+1;

%2 F(h,s)

h = reshape(h,1,size(h,1)*size(h,2));
s = reshape(s,1,size(s,1)*size(s,2));

pHS = zeros(100,100);
N = length(h);
for hi =1:100
    for sj =1:100
        pHS(hi,sj) = sum((h == hi) & (s == sj))/N;
    end
end
figure(1);
subplot(2,1,1);
surf(pHS);

%fpm de H
pmfH = sum(pHS,2);
figure(2);
subplot(2,1,1);
bar(pmfH);
%fpm de S 
pmfS = sum(pHS,1);
figure(2);
subplot(2,1,2);
bar(pmfS);

%4
pmfIndependente = pmfH*pmfS;
figure(1);
subplot(2,1,2);
surf(pmfIndependente)


%5

fdaH = cumsum(pmfH);
fdaS = cumsum(pmfS);

%por olhometro chegamos a 
%h -> [3 a 10]
%s -> [25 a 59]




























