%% Plots IRFS simulations for multiple models
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019

%% Some options

opt.periods_to_plot = 40;
opt.no_rows_sub_plots = 2;
opt.no_cols_sub_plots = 2;
opt.plot_size = [200 200 900 600];

opt.results_files = {
    'results/zlb_nocubature'
    %'results/zlb_fastcubature'
    %'results/zlb_GenzKeister'
    'results/zlb_qmc'
    %'results/zlb_slow'
    'results/zlb_slow_qmc'
    %'results/linear'
};

opt.model_names = {
    'No cubature'
    %'Fast cubature'
    %'Genz & Keister (1996)'
    'Quasi Monte Carlo'
    %'Monte Carlo'
    'Monte Carlo with Quasi MC'
    %'Taylor Approximation'
};

opt.variable_names = char( ...
    'y','pi','r'...
);

opt.variable_labels = char( ...
    'Output','Inflation','Nominal Interest Rate'...
);

opt.shock_names = char( ...
    'epsilond' ...
);

opt.shock_labels = char( ...
    'Time Preference Shock' ...
);

IRF_plotter( opt );
