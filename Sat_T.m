function f = Sat_T(x)
    
%Variables
%x=temperature in Kelvin
%Sow=Saturation of oxygen in water

%converting the temperature from degree celcius to Kelvin
x=x+273.15;

%determining higher orders of temperature
x2 = x^2;
x3 = x^3;
x4 = x^4;

Sow = 14;%need to change the value to 10 and 14 for other two cases

%function 
f = -139.34411 + 1.575701*1e5/x -6.642308*1e7/x2 + 1.243800*1e10/x3 ...
    -8.621949*1e11/x4 -log(Sow);