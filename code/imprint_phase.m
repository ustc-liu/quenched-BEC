% imprint vortex
clear
groundstate
[X,Y] = meshgrid(x_1,y_1);
phi0 = phi0real_1 + 1i*phi0imag_1;
phi1 = phi1real_1 + 1i*phi1imag_1;
R = 99;
% healing length, also the radius of vortices core
xi = 2;
Np = 897;
Nm = 897;
for ind = 1:Np
    % position
    theta = 2*pi*rand;
    r = sqrt(rand)*R;
    a = cos(theta)*r;
    b = sin(theta)*r;
    % vorticity
    s1 = 1;

    
    f1 = 1-exp(-sqrt((X-a).^2+(Y-b).^2)/xi);

    theta1 = s1*atan2(X-a,Y-b);

    phi0 = exp(1i*theta1).*f1.*phi0;
    phi1 = exp(1i*theta1).*f1.*phi1;
end

for ind = 1:Nm
    % position
    theta = 2*pi*rand;
    r = rand*R;
    a = cos(theta)*r;
    b = sin(theta)*r;
    % vorticity
    s1 = -1;
    f1 = 1-exp(-sqrt((X-a).^2+(Y-b).^2)/xi);

    theta1 = s1*atan2(X-a,Y-b);

    phi0 = exp(1i*theta1).*f1.*phi0;
    phi1 = exp(1i*theta1).*f1.*phi1;
end

phi0_new_real = real(phi0);
phi0_new_imag = imag(phi0);
phi1_new_real = real(phi1);
phi1_new_imag = imag(phi1);

h5write('groundstate.h5','/1/phi0imag',phi0_new_imag)
h5write('groundstate.h5','/1/phi0real',phi0_new_real)
h5write('groundstate.h5','/1/phi1imag',phi1_new_imag)
h5write('groundstate.h5','/1/phi1real',phi1_new_real)