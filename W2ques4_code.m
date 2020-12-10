% % For a 1-radian step reference, the design criteria are given are the following.
% % Settling time less than 0.040 seconds
% % Overshoot less than 16%
% % No steady-state error, even in the presence of a step disturbance input


J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
R = 4;
L = 2.75E-6;

s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));

t = 0:0.001:0.2;
step(P_motor,t)
sys_cl = feedback(P_motor,1);
step(sys_cl,t)

% [Wn,zeta,poles] = damp(sys_cl);
% Mp = exp((-zeta(1)*pi)/sqrt(1-zeta(1)^2))
% Ts = 4/(zeta(1)*Wn(1))