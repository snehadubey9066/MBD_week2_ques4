% % For a 1-radian step reference, the design criteria are given are the following.
% % Settling time less than 0.040 seconds
% % Overshoot less than 16%
% % No steady-state error, even in the presence of a step disturbance input

%% Uncomment this area to see if the settling time and overshoot is under
%% control

% J = 3.2284E-6;
% b = 3.5077E-6;
% K = 0.0274;
% Ke = 0.0274854;
% R = 4;
% L = 2.75E-6;
% 
% s = tf('s');
% P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));
%  
% Kp = 21;
% Ki = 505;
% Kd = 0.15;
% N = 1210;
% C = Kp+Ki/s+Kd*N/(1+N/s);
% 
% sys_cl = feedback(C*P_motor,1);
% t = 0:0.001:0.07;
% step(sys_cl,t)
% grid
% 
% SettlingTime_seconds = stepinfo(sys_cl).SettlingTime
% Overshoot_percent = stepinfo(sys_cl).Overshoot

%% Uncomment this to run the simulation

sim("W2ques4_system.slx",0.07);
open_system('W2ques4_system')
open_system('W2ques4_system/Scope')