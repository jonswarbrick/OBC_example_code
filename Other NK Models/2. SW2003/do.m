%% Computes IRF for SW2003 NK model
% Compares alternative solutions using dynareOBC
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% Solution 1
dynareOBC SW03IRF nocubature shockscale=22.5

VarNames = char('yobs','cobs','piobs','robs');
ShockNames = char('epsilon_b');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('../results/SW03_sol1.mat','irfs','IRFoffset')
clear;

%% Solution 2
dynareOBC SW03IRF nocubature shockscale=22.5 skipfirstsolutions=1

VarNames = char('yobs','cobs','piobs','robs');
ShockNames = char('epsilon_b');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('../results/SW03_sol2.mat','irfs','IRFoffset')
clear;

%% Cleanup
dynare_cleanup(  );

%% Plot comparison
close all;
irf_plots;
