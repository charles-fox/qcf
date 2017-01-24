function IA = ia(n)
%IA = ia(n)
%
%Inversion about average.

%TODO: normalise correctly

IA =2*ones(2^n)/(2^n);

IA =IA-eye(2^n);