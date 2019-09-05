function[] = run_multi(sample_numbers, name, N)%%!!
load ../Ns_smooth_20_ex.dat

for sample_number = sample_numbers
    cov_diag_smooth=diag(Ns_smooth_20_ex(:,sample_number));
    delta=max(Ns_smooth_20_ex(:,sample_number))*0.05/(1-0.05);%%!!
    rng('default')
    run_d(sample_number, cov_diag_smooth, name, N, delta);
end

%  This code has been developed by Yaonan Zhang, Eric Kolaczyk and Bruce Spencer.
%  Copyright (c) Yaonan Zhang, Eric Kolaczyk and Bruce Spencer, 2015.
%  All rights reserved.