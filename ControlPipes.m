function d2q = ControlPipes(t,q)
%%
lamda1 = pi;
lamda2 = 2*pi;
XiA = [0.353 0.488 0.647];
%%
Phi1 = sqrt(2)*sin(lamda1*XiA);
Phi2 = sqrt(2)*sin(lamda2*XiA);
Phi = [Phi1; Phi2];
%%
b = 8/3;
c11 = -pi^2;
c22 = -4*pi^2;
e = 40/9;
%%
Miu = 0.01;
Om = 161;
Tau = 52;
Gbar = 0.42;
AlphaB = 1;
Beta = 0.79;
%%
u0 = 1;
Alpha = 0.01;
dXi = 0.1;
T = 0;
Mr = 0.45;
%%
A = [Alpha*lamda1^4 -Mr*u0; 2*Mr*u0*b Alpha*lamda2^4];
B = [(u0^2-T-1/2*Gbar)*c11+lamda1^4 Gbar*e; ...
    Gbar*e (u0^2-T-1/2*Gbar)*c22+lamda2^4];
C = [1/2*c11 -b-e; b-e 1/2*c22];
D = [2*u0^2*c11 0; 0 2*u0^2*c22];
E = [0 -2*Mr*u0*b; 2*Mr*u0*b 0];
%%
d2q = zeros(4,1);
d2q(1) = q(3);
d2q(2) = q(4);
d2q(3:4) = -A*[q(3); q(4)]-B*[q(1); q(2)] ...
    +Miu*C*[q(1); q(2)]*Om*sin(Om*Tau)-(D*[q(1); q(2)]+E*[q(3); q(4)]);