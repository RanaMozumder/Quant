function parabolicinterpolation(func, ab, tolx)
% The successive parabolic interpolation method is used to find the
% minimum of a unimodal function.

% Input variables
% func: nonlinear function to be minimized
% ab  : bracketing interval [a, b]
% tolx: tolerance in estimating the minimum

% Other variables
k = 0; % counter

% Set of three points to construct the parabola
x0 = ab(1);
x2 = ab(2);
x1 = (x0 + x2)/2;

% Function values at the three points
fx0 = feval(func, x0);
fx1 = feval(func, x1);
fx2 = feval(func, x2);

% Iterative solution
while (x2 - x0) > tolx % (x2 – x0) is always positive
    % Calculate minimum point of parabola
    numerator = (x2^2 - x1^2)*fx0 - (x2^2 - x0^2)*fx1 + ...
        (x1^2 - x0^2)*fx2;
    denominator = 2*((x2 - x1)*fx0 - (x2 - x0)*fx1 + (x1 - x0)*fx2);
    xmin = numerator/denominator;
    
    % Function value at xmin
    fxmin = feval(func, xmin);
    
    % Select the next set of three points to construct new parabola
    if xmin < x1
        if fxmin < fx1
            x2 = x1;
            fx2 = fx1;
            x1 = xmin;
            fx1 = fxmin;
        else
            x0 = xmin;
            fx0 = fxmin;
        end
    else
        if fxmin < fx1
            x0 = x1;
            fx0 = fx1;
            x1 = xmin;
            fx1 = fxmin;
        else
            x2 = xmin;
            fx2 = fxmin;
        end
    end
    k = k + 1;
end
fprintf('x0 = %7.6f x2 = %7.6f f(x0) = %7.6f f(x2) = %7.6f \n', ...
    x0, x2, fx0, fx2)
fprintf('x_min = %7.6f f(x_min) = %7.6f \n',xmin, fxmin)
fprintf('number of iterations = %2d \n', k)