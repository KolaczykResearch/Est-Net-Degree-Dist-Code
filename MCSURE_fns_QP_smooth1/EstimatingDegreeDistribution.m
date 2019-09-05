function[div_vec,tr_vec,mse,opt_sol,opt_lambda]=EstimatingDegreeDistribution(data,env,constraint)
[dimen,C,invC, D, y] = prepare_data(data, env, constraint);
div_vec=[];
tr_vec=[];
mse=[];
for k = 1:length(data.lambda)

    [div, tr, e]=weighted_MCSURE(C,invC,y,dimen,data.lambda(k),D,data,constraint);

    div_vec=[div_vec,div];
    tr_vec=[tr_vec,tr];
    mse=[mse,e];

end
plot_MCSURE(tr_vec,div_vec,mse,y,data.lambda,env);

[min_val,min_ind]=min(mse);
opt_lambda=data.lambda(min_ind);
opt_sol=weighted_constraint_opt(C,invC,data.A,y,dimen,opt_lambda,D,constraint);

plot_optsol(opt_sol,data.true_degree,y,dimen,env)

data_path = sprintf('%s/MCSURE_%s.mat', env.folder, env.name);
fprintf('saving data to path: %s\n', data_path);
save(data_path)
fprintf('saving success\n');

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.
