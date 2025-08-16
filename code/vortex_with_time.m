clear;
quench;
[L1,L2,L3] = size(phit0imag_1);
vp = zeros(L1,1);
vm = zeros(L1,1);
R = 98;
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
plot(t_1,vp,'-')
hold on
plot(t_1,vm,'-*')
%plot(t_1,mean(vp(300:401))*ones(401,1),'--')
%hold on

xlabel('time (arbitrary unit)')
ylabel('$N_v$','interpreter','latex')

