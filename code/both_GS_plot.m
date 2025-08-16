clear;
groundstate;
% theoretically, phi0 = i*phi1, checked by numerical simulation
phi0 = phi0real_1(:,:) + 1i*phi0imag_1(:,:);
phi1 = phi1real_1(:,:) + 1i*phi1imag_1(:,:);
Nm = norm_2;
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


%Nk0 = sum(sum(abs(phik0).^2 + abs(phik1).^2))*dkx*dky;

tiledlayout("horizontal",'Padding','compact','TileSpacing', 'compact');
nexttile
%subplot(1,3,1)
imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal;colorbar
xlabel('$k_x$','Interpreter','latex','FontSize',16)
ylabel('$k_y$','Interpreter','latex','FontSize',16)
xlim([-0.5 0.5])
ylim([-0.5 0.5])

groundstate_small
phi0 = phi0real_1(:,:) + 1i*phi0imag_1(:,:);
phi1 = phi1real_1(:,:) + 1i*phi1imag_1(:,:);
phik0 = fft2(phi0);
phik1 = fft2(phi1);
%Nk0 = sum(sum(abs(phik0).^2 + abs(phik1).^2))*dkx*dky;
nexttile
%subplot(1,3,2)
imagesc(kx,ky,abs(fftshift(phik0)).^2);axis equal;colorbar
xlabel('$k_x$','Interpreter','latex','FontSize',16)
ylabel('$k_y$','Interpreter','latex','FontSize',16)
xlim([-2 2])
ylim([-2 2])
colormap hot


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

nexttile
%subplot(1,3,3)
imagesc(x_1,y_1,angle(phi0).*heaviside(1-sqrt(X.^2+Y.^2)/R))
axis equal;colorbar
xlabel('$x$','Interpreter','latex','FontSize',16)
ylabel('$y$','Interpreter','latex','FontSize',16)


v_p = calc_vortex_winding(angle(phi0));
vor_p = 0;
vor_m = 0;
[Nx,Ny] = size(phi0);
R = 98;
for indx = 1:Nx
    for indy = 1:Ny
        v_t = v_p(indx,indy);
        if abs(abs(v_t)-1) <= 0.01 && sqrt(x_1(indy).^2+y_1(indx).^2) <= R
            if v_t < 0
                vor_m = vor_m + 1;
                plot(x_1(indy),y_1(indx),'^r','MarkerSize',6,'MarkerFaceColor','g');
            end
            if v_t > 0
                vor_p = vor_p + 1;
                plot(x_1(indy),y_1(indx),'or','MarkerSize',6,'MarkerFaceColor','g');
            end
        end
        hold on
    end
end

xlim([-30 30])
ylim([-30 30])