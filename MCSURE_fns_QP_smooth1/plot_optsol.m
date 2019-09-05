function[]=plot_optsol(opt_sol,true_degree,y,dimen,env)
figure()
plot((0:(dimen-1)),true_degree)
hold on
plot((0:(dimen-1)),y,'black')
plot((0:(dimen-1)),opt_sol,'r')

figure_path = sprintf('%s/optsol_%s.pdf', env.folder, env.name);
fprintf('saving opt_sol figure to: %s\n', figure_path);
print('-dpdf', figure_path)
fprintf('saving success\b');

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.
