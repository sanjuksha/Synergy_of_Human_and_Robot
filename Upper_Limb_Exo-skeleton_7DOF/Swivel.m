
% Author : Sanjuksha Nirgude
function phi = Swivel(Pe,Ps,Pw)
    % Loading the given arm motion data
    load 'Pe_sub1_Session1_Trial01.mat'
    load 'Ps_sub1_Session1_Trial01.mat'
    load 'Pw_sub1_Session1_Trial01.mat'

    % Direction of vector 
    P = sqrt((Pw(:,1)-Ps(:,1)).^2 + (Pw(:,2)-Ps(:,2)).^2 + (Pw(:,3)-Ps(:,3)).^2);
    n = (Pw-Ps)./ [P P P];
    % To find vector direction of PcPe
    f = (Pe-Ps);
    C = dot(f,n,2);
    B = [C C C].*n;
    % f_prime is the vector direction of PcPe
    f_prime = f - B;
    PcPe = Pe - f_prime;
    
     % a is the refernce direction
     a = zeros(167,3);
    a(:,3)=-1;
    D = dot(a,n,2);
    E = D.*n;
    L = sqrt((E(:,1)-a(:,1)).^2 + (E(:,2)-a(:,2)).^2 + (E(:,3)-a(:,3)).^2);
    u = (a - E)./[L L L];
    % Swivel angle is phi
    T=cross(f_prime,u);
    Y=dot(f_prime,u,2);
    H=dot(n,T,2);
 
    phi = atan2d(H,Y);
 
    disp(phi)
 
end
 
 
 
 