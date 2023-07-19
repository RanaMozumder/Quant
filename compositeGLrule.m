function I = compositeGLrule(integrandfunc, a, b, N)
% This function uses the composite 2-point Gauss-Legendre rule to 
% approximate the integral.

% Input variables
% integrandfunc : function that calculates the integrand
% a : lower limit of integration
% b : upper limit of integration
% N : number of subintervals

% Output variables
% I : value of integral

% Initializing
I = 0;

% 2-point Gauss-Legendre nodes and weights
z(1) = -0.5773502692; z(2) = 0.5773502692;
w(1) = 1.0; w(2) = 1.0;

% Width of subintervals
d = (b-a)/N;

% Mid-points of subintervals
xmid = [a + d/2:d:b - d/2];

% Quadrature calculations
for i = 1:N
    % Nodes in integration subinterval
    x = xmid(i) + z*d/2;
    % Function evaluations at node points
    y = feval(integrandfunc, x);
    % Integral approximation for subinterval i
    I = I + d/2*(w*y'); % term in bracket is a dot product
end 


