function [phi,obs] = measure_subspace(psi, M_str)
%[phi,obs] = measure_subspace(psi, M_str)
%Make a measurement on a subspace M_str of qubits of register psi.
%
%Specify which bits to measure with an N character string
%(where N is number of qubits in register psi)
%For each quibit in the register, 
%use 'M' to measure, 'X' to not measure (don't care).
%eg. measure_subspace(psi, 'XMXM')
%     will measure quibits 2 and 4 of a 4-qubit register state in psi.
%
%obs gives result of the measurment in binary.
%    the kth bit of obs coressponds to the kth measured qubit from the left
%phi is the collapsed final state after the observation.
%
%Note that measurment collapsed psi to a random result phi.
%The probability distributions of other possible phi's are not available as
%outputs of this function.  This is intentional as this information is lost
%in real life.  (However it is represented internally and the user may peek
%at it in debug mode if interested.)

%convert to struct representation.
%each struct in the superposition array has a binary string state representation.
if ~isstruct(psi) %if vec
    s=vec2struct(psi);      %s is the struct representation
end
    
%use the string rep's to change the order of the bits, 
%so that the bits to be measured are at the beginning

[M_sorted, M_index] = sort(M_str);

%this gives the inverse permutation to undo the sort
M_index_inv(M_index) = 1:length(M_index);

for iter=1:length(s)
    s(iter).bin = s(iter).bin(M_index);
end

%We can now follow the method in Gruska, p.71

n = sum(M_str=='M'); %number of qubits to measure
m = sum(M_str=='X'); %number of qubits not measured

c = zeros(2^n,2^m); %coefficients matrix

for iter=1:length(s)
    i_bin = s(iter).bin(1:n);
    j_bin = s(iter).bin(n+1:n+m);
    i = bin2dec(i_bin);             %decimal rep of measured part
    j = bin2dec(j_bin);             %decimal rep of unmeasured part
    c(i+1,j+1) = s(iter).alpha;     %adjust for 1-based matlab indices
end

p_i = sum(abs(c.^2), 2)';     %probability distribution of observation (from 0 to n-1)

%We could pick a random outcome now, then just calculate its output state
%Instead we compute the output states for each outcome, as a matrix
%and choose the column corresponding to the randomly chosen state.
%This is more work, but it may be of interest to inspect the whole
%set of possible outcomes at this stage.
%(They are not returned as output variables, since in the real world
% this infomation is not available.  The user can sneak a glipse at the mind of god 
% by inspecting them in debug mode if required!)

phi_i = zeros(length(psi), 2^n); %set of possible output states (concenated horizontally)
for i=1:2^n
    for j=1:2^m   %add up contributions from each j
        if (c(i,j)~=0)
            bin = [dec2bin(i-1,n) dec2bin(j-1,m)];
            
            %invert the sort, so the measured and unmeasured bits are back
            %in their original places
            bin_inv = bin(M_index_inv);
            
            phi_i(:,i) = phi_i(:,i) + c(i,j) * bin2vec(bin_inv);
        end 
    end
    if p_i(i)~=0
        phi_i(:,i) = phi_i(:,i) / sqrt(p_i(i)); %normalise
    end
end

%simulate the collapse

[p_sort,p_index]=sort(p_i);
sp=cumsum(p_sort);          %the roulette wheel array
r = rand;                   %pick a point on the roulette wheel
e=1;

while r>sp(e)               %find which part of wheel the point is in
    e=e+1;
end
%e is the index of the winning collapsed event
obs_index = p_index(e)

obs = dec2bin(obs_index-1, n);  %observed value of measured qubits (adjust for matlab indices)
phi = phi_i(:,obs_index);       %collapsed state
