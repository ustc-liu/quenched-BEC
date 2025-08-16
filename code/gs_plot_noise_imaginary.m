clear;
groundstate_noised;
% theoretically, phi0 = i*phi1, checked by numerical simulation
phi0 = phit0real_1 + 1i*phit0imag_1;
phi1 = phit1real_1 + 1i*phit1imag_1;

n0 = abs(phi0).^2;
n1 = abs(phi1).^2;
[X,Y] = meshgrid(x_1,y_1);
xmin = min(x_1);
xmax = max(x_1);
ymin = min(y_1);
ymax = max(y_1);
dx = x_1(2)-x_1(1);
dy = y_1(2)-y_1(1);
[Nx,Ny] = size(phi0);

% setting up momentum basis
kx_index = -Nx/2:(Nx-1)/2;
ky_index = -Ny/2:(Ny-1)/2;

kx = kx_index*pi/xmax;
ky = ky_index*pi/ymax;
dkx = pi/xmax;
dky = pi/ymax;
[KX, KY] = meshgrid(kx,ky);

phik0 = fft2(phi0);
phik1 = fft2(phi1);
% figure
%imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal
subplot(2,2,1)
mesh(x_1,y_1,n0)
xlabel('x')
ylabel('y')
zlabel('n_1(x,y)')
subplot(2,2,2)
mesh(x_1,y_1,n1)
xlabel('x')
ylabel('y')
zlabel('n_2(x,y)')

subplot(2,2,3)
imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal
xlabel('k_x')
ylabel('k_y')
xlim([-1 1])
ylim([-1 1])
subplot(2,2,4)
imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal
xlabel('k_x')
ylabel('k_y')
xlim([-1 1])
ylim([-1 1])
%imagesc(kx,ky,abs(fftshift(phik1)).^2);axis equal
% surf(n1)
