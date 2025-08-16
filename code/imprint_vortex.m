% imprint vortex
clear
groundstate
[X,Y] = meshgrid(x_1,y_1);
phi = phireal_1 + 1i*phiimag_1;

% position
a1 = 0;
b1 = 0;

% vorticity
s1 = 1;


theta1 = s1*atan2(X-a1,Y-b1);

phi_new = exp(1i*theta1).*phi;
phi_new_real = real(phi_new);
phi_new_imag = imag(phi_new);
h5write('groundstate.h5','/1/phiimag',phi_new_imag)
h5write('groundstate.h5','/1/phireal',phi_new_real)
