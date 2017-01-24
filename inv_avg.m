function D = inv_avg(n)
%D = inv_avg(n)
%
%Inversion about the average for n bits

D = 2*ones(2^n)/(2^n);

D = D-eye(2^n);