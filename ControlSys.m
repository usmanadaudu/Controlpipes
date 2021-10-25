clc; clear;
[t, q] = ode45(@ControlPipes,[0,6],[0 0 1 1]);

lamda1 = pi;
lamda2 = 2*pi;
XiA = [0.353 0.488 0.647];

Phi1 = sqrt(2)*sin(lamda1*XiA);
Phi2 = sqrt(2)*sin(lamda2*XiA);
Phi = [Phi1; Phi2];

Eta = q(:,1)*Phi1+q(:,2)*Phi2;
subplot(3,1,1)
plot(t,q(:,1))
title('Plot of q1')
subplot(3,1,2)
plot(t,q(:,2))
title('Plot of q2')
subplot(3,1,3)
plot(t,Eta)
title('Plot of Eta using [0 0 1 1]')