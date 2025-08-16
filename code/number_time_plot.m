tau = [40 80 120 160];
Ntau = length(tau);
for ind = 1:Ntau
    tauq = tau(ind);
    load_name = strcat('quench_tauq_',num2str(tauq),'.h5');
    load_name_2 = strcat('quench.h5');
    copyfile(load_name,load_name_2);
    quench;
    [L1,L2,L3] = size(phit0imag_1);
    vp = zeros(L1,1);
    vm = zeros(L1,1);
    R = 99;
    for indx = 1:L1
        phi0 = squeeze(phit0real_1(indx,:,:) + 1i*phit0imag_1(indx,:,:));
        phi1 = squeeze(phit1real_1(indx,:,:) + 1i*phit1imag_1(indx,:,:));
        v_p = calc_vortex_winding(angle(phi1));
        for ind1 = 1:L2
            for ind2 = 1:L3
                v_t = v_p(ind1,ind2);
                if abs(abs(v_t)-1) <= 0.01 && sqrt(x_1(ind2).^2+y_1(ind1).^2) <= R
                    if v_t < 0
                        vm(indx) = vm(indx) + 1;
                    end
                    if v_t > 0
                        vp(indx) = vp(indx) + 1;
                    end
                end
            end
        end
    end
    plot(t_1(1:5:401),vp(1:5:401),'g-s','MarkerSize',5,'MarkerFaceColor','g')
    %hold on
    %plot(t_1,vm,'-*')
    xlabel('$t$ (dimensionless)','interpreter','latex','FontSize',10)
    ylabel('$N_v$','interpreter','latex','FontSize',16)
    %title('Round Potential')
    hold on
    
end
legend('$\tau_q=40$','$\tau_q=80$','$\tau_q=120$','$\tau_q=160$','interpreter','latex')