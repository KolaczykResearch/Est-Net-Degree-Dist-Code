function[result] = run_d(sample_number, cov_dat, name,N,delta)

addpath ../MCSURE_fns_QP_smooth1

load ../pdmatrix_20_ex.dat;%%%%%%%%change
load ../Ns_m_20_ex.dat;%%%%%%%%change
load ../true_degree_ex.dat;%%!!

data.delta=delta;
data.sample_number=sample_number;
data.cov_dat=cov_dat;
data.N=N;
data.epsilon=0.1;
data.lambda=[10^-7,5*10^-7,10^-6,5*10^-6,(10^-5:2*10^-5:9*10^-5),(10^-4:2*10^-4:9*10^-4),(10^-3:2*10^-3:9*10^-3),0.01,0.1];%%%%%change
%data.lambda=10^-4;
data.sample_matrix=Ns_m_20_ex;%%!!%%%%%%%%change
data.true_degree=true_degree_ex;%%!!
data.A=pdmatrix_20_ex;%%!!%%%%%%change

constraint.V=10000;%%%%%%%change

env.folder='result_smooth_N100_delta_r005randn';%%!!
env.name=sprintf('%s_N%d_%d_d%1.3f', name, data.N, data.sample_number, data.delta);
env.range=[-0.001,0.01]; %%%%%%change according to range
env.name
EstimatingDegreeDistribution(data,env,constraint)

result = 1;

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.