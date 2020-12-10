% % For a 1-radian step reference, the design criteria are given are the following.
% % Settling time less than 0.040 seconds
% % Overshoot less than 16%
% % No steady-state error, even in the presence of a step disturbance input

t = 0:0.001:0.2;
J = 3.2284E-6;
b = 3.5077E-6;
K = 0.0274;
Ke = 0.0274;
R = 4;
L = 2.75E-6;

s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));

Kp = 1;
Ki = 1;
Kd = 1;

C = pid(Kp,Ki,Kd);
sys_cl = feedback(C*P_motor,1);
Risetime_PID = stepinfo(sys_cl).RiseTime
OverShoot_PID = stepinfo(sys_cl).Overshoot

step(sys_cl,t)