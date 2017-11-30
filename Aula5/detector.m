function detector(c1,c2,g1,g2 )
% c1 e c2 sao as componentes cromaticas (0 a 1) da imagem
% Por exemplo, c1=h e c2=s para HSV
% g1 e g2 sao as gamas de valores da pele
skin = ((c1>g1(1)) & (c1<g1(2)) & (c2>g2(1)) & (c2<g2(2)));
figure;
imagesc(skin);
colormap(gray);
end

