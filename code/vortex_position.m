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
                plot(x_1(indy),y_1(indx),'pr','MarkerSize',6,'MarkerFaceColor','r');
            end
            if v_t > 0
                vor_p = vor_p + 1;
                plot(x_1(indy),y_1(indx),'or','MarkerSize',6,'MarkerFaceColor','g');
            end
        end
        hold on
    end
end