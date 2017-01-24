function psi = renormalise(psi)
%psi = renormalise(psi)
%
%Renormalise such that sum(phi.^2)=1

psi=sign(psi).*sqrt(psi.^2/sum(psi.^2));