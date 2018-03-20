%Taking T06 as input

px= input('Px = ');
py= input('Py = ');
pz= input('Pz = ');
r11= input('r11 = ');
r12= input('r12 = ');
r13= input('r13 = ');
r21= input('r21 = ');
r22= input('r22 = ');
r23= input('r23 = ');
r31= input('r31 = ');
r32= input('r32 = ');
r33= input('r33 = ');
T06 = [r11 r12 r13 px; r21 r22 r23 py; r31 r32 r33 pz; 0 0 0 1]

a1 = 0;
a2 = 0;
a3 = 432;
a4 = 20;
a5 = 0;
a6 = 0;

d1 = 0;
d2 = 0;
d3 = 150;
d4 = 433;
d5 = 0;
d6 = 0;

o  = (px)^2+(py)^2;
y1 = d3/sqrt(o);
x1 = sqrt(1 - ((d3^2)/(o)));
x1 = [x1 -x1];
th1 =(atan2(py,px)- atan2(y1,x1));
th1 = (th1(2))
c1 = cos(th1);
s1 = sin(th1);

k  = (px^2 + py^2 + pz^2 - a3^2 -a2^2 -d4^2 -d3^2)/2*a2;
l = sqrt((a3)^2 +(d4)^2 - k^2);
l =[l -l];
th3 = (atan2(a3,d4)- atan2(k,l));
th3 =(2)
c3 = cos(th3);
s3 = sin(th3);

q   = ((-a3)*pz )+(((c1*px)+(s1*py))*(-d4));
w   = ((-d4)*pz) - ((a3)*(c1*px + s1*py));
th23 = atan2(w,q)
th2  =(th23-th3);
c2 = cos(th2);
s2 = sin(th2);

T01 = [c1 -s1 0 0;s1 c1 0 0;0 0 1 0;0 0 0 1];
T12 = [c2 -s2 0 0; 0 0 1 0; -s2 -c2 0 0; 0 0 0 1];
T23 = [c3 -s3 0 a2; s3 c3 0 0; 0 0 1 d3; 0 0 0 1];
T34 = [c4 -s4 0 a3; 0 0 1 d4; -s4 -c4 0 0; 0 0 0 1];
T45 = [c5 -s5 0 0; 0 0 -1 0; s5 c5 0 0; 0 0 0 1];
T56 = [c6 -s6 0 0; 0 0 -1 0; s5 c5 0 0; 0 0 0 1];
T13 = T12 * T23;
T04 = T01 * T13 * T34;
T05 = T04 * T45;
T03 = T01 * T13;
T46 = T45 * T56;
T36 = T34 * T46;

T16 = T13 * T36;

% Finding theta_4
M   = inv(T03)*(T06);
c23 = c2*c3 - s2*s3;
s23 = c2*s3 + s2*c3;
x4  = -M(1,3)*c1*c23 - M(2,3)*s1*c23 + M(3,3)*s23; 
y4  = -M(1,3)*s1 + M(2,3)* c1;

th4 = rad2deg(atan2(y4,x4));
c4 = cos(th4);
s4 = sin(th4);
% Finding theta_5 
N = inv(T04)*(T06);
j = -N(1,3)*(c1*c23*c4 + s1*s4)- N(2,3)*(s1*c23*c4-s4*c1)+N(3,3)*s23*c4;
g = N(1,3)* (-c1*s23)+N(2,3)*(-s1*s23)+N(3,3)*(-c23);
th5 =rad2deg(atan2(j,g));
c5 = cos(th5);
s5 = sin(th5);

%Finding theta_6
U = inv(T05)*T06;
j1 = -U(1,1)*(c1*c23*s4 - s1*c4)- U(2,1)*(s1*c23*s4 + c1*c4)+ N(3,1)*(s23*s4);
g1 = U(1,1)*((c1*c23*c4 + s1*s4)*c5 - c1*s23*s5)+ U(2,1)* ((s1*c23*c4-c1*s4)*c5 - s1*s23*s5)-U(3,1)*(s23*c4*c5 + c23*s5);
th6 = atan2(j1,g1);
c6 = cos(th6);
s6 = sin(th6);


fprintf('Theta_1 = %f ',th1)
fprintf('\nTheta_2 = %f',th2)
fprintf('\nTheta_3 = %f',th3)
fprintf('\nTheta_4 = %f',th4)
fprintf('\nTheta_5 = %f',th5)
fprintf('\nTheta_6 = %f',th6)

