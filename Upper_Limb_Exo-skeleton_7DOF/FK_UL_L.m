% Author: Sanjuksha Nirgude

% FK_UL_Left_arm
clc; 
% Input D-H parameters
% alpha or link twist = b
b = [pi/2 pi/2 pi/2 pi/2 -pi/2 -pi/2 pi/2]

% Link length = ai
a = [0 0 0 0 0 0 0]

% Joint angle = theta = t(i)
t1 = input('t1 = ');
t2 = input('t2 = ');
t3 = input('t3 = ');
t4 = input('t4 = ');
t5 = input('t5 = ');
t6 = input('t6 = ');
t7 = input('t7 = ');


t = [t1+pi-(pi*(32.94/180))  t2+(pi/2)-(pi*(28.54/180)) t3+pi-(pi*(53.6/180)) t4 t5-pi/2 t6+(pi/2) t7+pi ];


% Origin = o. We use it to multiply with the final matrix to get a 1x4
% dimension result
o = [0;0;0;1]

% Link offset = d
d = [0 0 0 0.2 0.25 0 0]
% H is an identity matrix used to start the repeated multiplication of the transformation matrices 
H = eye(4);

for i = 1:7
   % M is the transformation matrix
   % Here in this for loop we get value of M for each theta and the we
   % multiply the values to each other such as M = M1*M2*M3*M4*M5*M6 to
   % get final value of M
   % N = T base
   N = [0 -0.7071 0.7071 0; -0.6756 -0.5213 -0.5213 0; 0.7373 -0.4777 -0.4777 0; 0 0 0 1]
   M = [cos(t(i)) -sin(t(i)) 0 a(i); sin(t(i))*cos(b(i)) cos(t(i))*cos(b(i)) -sin(b(i)) -sin(b(i))*d(i); sin(t(i))*sin(b(i)) cos(t(i))*sin(b(i)) cos(b(i)) cos(b(i))*d(i); 0 0 0 1];
   % The values used in the above matrix are used from the standard D-H parameter's matrix 
   S = N*M;
   H = H * S;
end
disp(H)
EE_Position = H*o

Px = EE_Position(1)
Py = EE_Position(2)
Pz = EE_Position(3)

