clc; close all; clear all;
global t x
t = [0 0.3 0.6 0.9 1.2 1.5 1.8 2.1];
x = [0.981 1.01 1.12 1.13 2.98 2.58 3.1 5.89];

paramsopt = fminsearch('piecewisefunc', [3 -1.7 1]);




% t_= [0.9 1.2 1.5 1.8 2.1];
% x_= [1.13 2.98 2.58 3.1 5.89];
% c = polyfit(t_, x_,1);
% x_bar = polyval(c,t_);

plot(t,x,'o', t, paramsopt(1)*t+ paramsopt(2));
hold on 
line([0 0.8468], [3.2134*0.8468-1.6841 3.2134*0.8468-1.6841])









