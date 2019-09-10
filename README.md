# OBC example code
Example code to solve DSGE models with occasionally binding constraints.
This accompanies the paper "Occasionally Binding Constraints in Large Models: A Practical Guide to Solution Methods"

The repo contains the following directories
### functions
Includes additional matlab functions and toolkits required to run the code

### Model 1 - *SOE model with borrowing constraint, fixed interest rate*
Code to solve, simulate, report moments and display impulse response functions:
- using projection methods
- using piecewise-linear approach (occbin)
- with regime switching (RISE)
- with perfect foresight
- using extended-path
- using news shocks (dynareOBC)

### Model 2 - *borrower-saver (patient/impatient) model with housing and collateral constraint*
Code to solve, simulate and display impulse response functions:
- with perfect foresight
- using news shocks (dynareOBC)

### Model 3 - *NK model (Boneva, Braun & Waki (JME, 2016))*
Code to solve, simulate and display impulse response functions using news shocks (dynareOBC)

### Model 4 - *NK model (Fernández-Villaverde, Gordon, Guerrón-Quintana & Rubio-Ramírez (JEDC, 2015))*
Code to solve, simulate and display impulse response functions using news shocks (dynareOBC) and analyse properties of news shocks

### Other NK models
Code to analyse multiple equilibria using dynareOBC with the following models:
- Brendan, Paustian & Yates (2013)
- Smets & Wouters (2003)
- Smets & Wouters (2007)
