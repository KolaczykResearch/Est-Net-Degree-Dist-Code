function[D]=QS(dimen)
D=eye((dimen-2),dimen);
for i = 1:(dimen-2)
    D(i,i+1)=-2;
    D(i,i+2)=1;
end

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.