%% Plots IRFs from SOE models solved using projection methods
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;

try
load('results/projection_irfs.mat')

figure;
subplot( 1 , 3 , 1)
plot( projection.irf_unbounded.c.epsz, 'k-' , 'LineWidth', 2  ); hold on;
plot( projection.irf.c.epsz,  'r-' , 'LineWidth', 2  );
title('Consumption')
subplot( 1 , 3 , 2)
plot( projection.irf_unbounded.h.epsz, 'k-' , 'LineWidth', 2  ); hold on;
plot( projection.irf.h.epsz,  'r-' , 'LineWidth', 2  );
title('Hours')
subplot( 1 , 3 , 3)
plot( projection.irf_unbounded.b.epsz, 'k-' , 'LineWidth', 2  ); hold on;
plot( projection.irf.b.epsz,  'r-' , 'LineWidth', 2  );
title('Bonds')
sgtitle('IRF to technology shock')
legend({'No constraint','Borrowing constraints model'})


catch
disp('Error: have you run soe_borrowing_constraint.m and soe.m?!')
end
    
    

