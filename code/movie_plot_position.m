clear;
realtime;
xmin = min(x_1);
xmax = max(x_1);
ymin = min(y_1);
ymax = max(y_1);
[Nt,Nx,Ny] = size(phitt0real_1);
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
    phi0 = squeeze(phitt0real_1(ind1,:,:) + 1i*phitt0imag_1(ind1,:,:));
    phi1 = squeeze(phitt1real_1(ind1,:,:) + 1i*phitt1imag_1(ind1,:,:));
    imagesc(x_1,y_1,abs(phi0).^2);
    %colormap gray
    colormap bone
    %colormap hot
    axis equal
    hold on
    %fimplicit(f,[-16 16 -16 16])
    
    xlim([xmin -xmin]);
    ylim([ymin -ymin]);
    xlabel('x')
    ylabel('y')
    %
    hold off
    F(indzzz) = getframe(gcf);
    indzzz = indzzz + 1;
end
%drawnow
video_title = strcat('vortex_imprint_short_time');
writerObj = VideoWriter(video_title);
writerObj.FrameRate = 24;
open(writerObj);
writeVideo(writerObj,F(2:length(F)));
close(writerObj);