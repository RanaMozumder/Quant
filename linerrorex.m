%Tossing a lead weight: example of linear regression error 

%matrix of modeling functions: first column of ones, second column = t,
%third column = -0.5*t^2 (data is modeled by h = h0 +V0*t +0.5g*t^2).
%We shall denote our model by the vector equation A*x=b
A=[ones(1,5);0:4;-0.5*(0:4).^2]'
%height measurements in meters
h=[0.3 14.8 20.7 15.9 2]'
K=inv(A'*A)*A'
% our modeling parameters, (h0,V0,g)
x=K*h
%variance in data
Shsq=sum((h-A*x).^2)/(5-3)
%variance in first modeling parameter, for demonstration only.
%other variances and covariances can be extracted from the symmetric SIGMAxsq.
Sx1sq=K(1,:)*K(1,:)'*Shsq
%SIGMAbsq: matrix of covariance of the observations b.
%If the observations are independent then SIGMAbsq will be diagonal only.
%We further assume that all observations have the same variance.
%(a common assumption)
SIGMAbsq=eye(5)*Shsq
%matrix of covariance of the regression parameters
SIGMAxsq=K*SIGMAbsq*K'
%Suppose we wish to determine the model value at 100 points ranging from 0 to 4.
%Thus, we now have the vector equation: bm = Am*x
Am=[ones(1,100);linspace(0,4,100);-0.5*linspace(0,4,100).^2]';
%Finally, we have the matrix of covariance of bm.
%In general, only the diagonal elements of SIGMAbmsq are of interest.
sigmabmsq=diag(Am*SIGMAxsq*Am');
plot(A(:,2),h,'o',Am(:,2),Am*x)
hold on
plot(Am(:,2),Am*x+sqrt(sigmabmsq),'r--',Am(:,2),Am*x-sqrt(sigmabmsq),'r--')
hold off
legend('data','best-fit model','68% confidence (1\sigma) interval')
xlabel('t  (sec)')
ylabel('h  (m)')
