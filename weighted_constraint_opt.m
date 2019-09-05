function[result]=weighted_constraint_opt(C,invC,A,y,dimen,lambda_k,D,constraint,sample_number)
H=A'*invC*A +lambda_k*D'*D;
H1=(H+H')/2;
f=-A'*(C\y);
lb=zeros(dimen,1);
A_eq=ones(1,dimen);
b_eq=constraint.V;

opts = optimset('Algorithm','interior-point-convex');
tic
[result,fval,exitflag,output,lmd] = quadprog(H1,f,[],[],A_eq,b_eq,lb,[],[],opts);
if exitflag~=1
    fprintf('sample_number: %d, lambda: %d', sample_number,lambda_k);
    exit
end
toc

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.