function cf_assert(b, msg)
%cf_assert(b)
%
%throws error if boolean b is false
%(used for including verication of assumptions)

if ~b
    str = 'Assertion failed';

    if nargin>1
        str = [str ': ' msg];
    end
    
    error(str)
    
end
