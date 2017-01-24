function str = pretty(struct, b_dec)
%str = pretty(struct, [b_dec])
%
%Get pretty-printed string depicting a state struct

if nargin<2,b_dec=0; end

if ~isstruct(struct) %if vec
    struct=vec2struct(struct);
end
    
str=[];

for i=1:length(struct)
    
    if ~b_dec
        str=[ str ' ' num2str(struct(i).alpha) '|' struct(i).bin '> +'];
    else
     str=[ str ' ' num2str(struct(i).alpha) '|' num2str(bin2dec(struct(i).bin)) '> +'];
    end
end

str=str(1:end-1);