%% Plots IRFS simulations for multiple models
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019

%% Some options

opt.periods_to_plot = 60;
opt.no_rows_sub_plots = 3;
opt.no_cols_sub_plots = 3;
opt.plot_size = [200 200 900 600];

opt.results_files = {
    'results/irfs'
    'results/irfs_unbounded'
};

opt.model_names = {
    'News shocks perfect foresight - always binding'
    'News shocks perfect foresight - borrowing constraints'
};

opt.variable_names = char( ...
    'log_cp','log_ci','log_hp','log_hi','log_b','log_r','varrho' ...
);

opt.variable_labels = char( ...
    'Patient Consumption','Imatient Consumption','Patient Housing','Imatient Housing','Debt','Interest Rate','Lagrange Multiplier' ...
);

opt.shock_names = char( ...
    'epszi','epszp','epsq' ...
);

IRF_plotter( opt );
