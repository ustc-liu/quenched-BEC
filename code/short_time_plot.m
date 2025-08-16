clear;
imprint_realtime;
indx = 201;
phi0 = squeeze(phitt0real_1(indx,:,:) + 1i*phitt0imag_1(indx,:,:));
phi1 = squeeze(phitt1real_1(indx,:,:) + 1i*phitt1imag_1(indx,:,:));
n0 = abs(phi0).^2;
n1 = abs(phi1).^2;

xmin = min(x_1);
xmax = max(x_1);
ymin = min(y_1);
ymax = max(y_1);
Nx = length(x_1);
Ny = length(y_1);

% setting up momentum basis
kx_index = -(Nx-1)/2:(Nx-1)/2;
ky_index = -(Ny-1)/2:(Ny-1)/2;

kx = kx_index*pi/xmax;
ky = ky_index*pi/ymax;
dkx = pi/xmax;
dky = pi/ymax;
[KX, KY] = meshgrid(kx,ky);

phik0 = fft2(phi0);
%imagesc(x_1,y_1,angle(phi0))
%axis equal
%shading interp
%colorbar
subplot(1,2,1)
imagesc(x_1,y_1,n0);axis equal
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
xlim([-120 120])
ylim([-120 120])
subplot(1,2,2)
imagesc(x_1,y_1,n1);colormap bone;axis equal
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)
xlim([-120 120])
ylim([-120 120])
%figure
%imagesc(x_1,y_1,angle(phi1))
%axis equal
%colorbar