Nk = 500;
kmax = 1.25;
kx = linspace(-kmax,kmax,Nk);
[KX,KY] = meshgrid(kx,kx);

kappa = 1;

delta = 2;
Em = (KX.^2+KY.^2)/2 - sqrt(kappa^2*(KX.^2+KY.^2)+delta^2);
%Ep = (KX.^2+KY.^2)/2 + sqrt(kappa^2*(KX.^2+KY.^2)+delta^2);
figure
imagesc(kx,kx,Em);axis equal;colormap bone;colorbar
Emin_1 = min(Em(:));
Emax_1 = max(Em(:));

%zlim([Emin_1 Emax_1])
xlabel('$k_x$','interpreter','latex')
ylabel('$k_y$','interpreter','latex')
zlabel('$E_{-}$','interpreter','latex')
figure
delta = 0.0;
kc = sqrt(kappa^2-delta^2/kappa^2);
Em = (KX.^2+KY.^2)/2 - sqrt(kappa^2*(KX.^2+KY.^2)+delta^2);

imagesc(kx,kx,Em);axis equal;colormap bone;colorbar
xlabel('$k_x$','interpreter','latex')
ylabel('$k_y$','interpreter','latex')
zlabel('$E_{-}$','interpreter','latex')
%zlim([Emin_1 Emax_2])
