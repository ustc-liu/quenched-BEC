clear;
quench;
xmin = min(x_1);
xmax = max(x_1);
ymin = min(y_1);
ymax = max(y_1);
[X,Y] = meshgrid(x_1,y_1);
[Nt,Nx,Ny] = size(phit0real_1);
R = 100;
f = @(x,y) x.^2 + y.^2 - R^2;
% setting up momentum basis
kx_index = -(Nx-1)/2:(Nx-1)/2;
ky_index = -(Ny-1)/2:(Ny-1)/2;

kx = kx_index*pi/xmax;
ky = ky_index*pi/ymax;
dkx = pi/xmax;
dky = pi/ymax;
[KX, KY] = meshgrid(kx,ky);
indzzz = 1;
for ind1 = 1:Nt
    phi0 = squeeze(phit0real_1(ind1,:,:) + 1i*phit0imag_1(ind1,:,:));
    %phi1 = squeeze(phit1real_1(ind1,:,:) + 1i*phit1imag_1(ind1,:,:));
    imagesc(x_1,y_1,angle(phi0).*heaviside(1-sqrt(X.^2+Y.^2)/100))
    axis equal;colormap bone;colorbar;clim([-pi pi])
    xlabel('$x$','Interpreter','latex')
    ylabel('$y$','Interpreter','latex')
    title('Phase of $\Psi_0$','Interpreter','latex')
    hold on
    %fimplicit(f,[-16 16 -16 16])

    xlim([xmin -xmin]);
    ylim([ymin -ymin]);
    hold off
    F(indzzz) = getframe(gcf);
    indzzz = indzzz + 1;
end
%drawnow
video_title = strcat('vortex_phase_quench_10frame');
writerObj = VideoWriter(video_title);
writerObj.FrameRate = 10;
open(writerObj);
writeVideo(writerObj,F(2:length(F)));
close(writerObj);