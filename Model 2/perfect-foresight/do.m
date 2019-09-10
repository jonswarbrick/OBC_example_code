%% Computes IRF for  borrowers-savers collateral constraints model
% Uses dynare's built in perfect-foresight solve
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
addpath('../../functions')

%% With OBC
dynare BorrowingConstraints
save('results/irfs.mat','irfs','IRFoffset')
clear;

%% Without OBC
dynare BorrowersSavers
save('results/irfs_alwaysbinding.mat','irfs','IRFoffset')
clear;

%% Cleanup
dynare_cleanup(  );

%% Plot comparison
irf_compare;
