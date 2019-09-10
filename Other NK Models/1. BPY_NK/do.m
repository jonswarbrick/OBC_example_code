%% Computes IRF for BPY2013 NK model
% Compares alternative solutions using dynareOBC
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% High omega
dynareOBC BPYModel.mod FullHorizon omega=10000

VarNames = char('y','pi','i');
ShockNames = char('e');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('../results/BPY_highomega.mat','irfs','IRFoffset')
clear;

%% Low omega
dynareOBC BPYModel.mod FullHorizon omega=0.0001

VarNames = char('y','pi','i');
ShockNames = char('e');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('../results/BPY_lowomega.mat','irfs','IRFoffset')
clear;

%% No ZLB
dynareOBC BPYModel.mod bypass

VarNames = char('y','pi','i');
ShockNames = char('e');
[irfs,IRFoffset] = store_dynareOBC_irfs_for_plotting( dynareOBC_, oo_, VarNames , ShockNames );
save('../results/BPY_nozlb.mat','irfs','IRFoffset')
clear;

%% Cleanup
dynare_cleanup(  );

%% Plot comparison
close all;
irf_plots;
