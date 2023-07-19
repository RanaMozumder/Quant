% Use the RK-4 method to solve the bacterial population dynamics problem.

% Variables
y0(1) = 1e-05;     % initial value of Co2 in g/L
y0(2) = 1.6;       % initial value of S in g/L
y0(3) = 0.672;     % initial value of x1 in g/L
y0(4) = 0.028;     % initial value of x2 in g/L
tf = 72;           % interval size (hour)
h = 0.01;          % step size (hour), 0.1, 0.01, 0.001 all were evaluated

% Call ODE Solver
% uncomment any one of these to execute that method
% [t, y] = RK4methodvectorized('bacterialpopulationdynamics', tf, y0, h);
% [t, y] = ode113('bacterialpopulationdynamics', tf, y0);
% [t, y] = ode23tb('bacterialpopulationdynamics', tf, y0);
%[t, y] = eulerforwardmethodvectorized('bacterialpopulationdynamics', tf, y0, h);



% Plot Results
figure;
subplot(2,2,1)
plot(t,y(1,:),'k-','LineWidth',2)
set(gca,'FontSize',12,'LineWidth',2)
xlabel('{\itt} in hour')
ylabel('{\itO}_2 concentration in g/L')

subplot(2,2,2)
plot(t,y(2,:),'k-','LineWidth',2)
set(gca,'FontSize',12,'LineWidth',2)
xlabel('{\itt} in hour')
ylabel('Methanol concentration, {\itS} in g/L')

subplot(2,2,3)
plot(t,y(3,:),'k-','LineWidth',2)
set(gca,'FontSize',12,'LineWidth',2)
xlabel('{\itt} in hour')
ylabel('Population Mass of Pseudomonas, {\itx}_1 in g/L')

subplot(2,2,4)
plot(t,y(4,:),'k-','LineWidth',2)
set(gca,'FontSize',12,'LineWidth',2)
xlabel('{\itt} in hour')
ylabel('Population Mass of Hyphomicrobium, {\itx}_2 in g/L')



%%%%
% % Plot Results
% figure;
% subplot(2,2,1)
% plot(t,y(:, 1),'k-','LineWidth',2)
% set(gca,'FontSize',12,'LineWidth',2)
% xlabel('{\itt} in hour')
% ylabel('{\itO}_2 concentration in g/L')
% 
% subplot(2,2,2)
% plot(t,y(:, 2),'k-','LineWidth',2)
% set(gca,'FontSize',12,'LineWidth',2)
% xlabel('{\itt} in hour')
% ylabel('Methanol concentration, {\itS} in g/L')
% 
% subplot(2,2,3)
% plot(t,y(:, 3),'k-','LineWidth',2)
% set(gca,'FontSize',12,'LineWidth',2)
% xlabel('{\itt} in hour')
% ylabel('Population Mass of Pseudomonas, {\itx}_1 in g/L')
% 
% subplot(2,2,4)
% plot(t,y(:, 4),'k-','LineWidth',2)
% set(gca,'FontSize',12,'LineWidth',2)
% xlabel('{\itt} in hour')
% ylabel('Population Mass of Hyphomicrobium, {\itx}_2 in g/L')
