%% Plots IRFS simulations for multiple models
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019
clear; close all;

try
    load('projection/results/projection_irfs.mat')
    irf1 = projection.irf;
    irf1_unbounded = projection.irf_unbounded;
catch
    disp('Simulations using projection methods have not been run')
    irf1.c.epsz = zeros(1,60);
    irf1.h.epsz = zeros(1,60);
    irf1.b.epsz = zeros(1,60);
    irf1_unbounded = irf1;
end

try
    load('piecewise-linear/results/irfs.mat')
    irf2 = piecewise.irf;
    irf2_unbounded = piecewise.irf_unbounded;
catch
    disp('Simulations using the piecewise-linear method have not been run')
    irf2.c.epsz = zeros(1,60);
    irf2.h.epsz = zeros(1,60);
    irf2.b.epsz = zeros(1,60);
    irf2_unbounded = irf2;
end

try
    load('perfect-foresight/results/irfs.mat')
    irf3 = irfs;
    load('perfect-foresight/results/irfs_unbounded.mat')
    irf3_unbounded = irfs;
catch
    disp('Simulations using the piecewise-linear method have not been run')
    irf3.c.epsz = zeros(1,60);
    irf3.h.epsz = zeros(1,60);
    irf3.b.epsz = zeros(1,60);
    irf3_unbounded = irf3;
end

try
    load('news-shocks/results/irfs.mat')
    irf4 = irfs;
    load('news-shocks/results/irfs_unbounded.mat')
    irf4_unbounded = irfs;
catch
    disp('Simulations using the piecewise-linear method have not been run')
    irf4.c.epsz = zeros(1,60);
    irf4.h.epsz = zeros(1,60);
    irf4.b.epsz = zeros(1,60);
    irf4_unbounded = irf4;
end

figure;
subplot( 1 , 3 , 1)
plot( irf1.c.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf2.c.epsz(1:60),  'r-' , 'LineWidth', 2  );
plot( irf3.c.epsz(1:60),  'b--' , 'LineWidth', 2  );
plot( irf4.c.epsz(1:60),  'm:' , 'LineWidth', 2  );
ylabel('Deviation from mean')
title('Consumption')
subplot( 1 , 3 , 2)
plot( irf1.h.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf2.h.epsz(1:60),  'r-' , 'LineWidth', 2  );
plot( irf3.h.epsz(1:60),  'b--' , 'LineWidth', 2  );
plot( irf4.h.epsz(1:60),  'm:' , 'LineWidth', 2  );
title('Hours')
subplot( 1 , 3 , 3)
plot( irf1.b.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf2.b.epsz(1:60),  'r-' , 'LineWidth', 2  );
plot( irf3.b.epsz(1:60),  'b--' , 'LineWidth', 2  );
plot( irf4.b.epsz(1:60),  'm:' , 'LineWidth', 2  );
title('Bonds')
%sgtitle('IRF to technology shock')
%legend({'Projection','Piecewise-Linear','Perfect-foresight','New-shocks'})


figure;
subplot( 1 , 3 , 1)
plot( irf1_unbounded.c.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf2_unbounded.c.epsz(1:60),  'r-' , 'LineWidth', 2  );
plot( irf3_unbounded.c.epsz(1:60),  'b--' , 'LineWidth', 2  );
plot( irf4_unbounded.c.epsz(1:60),  'g:' , 'LineWidth', 2  );
ylabel('Deviation from mean')
title('Consumption')
subplot( 1 , 3 , 2)
plot( irf1_unbounded.h.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf2_unbounded.h.epsz(1:60),  'r-' , 'LineWidth', 2  );
plot( irf3_unbounded.h.epsz(1:60),  'b--' , 'LineWidth', 2  );
plot( irf4_unbounded.h.epsz(1:60),  'g:' , 'LineWidth', 2  );
title('Hours')
subplot( 1 , 3 , 3)
plot( irf1_unbounded.b.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf2_unbounded.b.epsz(1:60),  'r-' , 'LineWidth', 2  );
plot( irf3_unbounded.b.epsz(1:60),  'b--' , 'LineWidth', 2  );
plot( irf4_unbounded.b.epsz(1:60),  'g:' , 'LineWidth', 2  );
title('Bonds')
