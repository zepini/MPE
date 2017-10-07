function [A,B,C,D]=NUMEROS(L)
    A = ceil(100*rand(1,L));
    B = A(rem(A,2) == 0);
    C = A(rem(A,3) == 0);
    D = A(rem(A,5) == 0);

end