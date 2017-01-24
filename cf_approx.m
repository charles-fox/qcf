function b = cf_approx(x,y)
%b = cf_approx(x,y)
%
%true if x and y are approximately equal (to very small machine error tolerance)

b = (abs(x-y)<0.0000000001);
