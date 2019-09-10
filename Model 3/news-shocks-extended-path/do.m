%% Computes time-series simulation for BBW2016 NK model
% Uses dynareOBCs perfect-foresight solver
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
dynareOBC NK_ZLB

%% Cleanup
dynare_cleanup(  );
