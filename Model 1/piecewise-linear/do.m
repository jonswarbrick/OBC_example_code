%% Solves SOE model using piecewise-linear method
% Uses Iacoviello and Guerrieri's 'OccBin' toolbox
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;
path('../../functions/occbin',path);
path('../../functions',path);

global M_ oo_

% .mod filenames for two regimes
modnam = 'soe_borrowing_constraint_slack';
modnamstar = 'soe_borrowing_constraint_binding';

constraint = 'b<b_limit';
constraint_relax ='b>b_limit';

%% IRF simulation

% Pick innovation for IRFs
irfshock =char('epsz');      % label for innovation for IRFs

shockscale = -2;
nperiods = 80;
shockssequence = zeros(nperiods,1);
shockssequence(2) = 1;
shockssequence = shockssequence * shockscale;
    
[zdatalinear zdatapiecewise zdatass oobase_ Mbase_  ] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  shockssequence,irfshock,nperiods);

% Unpack simulations
for i=1:Mbase_.endo_nbr
  piecewise.irf_unbounded.(deblank(Mbase_.endo_names(i,:))).epsz = zdatalinear(2:61,i)';
  piecewise.irf.(deblank(Mbase_.endo_names(i,:))).epsz = zdatapiecewise(2:61,i)';
  piecewise.irf_ss.(deblank(Mbase_.endo_names(i,:))).epsz = zdatass(i)';
end

save('results/irfs.mat','piecewise');

%% Time-series simulation

% Pick innovation for IRFs
irfshock =char('epsz');      % label for innovation for IRFs

nperiods = 10000;
burn_in = 1000;
shockssequence = randn(nperiods,1);
    
[zdatalinear zdatapiecewise zdatass oobase_ Mbase_  ] = ...
  solve_one_constraint(modnam,modnamstar,...
  constraint, constraint_relax,...
  shockssequence,irfshock,nperiods);

% Unpack simulations
for i=1:Mbase_.endo_nbr
  piecewise_sim.sim_unbounded.(deblank(Mbase_.endo_names(i,:))) = zdatalinear(:,i)'+ zdatass(i)';
  piecewise_sim.sim.(deblank(Mbase_.endo_names(i,:))) = zdatapiecewise(:,i)' + zdatass(i)';
end

save('results/sims.mat','piecewise');

%% Figures and Moments
figure;

subplot(1,3,1)
plot(piecewise.irf_unbounded.c.epsz,'k-','LineWidth',2); hold on;
plot(piecewise.irf.c.epsz,'r-','LineWidth',2); 
title('Consumption')
subplot(1,3,2)
plot(piecewise.irf_unbounded.h.epsz,'k-','LineWidth',2); hold on;
plot(piecewise.irf.h.epsz,'r-','LineWidth',2); 
title('Hours')
subplot(1,3,3)
plot(piecewise.irf_unbounded.b.epsz,'k-','LineWidth',2); hold on;
plot(piecewise.irf.b.epsz,'r-','LineWidth',2); 
title('Bonds')

% Metrics
moments(1,1) = mean(piecewise_sim.sim.c(burn_in+1:end));
moments(2,1) = mean(piecewise_sim.sim.h(burn_in+1:end));
moments(3,1) = mean(piecewise_sim.sim.b(burn_in+1:end));
moments(1,2) = std(piecewise_sim.sim.c(burn_in+1:end));
moments(2,2) = std(piecewise_sim.sim.h(burn_in+1:end));
moments(3,2) = std(piecewise_sim.sim.b(burn_in+1:end));
moments(1,3) = skewness(piecewise_sim.sim.c(burn_in+1:end));
moments(2,3) = skewness(piecewise_sim.sim.h(burn_in+1:end));
moments(3,3) = skewness(piecewise_sim.sim.b(burn_in+1:end));

disp('**-- Borrowing constraints model --** ')
disp( table( moments(:,1) , moments(:,2) , moments(:,3) , ...
          'VariableNames',{'Mean','StandardDeviation','Skewness'},...
          'RowNames',{'Consumption';'Hours';'Bonds'}) )

con_binding = zeros(size(piecewise_sim.sim.b(burn_in+1:end)));
con_binding(piecewise_sim.sim.b(burn_in+1:end)+0.01<1e-6) = 1;
disp(['Constraint binds in ', num2str(100*mean(con_binding)),'% of periods'])     
      
% Metrics
moments(1,1) = mean(piecewise_sim.sim_unbounded.c(burn_in+1:end));
moments(2,1) = mean(piecewise_sim.sim_unbounded.h(burn_in+1:end));
moments(3,1) = mean(piecewise_sim.sim_unbounded.b(burn_in+1:end));
moments(1,2) = std(piecewise_sim.sim_unbounded.c(burn_in+1:end));
moments(2,2) = std(piecewise_sim.sim_unbounded.h(burn_in+1:end));
moments(3,2) = std(piecewise_sim.sim_unbounded.b(burn_in+1:end));
moments(1,3) = skewness(piecewise_sim.sim_unbounded.c(burn_in+1:end));
moments(2,3) = skewness(piecewise_sim.sim_unbounded.h(burn_in+1:end));
moments(3,3) = skewness(piecewise_sim.sim_unbounded.b(burn_in+1:end));

disp('**-- Linear (unbounded) model --** ')
disp( table( moments(:,1) , moments(:,2) , moments(:,3) , ...
          'VariableNames',{'Mean','StandardDeviation','Skewness'},...
          'RowNames',{'Consumption';'Hours';'Bonds'}) )
    
 
%% Clean up
dynare_cleanup;
