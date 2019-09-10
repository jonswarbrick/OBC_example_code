%% Plots IRFS simulations for multiple models
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019

%% Some options

opt.periods_to_plot = 60;
opt.no_rows_sub_plots = 1;
opt.no_cols_sub_plots = 3;
opt.plot_size = [200 200 900 250];

opt.results_files = {
    'results/irfs_qmc'
    'results/irfs_slow'
    'results/irfs_slow_qmc'
    'results/irfs_unbounded'
};

opt.model_names = {
    'News shocks perfect foresight - borrowing constraints - QMC / fast'
    'News shocks perfect foresight - borrowing constraints - slow'
    'News shocks perfect foresight - borrowing constraints - QMC / slow'
    'News shocks perfect foresight - no constraint'
};

opt.variable_names = char( ...
    'c','h','b'...
);

opt.shock_names = char( ...
    'epsz' ...
);

opt.nolegend=0;
opt.xlabel = '';
opt.ylabel = 'Level deviation from SS';

IRF_plotter( opt );
