function [f, J] = FahraeusLindquistExample(x)
% Calculation of f1 and f2 and Jacobian matrix for Box 5.4

% Input Variables
hcore = x(1); % Core region hematocrit
sigma = x(2); % 1 - delta/R
 
% Output Variables
f = zeros(2,1); % function column vector [f1;f2](should not be a row vector)
J = zeros(2,2); % Jacobian 2x2 matrix 

% Constants
hfeed = 0.44;       % hematocrit of the feed vessel or large artery
temp = 310;         % kelvin : temperature of system
viscratio = 0.69;   % ratio of apparent viscosity in small vessel 
                    % to that of feed vessel
   
% Calculating variables
sigma2 = sigma^2;
sigma3 = sigma^3;
sigma4 = sigma^4;
alphafeed = 0.070*exp(2.49*hfeed + (1107/temp)*exp(-1.69*hfeed)); 
alphacore = 0.070*exp(2.49*hcore + (1107/temp)*exp(-1.69*hcore));
f1denominator =2*(1-sigma2)+sigma2*(1-alphacore*hcore);
f2denominator = 1 - sigma4*alphacore*hcore;

% Evaluating the function f1 and f2
% Equation 5.41
f(1) = 1+ ((1-sigma2)^2)/sigma2/f1denominator - hcore/hfeed;

% Equation 5.42
f(2) = (1 - alphafeed*hfeed)/f2denominator - viscratio; 

% Evaluating the Jacobian Matrix
% J(1,1) = df1/dhcore
J(1,1) = ((1-sigma2)^2)*alphacore;
J(1,1) = J(1,1)/(f1denominator^2);
J(1,1) = J(1,1)*...
    (1 + hcore*(2.49 - 1870.83/temp*exp(-1.69*hcore))) - 1/hfeed;

% J(1,2) = df1/dsigma
J(1,2) = 4*(sigma2 - 1)/sigma/f1denominator;
J(1,2) = J(1,2)-4*(1-sigma2)^2*(1-sigma2*(1-alphacore*hcore))/ ...
    sigma3/f1denominator^2;

% J(2,1) = df2/dhcore
J(2,1) = sigma4*(1-alphafeed*hfeed)*alphacore/f2denominator^2;
J(2,1) = J(2,1)*(1 + hcore*(2.49 - 1870.83/temp*exp(-1.69*hcore)));

% J(2,2) = df2/dsigma
J(2,2) = 4*sigma3*(1-alphafeed*hfeed)*alphacore*hcore;
J(2,2) = J(2,2)/f2denominator^2;