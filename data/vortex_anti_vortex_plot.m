load quench_to_Omega_01.mat;
N1 = Nvt(:,1);
N2 = Nvt(:,2);
N3 = Nvt(:,15);
N4 = Nvt(:,16);
t = t_1;
indx = 1:10:401;
plot(t(indx),N1(indx),'b-s','LineWidth',1.5,'MarkerSize',5)
hold on
plot(t(indx),N2(indx),'b-*','LineWidth',1.5,'MarkerSize',5)


plot(t(indx),N3(indx),'r--s','LineWidth',1.5,'MarkerSize',5)
hold on
plot(t(indx),N4(indx),'r--*','LineWidth',1.5,'MarkerSize',5)
legend('$\tau_q=20$','$\tau_q=20$','$\tau_q=50$','$\tau_q=50$','interpreter','latex')
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_{\rm v}$','Interpreter','latex','FontSize',16)
xlim([0 401]);