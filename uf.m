function U_f = uf(f,m,n)
%U_f = uf(f,m,n)
%
% make u_f from f
%
% m is #bits in input
% n is #bits in output
% f must be of form:  y=f(x,n), with x:inf, n:int

% i is integer version of string x
% j is integer version of string b
% f:i -> R^n

ins=[];
outs=[];

for i=0:2^m-1
    
    x=dec2bin(i,m);

    for j=0:2^n-1
        b=dec2bin(j,n);
        
        in = [x b];
        
        out=[x dec2bin( bitxor(j, feval(f,i,n)) ,n) ];
        
        ins=[ins;in];
        outs=[outs;out];
    end
end

U_f = build_u(ins, outs);
