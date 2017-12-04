%In class 21

%GB comments
1 40 Script fails and there is not discussion on the results as the question asks. 
2 70 Same problems with the script but won’t take off for it here since it reoccurs from the previous question. Though your discussion is incorrect and doesn’t accurately describe the relationship between parameters. Expected a more detailed explanation in how the behavior of the overall system changes as parameters were changed relative to one another. 
Overall 55


% 1. Consider the system we discussed in class for a gene which is produced
% and degraded: dx/dt = k - d*x. Now consider that this gene turns on a
% second gene y, which also degrades so that its equation is 
% dy/dt = k2*x - d2*y. Choose some values for k,d,k2, and d2 and run a
% numerical simulation of this system for the case where both genes start
% out off ( x(0) = 0 and y(0) = 0). Plot the value of x and y in time and 
% explain your results. 

dt = 0.01;
interval = [0, 10];
nstep = (interval(2)-interval(1))/dt;
sol1(1) = 0;
sol2(1) = 0;
for ii = 2:nstep
    sol1(ii) = sol1(ii-1) + rhs(sol1(ii-1))*dt;
    sol2(ii) = sol2(ii-1) + rhs2(sol1(ii-1),sol2(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
figure;
plot(tt,sol1);hold on;
plot(tt,sol2);
legend({'x gene','y gene'},'FontSize',20);



% 2. Consider the following model: 
% dx/dt = y
% dy/dt = (1-x^2)*y - x
% write code that simulates this system for several different starting
% values of x and y. Plot the results and comment on them. 

dt = 0.01;
interval = [0, 10];
nstep = (interval(2)-interval(1))/dt;
sol3(1) = 0;
sol4(1) = 0;
for ii = 2:nstep
    sol3(ii) = sol3(ii-1) + rhsx(sol4(ii-1))*dt;
    sol4(ii) = sol4(ii-1) + rhsy(sol3(ii-1),sol3(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
figure;
plot(tt,sol3);hold on;
plot(tt,sol4);
legend({'x0','y0'},'FontSize',20);

dt = 0.01;
interval = [0, 10];
nstep = (interval(2)-interval(1))/dt;
sol3(1) = 1;
sol4(1) = 0;
for ii = 2:nstep
    sol3(ii) = sol3(ii-1) + rhsx(sol4(ii-1))*dt;
    sol4(ii) = sol4(ii-1) + rhsy(sol3(ii-1),sol3(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
figure;
plot(tt,sol3);hold on;
plot(tt,sol4);
legend({'x1','y0'},'FontSize',20);

dt = 0.01;
interval = [0, 10];
nstep = (interval(2)-interval(1))/dt;
sol3(1) = 0;
sol4(1) = 1;
for ii = 2:nstep
    sol3(ii) = sol3(ii-1) + rhsx(sol4(ii-1))*dt;
    sol4(ii) = sol4(ii-1) + rhsy(sol3(ii-1),sol3(ii-1))*dt;
end
tt = linspace(interval(1),interval(2),nstep);
figure;
plot(tt,sol3);hold on;
plot(tt,sol4);
legend({'x0','y1'},'FontSize',20);

% Comment: It seems that x would change after y changes. When y increase, x
% would increase later, which may indicate there is a balance between x and
% y, or one is controling the other. 

function dx = rhs(x)
dx = 1-x;
end
function dy = rhs2(x,y)
dy = x-y;
end
function dx = rhsx(y)
dx = y;
end
function dy = rhsy(x,y)
dy = (1-x^2)*y-x;
end

