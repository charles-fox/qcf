function V_f = vf(f, n)
%V_f = vf(f, n)
%
%Build unitary f-conditional inverter for n bit input such that:
%  V_f|x> = (-1)^f(x)|x>
%
%f:Z->B
%
%TODO: can this be kronecker-factored out from U_f|x,1'> ?

V_f = zeros(2^n);

for i=0:2^n-1
    V_f(i+1,i+1)=(-1)^(feval(f,i));
end

