%% Plots IRFS simulations for multiple models
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear;

%% Some options

opt.periods_to_plot = 40;
opt.no_rows_sub_plots = 3;
opt.no_cols_sub_plots = 3;
opt.plot_size = [200 200 900 600];

opt.results_files = {
    'results/irfs_alwaysbinding'
    'results/irfs'
};

opt.model_names = {
    'Perfect Foresight - always binding'
    'Perfect Foresight - OBC'
};

opt.variable_names = char( ...
    'log_cp','log_ci','log_hp','log_hi','log_b','log_r','q','varrho' ...
);

opt.variable_labels = char( ...
    'Patient Consumption','Imatient Consumption','Patient Housing','Imatient Housing','Debt','Interest Rate','House Price','Lagrange Multiplier' ...
);

opt.shock_names = char( ...
    'epszi','epszp','epsq' ...
);

opt.shock_labels = char( ...
    'Impatient Income Shock','Patient Income Shock','House Price Shock' ...
);

IRF_plotter( opt );
