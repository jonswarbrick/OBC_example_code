%% Computes IRF for SOE model with and without borrowing constraint
% Uses dynare's built in perfect-foresight solve
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% With OBC
dynare soe_borrowing_constraint
save('results/irfs.mat','irfs','IRFoffset')
clear;

%% Without OBC
dynare soe
save('results/irfs_unbounded.mat','irfs','IRFoffset')
clear;

%% Cleanup
dynare_cleanup(  );

%% Plot comparison
irf_compare;
