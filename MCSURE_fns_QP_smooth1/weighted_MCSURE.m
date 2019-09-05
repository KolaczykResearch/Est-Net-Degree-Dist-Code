function[div,tr,e]=weighted_MCSURE(C,invC,y,dimen,lambda_k,D,data,constraint)

sol1=weighted_constraint_opt(C,invC,data.A,y,dimen,lambda_k,D,constraint);
div=0;
% b_m=zeros(dimen,data.N);
for j=1:data.N

    b=randn([dimen,1]);
%b=binornd(1,0.5,dimen,1)*2-1;
%     b_m(:,j)=b;
    y_b=y+data.epsilon*b;

    sol2=weighted_constraint_opt(C,invC,data.A,y_b,dimen,lambda_k,D,constraint,data.sample_number);
    div=div+b'*data.A*(sol2-sol1);

end
div=2*div/(data.N*data.epsilon);
% tr=(data.A*data.true_degree)'*invC(data.A*data.true_degree)+(data.A*sol1)'*invC*(data.A*sol1)-2*sol1'*data.A'*invC*y;
tr=(data.A*data.true_degree)'*(C\(data.A*data.true_degree))+(data.A*sol1)'*(C\(data.A*sol1))-2*sol1'*data.A'*(C\y);
e=tr+div;

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.
