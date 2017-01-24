function deutsch_jozsa(f)
%deutsch_jozsa(f)
%
%This fuction should be called with the name of a constant or balanced
%function f.
%eg: deutsch_jozsa('dj_b0')
%
%The functions dj_b0, dj_b1, dj_c0, dj_c1 are provided in QCF as examples.

psi = bin2vec('000001');

U_f = uf(f, 5, 1);

H_6 = hadamard(6);
H_5 = hadamard(5);
I   = identity(1);

psi = (kron(H_5, I))*U_f*H_6*psi;

psi = measure(psi);

pretty(psi)











