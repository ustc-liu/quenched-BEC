clear;
quench;
indx = 401;
phi0 = squeeze(phit0real_1(indx,:,:) + 1i*phit0imag_1(indx,:,:));
phi1 = squeeze(phit1real_1(indx,:,:) + 1i*phit1imag_1(indx,:,:));
n0 = abs(phi0).^2;
n1 = abs(phi1).^2;

xmin = min(x_1);
xmax = max(x_1);
ymin = min(y_1);
ymax = max(y_1);
Nx = length(x_1);
Ny = length(y_1);

[X,Y] = meshgrid(x_1,y_1);

% setting up momentum basis
kx_index = -(Nx-1)/2:(Nx-1)/2;
ky_index = -(Ny-1)/2:(Ny-1)/2;

kx = kx_index*pi/xmax;
ky = ky_index*pi/ymax;
dkx = pi/xmax;
dky = pi/ymax;
[KX, KY] = meshgrid(kx,ky);
R = 100;
phik0 = fft2(phi0);
phik1 = fft2(phi1);

subplot(1,2,1)
imagesc(x_1,y_1,angle(phi0).*heaviside(1-sqrt(X.^2+Y.^2)/R))
axis equal;colorbar
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
xlim([-120 120])
ylim([-120 120])

subplot(1,2,2)
imagesc(x_1,y_1,angle(phi0).*heaviside(1-sqrt(X.^2+Y.^2)/R))
axis equal;colormap bone;colorbar
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
xlim([-120 120])
ylim([-120 120])

