function[]=plot_MCSURE(tr_vec,div_vec,mse,y,lambda,env)
figure()
subplot(2,2,1)
plot(lambda,tr_vec,'o-')
xlabel('lambda')
ylabel('L1')
xlim(env.range);

subplot(2,2,2)
plot(lambda,div_vec,'o-')
xlabel('lambda')
ylabel('L2')
xlim(env.range);

subplot(2,2,3)
plot(lambda,mse,'o-')
xlabel('lambda')
ylabel('MSE')
xlim(env.range);

subplot(2,2,4)
plot(y)
xlabel('degree')
ylabel('number of vertices')
y_lim=max(y)+1;
x_lim= find(y~=0, 1, 'last' );
axis([0 x_lim 0 y_lim])

mkdir(env.folder);
figure_path = sprintf('%s/plot_%s.pdf', env.folder, env.name);
fprintf('saving SURE figure to: %s\n', figure_path);
print('-dpdf', figure_path)
fprintf('saving success\b');

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.
