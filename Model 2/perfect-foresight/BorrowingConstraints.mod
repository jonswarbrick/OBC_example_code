%% Model with borrowers-savers, housing and collateral constraints
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019

var log_cp log_ci log_hi log_hp log_b log_r q zi zp mu varrho;

varexo epszi epszp epsq;

parameters lambda m betap betai delta chi rho sigmazi sigmazp sigmaq;

lambda = 0.5;
m = 0.6;
betap = 0.99;
betai = 0.96;
delta = 0.025;
chi = .5;
rho = 0.7;
sigmazi = 0.01;
sigmazp = 0.01;
sigmaq = 0.01;


model;
    # cp = exp(log_cp);
    # lead_cp = exp(log_cp(+1));
    # ci = exp(log_ci);
    # lead_ci = exp(log_ci(+1));
    # hi = exp(log_hi);
    # lag_hi = exp(log_hi(-1));
    # hp = exp(log_hp);
    # lag_hp = exp(log_hp(-1));
    # b = exp(log_b);
    # lag_b = exp(log_b(-1));
    # r = exp(log_r);
    # lag_r = exp(log_r(-1));
    # bi = b/(1-lambda);
    # lag_bi = lag_b/(1-lambda);
    # bp = b/lambda;
    # lag_bp = lag_b/lambda;
    # yi = exp(zi);
    # yp = exp(zp);

    q = exp(mu);
    cp + q*hp + bp = yp + (1-delta)*q*lag_hp + lag_r*lag_bp;
    chi/hp = q/cp - betap*(1-delta)*(q(+1)/lead_cp);
    1= betap*r*cp/lead_cp;
    ci + q*hi + lag_r*lag_bi = yi + (1-delta)*q*lag_hi +  bi;
    chi/hi - q/ci + betai*(1-delta)*q(+1)/lead_ci+varrho*q*m = 0;
    varrho = 1/ci - betai*r/lead_ci;
    varrho = max(0,varrho+bi-m*q*hi);

    zi = rho*zi(-1) + sigmazi * epszi;
    zp = rho*zp(-1) + sigmazp * epszp;
    mu = rho*mu(-1) + sigmaq * epsq;

end;

steady_state_model;
    q = 1;
    r_ = 1/betap;
    ci_ = 1 / ( 1 + (r_-1+delta/m)*m*chi / ( 1 - betai*(1-delta) - ((1-betai*r_)*m) ) );
    b_ = (1-lambda)*m*chi*ci_ / ( 1 - betai*(1-delta) - ((1-betai*r_)*m) );
    hp_ = ( 1 + (r_-1)*b_/lambda ) / ( ( (r_ - 1 + delta)/r_/chi + delta ) );
    cp_ = hp_*(r_ - 1 + delta)/r_/chi;
    hi_ = b_/(1-lambda)/m;
    varrho = (1-betai*r_)/ci_;

    log_r = log( r_ );
    log_hi = log( hi_ );
    log_b = log( b_ );
    log_ci = log( ci_ );
    log_hp = log( hp_ );
    log_cp = log( cp_ );
    zi=0;
    zp=0;
    mu=0;
end;

steady;
check;

%% Simulate each shock seperately:
shocks;
    var epszi; periods 1; values 100;
end;

simul( periods=400 );

if ~nograph==1
figure_per_shock=floor((M_.endo_nbr-1)/9)+1;
for i=1:M_.endo_nbr
    VarName = strtrim( M_.endo_names(i,:) );
    j=floor((i-1)/9)+1;
    p=i-(j-1)*9;
    figure( figure_per_shock*(1-1)+j );
    subplot(3,3,p)
    plot( oo_.endo_simul(i,1:20) );
    title( VarName );
    if p==1
        legend('epszi')
    end
end
end

for i=1:M_.endo_nbr
    VarName = strtrim( M_.endo_names(i,:) );
    eval(['irfs.',VarName,'.epszi = oo_.endo_simul(',num2str(i),',2:end);']);
    eval(['IRFoffset.',VarName,'.epszi = oo_.steady_state(',num2str(i),',:);']);
end

shocks;
    var epszp; periods 1; values 100;
end;

simul( periods=400 );

if ~nograph==1
for i=1:M_.endo_nbr
    VarName = strtrim( M_.endo_names(i,:) );
    j=floor((i-1)/9)+1;
    p=i-(j-1)*9;
    figure( figure_per_shock*(2-1)+j );
    subplot(3,3,p)
    plot( oo_.endo_simul(i,1:20) );
    title( VarName );
    if p==1
        legend('epszp')
    end
end
end

for i=1:M_.endo_nbr
    VarName = strtrim( M_.endo_names(i,:) );
    eval(['irfs.',VarName,'.epszp = oo_.endo_simul(',num2str(i),',2:end);']);
    eval(['IRFoffset.',VarName,'.epszp = oo_.steady_state(',num2str(i),',:);']);
end

shocks;
    var epsq; periods 1; values 100;
end;

simul( periods=400 );

for i=1:M_.endo_nbr
    VarName = strtrim( M_.endo_names(i,:) );
    j=floor((i-1)/9)+1;
    p=i-(j-1)*9;
    figure( figure_per_shock*(3-1)+j );
    subplot(3,3,p)
    plot( oo_.endo_simul(i,1:20) );
    title( VarName );
    if p==1
        legend('epsq')
    end
end

for i=1:M_.endo_nbr
    VarName = strtrim( M_.endo_names(i,:) );
    eval(['irfs.',VarName,'.epsq = oo_.endo_simul(',num2str(i),',2:end);']);
    eval(['IRFoffset.',VarName,'.epsq = oo_.steady_state(',num2str(i),',:);']);
end
