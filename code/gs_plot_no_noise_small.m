clear;
groundstate_small;
% theoretically, phi0 = i*phi1, checked by numerical simulation
phi0 = phi0real_1(:,:) + 1i*phi0imag_1(:,:);
phi1 = phi1real_1(:,:) + 1i*phi1imag_1(:,:);

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
font_size = 16;
% figure
%imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal
subplot(2,2,1)
imagesc(x_1,y_1,n0);axis equal;colorbar
xlabel('$x$','Interpreter','latex','FontSize',font_size)
ylabel('$y$','Interpreter','latex','FontSize',font_size)
axis([-120 120 -120 120])
subplot(2,2,2)
imagesc(x_1,y_1,n1);axis equal;colorbar
xlabel('$x$','Interpreter','latex','FontSize',font_size)
ylabel('$y$','Interpreter','latex','FontSize',font_size)
axis([-120 120 -120 120])

subplot(2,2,3)
imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal;colorbar
xlabel('$k_x$','Interpreter','latex','FontSize',font_size)
ylabel('$k_y$','Interpreter','latex','FontSize',font_size)
xlim([-2 2])
ylim([-2 2])
subplot(2,2,4)
imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal;colormap hot;colorbar
xlabel('$k_x$','Interpreter','latex','FontSize',font_size)
ylabel('$k_y$','Interpreter','latex','FontSize',font_size)
xlim([-2 2])
ylim([-2 2])
%imagesc(kx,ky,abs(fftshift(phik1)).^2);axis equal
% surf(n1)
