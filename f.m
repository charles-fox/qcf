function y = f(x,n)
%y = f(x,n)  : test function
%This is a test function used in some of the examples.U_f = uf('f', 3, 2);
%n no output bits
y=mod(x+1, 2^n);