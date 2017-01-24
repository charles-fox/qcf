function phi = bin2vec(bin)
%phi = bin2vec(bin)
%Converts a single (non-superposed) binary state description of a register 
%to a vector state representation.

dec=bin2dec(bin);
phi=dec2vec(dec,length(bin));