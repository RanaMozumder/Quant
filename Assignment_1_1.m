close all; clear all; clc;

%%% loading the data
Mass = [700 70 55 15 0.4];
Metabolism = [11760 1700 1450 720 30];

%%% taking the logarithm of each element
log_Mass = log(Mass);
log_Metabolism = log(Metabolism);

%%% creating the metrices for linear regression
A = [log_Mass; ones(1,5)]';
B = log_Metabolism';

%%% calculating the co-efficients of best fit line
c = inv(A'*A)*A'*B;

%%% plotting the results
plot(log_Mass, log_Metabolism, 'o', log_Mass, (A*c)');
grid
box off

%%%
% hold on
% c1 = polyfit(log_Mass, log_Metabolism, 1);
% y = polyval(c1, log_Mass);
% 
% plot(log_Mass, y, 'g');




%Logarithm of mass of the animal, m (kg)
%Logarithm of metabolism rate, M (kCal/day)
%Linear Regression for Animal's Metabolic Rate


