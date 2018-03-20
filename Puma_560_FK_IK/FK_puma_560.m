% Author: Sanjuksha Nirgude
clc; 
% Input D-H parameters
% alpha or link twist = b
b = [0 -pi/2 0 -pi/2 pi/2 -pi/2]

% Link length = ai
a = [0 0 432 20 0 0]

% Joint angle = theta = t(i)
t = [0 pi/2 pi/2 -pi/4 0 -pi]

% Origin = o. We use it to multiply with the final matrix to get a 1x4
% dimension result
o = [0;0;0;1]

% Link offset = d
d = [0 0 150 433 0 0]
% H is an identity matrix used to start the repeated multiplication of the transformation matrices 
H = eye(4);

for i = 1:6
   % M is the transformation matrix
   % Here in this for loop we get value of M for each theta and the we
   % multiply the values to each other such as M = M1*M2*M3*M4*M5*M6 to
   % get final value of M
   M = [cos(t(i)) -sin(t(i)) 0 a(i); sin(t(i))*cos(b(i)) cos(t(i))*cos(b(i)) -sin(b(i)) -sin(b(i))*d(i); sin(t(i))*sin(b(i)) cos(t(i))*sin(b(i)) cos(b(i)) cos(b(i))*d(i); 0 0 0 1];
   % The values used in the above matrix are used from the standard D-H parameter's matrix 
   H = H * M;
end
disp(H)
EE_Position = H*o

Px = EE_Position(1)
Py = EE_Position(2)
Pz = EE_Position(3)


