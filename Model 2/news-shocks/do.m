%% Solves borrowers-savers collateral constraints model with dynareOBC
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% With OBC
dynareOBC BorrowingConstraints shockscale=100

VarNames = char('log_cp','log_ci','log_hp','log_hi','log_b','log_r','q','varrho');
ShockNames = char('epszi','epszp','epsq');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/irfs.mat','irfs','IRFoffset')

clear;

%% Without OBC
dynareOBC BorrowingConstraints shockscale=100 bypass

VarNames = char('log_cp','log_ci','log_hp','log_hi','log_b','log_r','q','varrho');
ShockNames = char('epszi','epszp','epsq');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/irfs_unbounded.mat','irfs','IRFoffset')

clear;

%% Cleanup
dynare_cleanup(  );


%% Plot comparison
close all;
irf_plots;
