%% Box 7.2
% Use ode45 to solve the enzyme deactivation problem.

clear all
% Variables
y0(1) = 0.05; % M
y0(2) = 1e-6; % units
tf = 3600; % s

% Call ODE Solver
[t, y] = ode45('enzymedeact', tf, y0);

% Plot Results
figure;
subplot(1,2,1)
plot(t,y(:,1),'k-','LineWidth',2)
set(gca,'FontSize',16,'LineWidth',2)
xlabel('{\itt} in sec')
ylabel('{\itS} in M')

subplot(1,2,2)
plot(t,y(:,2),'k-','LineWidth',2)
set(gca,'FontSize',16,'LineWidth',2)
xlabel('{\itt} in sec')
ylabel('{\itE}_t_o_t_a_l in units')
