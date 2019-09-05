function[dimen,C,invC, D, y]=prepare_data(data,env,constraint)
dimen=length(data.true_degree);
C=data.cov_dat+data.delta*eye(dimen);
invC=inv(C);

D=QS(dimen);
y=data.sample_matrix(:,data.sample_number);

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.
