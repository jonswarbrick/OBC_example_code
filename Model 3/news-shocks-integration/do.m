%% Computes IRF for BBW2016 NK model
% Uses dynareOBCs under perfect foresight and with different types of cubature
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% No cubature
dynareOBC NK_ZLB ShockScale=3 bypass

VarNames = char('y','pi','r');
ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/linear.mat','irfs','IRFoffset')

clear;

%% No cubature
dynareOBC NK_ZLB ShockScale=3 timetoescapebounds=64

VarNames = char('y','pi','r');
ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/zlb_nocubature.mat','irfs','IRFoffset')

clear;

%% Degree 3 Monomial
dynareOBC NK_ZLB ShockScale=3 timetoescapebounds=64 FastCubature

VarNames = char('y','pi','r');
ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/zlb_fastcubature.mat','irfs','IRFoffset')

clear;

%% Genz & Keister (1996)
dynareOBC NK_ZLB ShockScale=3 timetoescapebounds=64 GaussianCubatureDegree=7 cubatureAcceleration

VarNames = char('y','pi','r');
ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/zlb_GenzKeister.mat','irfs','IRFoffset')

clear;

%% Quasi Monte Carlo
dynareOBC NK_ZLB ShockScale=3 timetoescapebounds=64 QuasiMonteCarloLevel=9

VarNames = char('y','pi','r');
ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/zlb_qmc.mat','irfs','IRFoffset')

clear;

%% Monte Carlo, no cubature
dynareOBC NK_ZLB ShockScale=3 timetoescapebounds=64 slowIRFs

VarNames = char('y','pi','r');

ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/zlb_slow.mat','irfs','IRFoffset')
clear;


%% Monte Carlo, no cubature
dynareOBC NK_ZLB ShockScale=3 timetoescapebounds=128 slowIRFs QuasiMonteCarloLevel=9

VarNames = char('y','pi','r');

ShockNames = char('epsilond');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('results/zlb_slow_qmc.mat','irfs','IRFoffset')
clear;


%% Cleanup
dynare_cleanup(  );

%% Plot comparison
close all;
irf_plots;
