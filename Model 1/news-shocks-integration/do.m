%% Solves SOE model with a borrowing constraint using dynareOBC
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% With OBC - cubature, no monte carlo
dynareOBC soe_borrowing_constraint shockscale=-2 timetoescapebounds=100 QuasiMonteCarloLevel=9

VarNames = char('c','h','b','mu');
ShockNames = char('epsz');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/irfs_qmc.mat','irfs','IRFoffset')

clear;


%% With OBC - monte carlo, no cubature
dynareOBC soe_borrowing_constraint shockscale=-2 timetoescapebounds=100 slowirfs

VarNames = char('c','h','b','mu');
ShockNames = char('epsz');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/irfs_slow.mat','irfs','IRFoffset')

clear;


%% With OBC - monte carlo and cubature
dynareOBC soe_borrowing_constraint shockscale=-2 timetoescapebounds=100 slowirfs QuasiMonteCarloLevel=9

VarNames = char('c','h','b','mu');
ShockNames = char('epsz');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/irfs_slow_qmc.mat','irfs','IRFoffset')

clear;

%% Without OBC
dynareOBC soe_borrowing_constraint shockscale=-2 bypass

VarNames = char('c','h','b','mu');
ShockNames = char('epsz');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/irfs_unbounded.mat','irfs','IRFoffset')

clear;

%% Cleanup
dynare_cleanup(  );


%% Plot comparison
close all;
irf_plots;
