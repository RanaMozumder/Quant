%% Box 7.1
% Use the RK-4 method to solve the HIV dynamics problem.

clear all
% Variables
y0(1) = 10;     % initial value of T*
y0(2) = 100;    % initial value of V1
y0(3) = 0;      % initial value of Vx
tf = 5;         % interval size (day)
h = 0.1;        % step size (day)

% Call ODE Solver
[t, y] = RK4methodvectorized('HIVODE', tf, y0, h);

% Plot Results
figure;
subplot(1,3,1)
plot(t,y(1,:),'k-','LineWidth',2)
set(gca,'FontSize',16,'LineWidth',2)
xlabel('{\itt} in day')
ylabel('{\itT}^* infected cells/ \muL')

subplot(1,3,2)
plot(t,y(2,:),'k-','LineWidth',2)
set(gca,'FontSize',16,'LineWidth',2)
xlabel('{\itt} in day')
ylabel('{\itV}_1 virions/ \muL')

subplot(1,3,3)
plot(t,y(3,:),'k-','LineWidth',2)
set(gca,'FontSize',16,'LineWidth',2)
xlabel('{\itt} in day')
ylabel('{\itV}_X noninfectious virus particles/ \muL')
