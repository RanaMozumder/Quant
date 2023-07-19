function SSE = piecewisefunc(params)

global t x

slope = params(1);
intercept = params(2);
t0 = params(3);
SSE = 0;
for i=1:length(t)
    if t(i)>t0
        SSE = SSE + (x(i) - (slope*t(i) + intercept))^2;
    else
        SSE = SSE + (x(i) - (slope*t0 + intercept))^2;
    end
end