function u = build_u(in_bins, out_bins)
%u = build_u(in_bins, out_bins)
%assumes unitary: no repeatitions, all covered.  TODO: assert this
n=size(in_bins,2);

u = zeros(2^n-1);

for i=1:size(in_bins,1)

    in=bin2dec(in_bins(i,:));
    out=bin2dec(out_bins(i,:));
    
    u(out+1,in+1)=1; %matlab indices
    
end

%TODO: normalise