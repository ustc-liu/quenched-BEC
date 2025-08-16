%% add random Gaussian noise into the initial wavefunction
clear;
% load noise-free GS file
groundstate;
% meshgrid the spatial dimension
Nx = length(x_1);
Ny = length(y_1);
x = x_1;
y = y_1';
dx = x(2)-x(1);
dy = y(2)-y(1);
% load noise-free wavefunction
phi0 = phi0real_1 + phi0imag_1*1i;
phi1 = phi1real_1 + phi1imag_1*1i;
N1 = sum(sum(abs(phi0).^2 + abs(phi1).^2))*dx*dy;
[X,Y] = meshgrid(x,y);

n0 = abs(phi0).^2;
n1 = abs(phi1).^2;

% generate noise
xi = 0.001;
R = 12;
Phi0_noise = sqrt(xi*n0/2).*(randn(Nx,Ny) + 1i*randn(Nx,Ny)).*heaviside(1-sqrt(X.^2+Y.^2)/R);
Phi1_noise = sqrt(xi*n1/2).*(randn(Nx,Ny) + 1i*randn(Nx,Ny)).*heaviside(1-sqrt(X.^2+Y.^2)/R);

% add noise
Phi0_temp = phi0 + Phi0_noise;
Phi1_temp = phi1 + Phi1_noise;

% re-normalizetion
N2 = sum(sum(abs(Phi0_temp).^2 + abs(Phi1_temp).^2))*dx*dy;
Phi0 = Phi0_temp*sqrt(N1/N2);
Phi1 = Phi1_temp*sqrt(N1/N2);

phi0real_1 = real(Phi0);
phi1real_1 = real(Phi1);
phi0imag_1 = imag(Phi0);
phi1imag_1 = imag(Phi1);

% write the noise-added wavefunction into original GS file
h5write('groundstate.h5', '/1/phi0real', phi0real_1)
h5write('groundstate.h5', '/1/phi1real', phi1real_1)
h5write('groundstate.h5', '/1/phi0imag', phi0imag_1)
h5write('groundstate.h5', '/1/phi1imag', phi1imag_1)