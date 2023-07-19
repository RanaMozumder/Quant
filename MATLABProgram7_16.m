%% Box 7.5
% Use the shooting method to solve the controlled drug delivery 
% problem
clear all

% Variables
maxloops = 50; % maximum number of iterations allowed
L = 10; % length of interval (cm)
y0(3) = 0; % initial time (s)

% First guess for initial condition
a0_1 = 1.2; % radius of particle (um)
y0(1)= a0_1;
y0(2) = 0.016*a0_1^2; % velocity (cm/s)

% Call ODE Solver: First guess
[x, y] = ode15s('drugdelivery', L, y0);
y1(1) = y(end,1); % End-point value for y1

% Second guess for initial condition
a0_2 = 1.3; % radius of particle (um)
y0(1) = a0_2;
y0(2) = 0.016*a0_2^2; % velocity (cm/s)

% Call ODE Solver: Second guess
[x, y] = ode15s('drugdelivery', L, y0);
y1(2) = y(end,1); % End-point value for y1

% Use secant method to find correct initial condition
for i = 1:maxloops
    % Secant Equation
    a0_3 = a0_2 - (a0_2 - a0_1)*(y1(2)-a0_2*0.464)/ ...
        ((y1(2) - a0_2*0.464) - (y1(1) - a0_1*0.464));
    % New guess for initial condition
    y0(1) = a0_3;
    y0(2) = 0.016*a0_3^2; % velocity (cm/s)
    % Solving system of ODEs for improved value of initial condition
    [x, y] = ode15s('drugdelivery', L, y0);
    y1(3) = y(end,1);
    % Check if final value satisfies boundary condition
    if abs(y1(3) - a0_3*0.464) < a0_3*0.001 % tolerance criteria
        break
    end
    a0_1 = a0_2;
    a0_2 = a0_3;
    y1(1) = y1(2);
    y1(2) = y1(3);
end