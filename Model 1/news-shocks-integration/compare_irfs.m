% CIMS Summer School 2019 -- OBC Option, Jonathan Swarbrick
clear; close all;


load('../projection/results/projection_irfs.mat')
irf1 = projection.irf;
load('../piecewise-linear/results/irfs.mat')
irf3 = piecewise.irf;
load('../news-shocks/results/irfs.mat')
irf4 = irfs;

figure;
subplot( 1 , 3 , 1)
plot( irf1.c.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf3.c.epsz(1:60),  'b-' , 'LineWidth', 2  );
plot( irf4.c.epsz(1:60),  'm-' , 'LineWidth', 2  );
ylabel('Deviation from mean')
title('Consumption')
subplot( 1 , 3 , 2)
plot( irf1.h.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf3.h.epsz(1:60),  'b-' , 'LineWidth', 2  );
plot( irf4.h.epsz(1:60),  'm-' , 'LineWidth', 2  );
title('Hours')
subplot( 1 , 3 , 3)
plot( irf1.b.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
plot( irf3.b.epsz(1:60),  'b-' , 'LineWidth', 2  );
plot( irf4.b.epsz(1:60),  'm-' , 'LineWidth', 2  );
title('Bonds')
set(gcf,'position',[100 100 600 170])
print('irf_comparison_1','-depsc')

% load('results/irfs_qmc.mat')
% subplot( 1 , 3 , 1); plot( irfs.c.epsz(1:60), 'c-' , 'LineWidth', 2  );
% subplot( 1 , 3 , 2); plot( irfs.h.epsz(1:60), 'c-' , 'LineWidth', 2  ); 
% subplot( 1 , 3 , 3); plot( irfs.b.epsz(1:60), 'c-' , 'LineWidth', 2  ); 
% print('irf_comparison_2','-depsc')

load('results/irfs_slow.mat')
subplot( 1 , 3 , 1); plot( irfs.c.epsz(1:60), 'g-' , 'LineWidth', 2  );
subplot( 1 , 3 , 2); plot( irfs.h.epsz(1:60), 'g-' , 'LineWidth', 2  ); 
subplot( 1 , 3 , 3); plot( irfs.b.epsz(1:60), 'g-' , 'LineWidth', 2  ); 
print('irf_comparison_3','-depsc')

load('results/irfs_slow_qmc.mat')
subplot( 1 , 3 , 1); plot( irfs.c.epsz(1:60), 'r--' , 'LineWidth', 2  );
subplot( 1 , 3 , 2); plot( irfs.h.epsz(1:60), 'r--' , 'LineWidth', 2  ); 
subplot( 1 , 3 , 3); plot( irfs.b.epsz(1:60), 'r--' , 'LineWidth', 2  ); 
print('irf_comparison_4','-depsc')

figure;
subplot( 1 , 3 , 1)
plot( irf1.c.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
ylabel('Deviation from mean')
title('Consumption')
subplot( 1 , 3 , 2)
plot( irf1.h.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
title('Hours')
subplot( 1 , 3 , 3)
plot( irf1.b.epsz(1:60), 'k-' , 'LineWidth', 2  ); hold on;
title('Bonds')
subplot( 1 , 3 , 1); plot( irfs.c.epsz(1:60), 'r--' , 'LineWidth', 2  );
subplot( 1 , 3 , 2); plot( irfs.h.epsz(1:60), 'r--' , 'LineWidth', 2  ); 
subplot( 1 , 3 , 3); plot( irfs.b.epsz(1:60), 'r--' , 'LineWidth', 2  ); 
set(gcf,'position',[100 100 600 170])
print('irf_comparison_5','-depsc')