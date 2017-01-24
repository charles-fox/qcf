function deutsch 
%deutsch 
%
%Demo of Deutsche's Problem


psi = bin2vec('01')

U_f = uf('f_b1', 1, 1)

H = hadamard(2)

psi = H*U_f*H*psi

psi = measure(psi)







