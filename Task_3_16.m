%Reaction Rate fitting problem

% R is the reaction rate in concentration/time;
% S is the substrate concentration;

%matrix of modeling functions: first column of ones, second column = 1/S,
%output is 1/R
%We shall denote our model by the vector equation A*x=b

%DOG data points for reaction rate with progesterone
A1=[ones(1,8); 1/5 1/10 1/20 1/25 1/30 1/40 1/50 1/60]';

%DOG data points for reaction rate with progesterone
A2=[ones(1,6); 1/5 1/10 1/25 1/30 1/40 1/60]';

%Reaction rates with progesterone
Y1=[1/3.25 1/2.4 1/5.1 1/6 1/7.2 1/7.7 1/9.1 1/9.05]';

%Reaction rates without progesterone
Y2=[1/2.4 1/3.75 1/4.05 1/5.4 1/6.5 1/7.8]';

%calculating K for both cases
K1=inv(A1'*A1)*A1';
K2=inv(A2'*A2)*A2';

%our modeling parameters, (1/Rmax, Km/Rmax)
%calculating modeling parameters for both cases
x1=K1*Y1;
x2=K2*Y2;

%variance in data
Shsq1=sum((Y1-A1*x1).^2)/(8-2);
Shsq2=sum((Y2-A2*x2).^2)/(6-2);

%variance in modeling parameter
Sx1sq1=K1(1,:)*K1(1,:)'*Shsq1;
Sx2sq1=K1(2,:)*K1(2,:)'*Shsq1;

Sx1sq2=K2(1,:)*K2(1,:)'*Shsq2;
Sx2sq2=K2(2,:)*K2(2,:)'*Shsq2;

%covariances
S1x1x2 = Shsq1*sum(K1(1,:).*K1(2,:));
S2x1x2 = Shsq2*sum(K2(1,:).*K2(2,:));

%Kms
Km1 = x1(2)/x1(1);
Km2 = x2(2)/x2(1);

%Rmaxs
Rmax1 = 1/x1(1);
Rmax2 = 1/x2(1);

%standard deviation for Rmax
SRmax1 = (Rmax1/x1(1))*sqrt(Sx1sq1);
SRmax2 = (Rmax2/x2(1))*sqrt(Sx1sq2);

%standard deviation for Km
Skm1 = Km1*sqrt(Sx1sq1/x1(1).^2 + Sx2sq1/x1(2).^2 - 2* S1x1x2/(x1(1)*x1(2))); 
Skm2 = Km2*sqrt(Sx1sq2/x2(1).^2 + Sx2sq2/x2(2).^2 - 2* S2x1x2/(x2(1)*x2(2))); 

%SIGMAbsq: matrix of covariance of the observations b.
%If the observations are independent then SIGMAbsq will be diagonal only.
%We further assume that all observations have the same variance.
%(a common assumption)
SIGMAbsq1=eye(8)*Shsq1;
SIGMAbsq2=eye(6)*Shsq2;

% %matrix of covariance of the regression parameters
SIGMAxsq1=K1*SIGMAbsq1*K1';
SIGMAxsq2=K2*SIGMAbsq2*K2';

%Suppose we wish to determine the model value at 100 points ranging from 0 to 4.
%Thus, we now have the vector equation: bm = Am*x
Am1=[ones(1,100);linspace(0.0167,0.2,100)]';
Am2=[ones(1,100);linspace(0.0167,0.2,100)]';

%Finally, we have the matrix of covariance of bm.
%In general, only the diagonal elements of SIGMAbmsq are of interest.
sigmabmsq1=diag(Am1*SIGMAxsq1*Am1');
sigmabmsq2=diag(Am2*SIGMAxsq2*Am2');

%plotting reaction rates with progesterone and corresponding best fit model
plot(A1(:,2),Y1,'ro',Am1(:,2),Am1*x1, 'r')
hold on

%plotting reaction rates without progesterone and corresponding best fit model
plot(A2(:,2),Y2,'gx',Am2(:,2),Am2*x2, 'g')
hold on

%plotting the 95% confidence curves
plot(Am1(:,2),Am1*x1+2*sqrt(sigmabmsq1),'r--',Am1(:,2),Am1*x1-2*sqrt(sigmabmsq1),'r--')
hold on
plot(Am2(:,2),Am2*x2+2*sqrt(sigmabmsq2),'g--',Am2(:,2),Am2*x2-2*sqrt(sigmabmsq2),'g--')
hold off
box off

legend('Data1(Reaction rate with progesterone)', 'best-fit model for Data 1', 'Data2(Reaction rate without progesterone)', ...
    'best-fit model for Data 2', '95% confidence line 1 (2\sigma) interval for Data1', ...
    '95% confidence line 2 (2\sigma) interval for Data1', '95% confidence line 1 (2\sigma) interval for Data2', ...
    '95% confidence line 2 (2\sigma) interval for Data2')
xlim([0 0.22])
xlabel('1/S  (per mM)')
ylabel('1/R  (nmol per (cells min))')


