% Gui�o 4 MPE
% Diogo Correia N�76608
% dv.correia@ua.pt

% PARTE 1
close all; clear all; clc;

lower = ['abcdefghijklmnopqrstuvwxyz'];
upper = ['ABCDEFGHIJKLMNOPQRSTUVWXYZ'];
punct = ['!,;.:"?-() ' sprintf('\n')];

fid = fopen('metamorphosis.txt','r');

% 1.
frase = fgets(fid);
ncharmin = zeros(1, length(lower));

while frase ~= -1
   for n = 1 : length(lower)
      ncharmin(n) = ncharmin(n) + sum(frase == lower(n));
      ncharmin(n) = ncharmin(n) + sum(frase == upper(n)); 
   end
   frase = fgets(fid);
end

fclose(fid);

sncharmin = sort(ncharmin,'descend');

figure(1);
bar(sncharmin);

% 2.

% 3.
pk = ncharmin ./ sum(ncharmin);
entropia = sum(pk .* log2(1./pk));
fprintf('Entropia do texto = %d\n\n', entropia);

% 4.
    % Raw Text:
    fprintf('Raw text = 138 KB\n');
    
    % C�digo 1: uniforme
nbitsUniformCode = sum(sncharmin * 8);
fprintf('Codigo uniforme = %d KB\n', ceil(nbitsUniformCode/8e3));

    % C�digo 2: 2 do gui�o 3
nbitsCode1 = 0;
for i = 1 : length(lower)
   nbitsCode1 = nbitsCode1 + sncharmin(i) * i; 
end

fprintf('Codigo 1 = %d KB\n', ceil(nbitsCode1/8e3));

    % C�digo 3: simbolo +provavel = 0 ; outros 1+8bits
    
    % C�digo 4: 
        % 1� simbolo +provavel = 00
        % 2� simbolo +provavel = 01
        % 3� simbolo +provavel = 10
        % outros = 11 + 8bits
        
    % Winrar
fprintf('Winrar zip = 50 KB\n');
fprintf('Winrar rar = 48 KB\n');

