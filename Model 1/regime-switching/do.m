%% Solves SOE model using RISE
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
path('../../functions/RISE_toolbox',path);
path('../../functions',path);
rise_startup();

% Create the model structure from the model file
m=rise('soe_borrowing_constraint');

% Solve the policy functions
[ms,retcode]=solve(m);

% Print out policy function
print_solution(ms);

%% Compute average IRFs
girf=irf(ms,'irf_periods',100,'irf_shock_sign',-2,'irf_anticipate',false,...
        'simul_honor_constraints_through_switch',true,'simul_honor_constraints',true,...
        'irf_regime_specific',false,'irf_type','girf','irf_draws',750);

irfs.c.epsz = girf.epsz.c.data;
irfs.b.epsz = girf.epsz.b.data;
irfs.h.epsz = girf.epsz.h.data;
save('results/rise_irfs','irfs');
    
figure;
subplot( 1 , 3 , 1)
plot( irfs.c.epsz(1:60),  'r-' , 'LineWidth', 2  );
title('Consumption')
grid on
subplot( 1 , 3 , 2)
plot( irfs.h.epsz(1:60),  'r-' , 'LineWidth', 2  );
title('Hours')
grid on
subplot( 1 , 3 , 3)
plot( irfs.b.epsz(1:60),  'r-' , 'LineWidth', 2  );
title('Bonds')
grid on
set(gcf,'position',[200 200 580 130]) 
set(findall(gcf,'-property','FontSize'),'FontSize',8)
