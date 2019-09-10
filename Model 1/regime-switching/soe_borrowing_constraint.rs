%% SOE model with borrowing constraint
% For the course "Occasionally Binding Constraints in DSGE Models"
% Jonathan Swarbrick, 2019

endogenous c h b muu z

exogenous epsz

parameters betta R delta rho chi siggma b_limit theta_1_2 theta_2_1 pssi

parameters(borrcon,2) conflag

model

    ! borrcon_tp_1_2 = theta_1_2/(theta_1_2+exp(pssi*(b-b_limit)));
    ! borrcon_tp_2_1 = theta_2_1/(theta_2_1+exp(pssi*muu));

    c = ( exp( z ) + R * b{-1} -  b ) / ( 1 + chi );
    h = 1 - chi * c / exp(z);
    1/c = 1/c{+1} + muu - delta * b;
    z = rho * z{-1} + siggma * epsz;
    (1-conflag) * muu + conflag * (b-b_limit) = 0;

    ? muu>=0;
    ? b-b_limit>=0;

steady_state_model

    z = 0;
    b = conflag * b_limit / ((1-conflag) * delta + conflag );
    muu = delta * b;
    c = ( 1 + (R-1) * b ) / ( 1 + chi );
    h = 1 - chi * c;

parameterization

    betta, 0.99;
    R, 1/0.99;
    delta, 0.01;
    rho, 0.9;
    chi, 0.5;
    siggma, 0.01;
    b_limit, -0.01;
	conflag(borrcon,1),0;
	conflag(borrcon,2),1;
	pssi, 40;
	theta_1_2, 5;
	theta_2_1, 5;
