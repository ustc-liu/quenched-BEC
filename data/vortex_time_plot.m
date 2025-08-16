load quench_to_Omega_01.mat;
for ind = 1:4:57
    plot(t_1,mean(Nvt(:,ind:(ind+3)),2),'-o','LineWidth',1.5,'MarkerSize',2)
    hold on
end
x = [0.15 0.47];
y = [0.25 0.25];
annotation('textarrow',x,y,'FontSize',13,'Linewidth',3)

xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_{\rm v}$','Interpreter','latex','FontSize',16)
xlim([0 401]);

axes('Position',[.55 .55 .3 .3])
box on
N1 = Nvt(:,1);
N2 = Nvt(:,2);
N3 = Nvt(:,15);
N4 = Nvt(:,16);
t = t_1;
indx = 1:10:401;
plot(t(indx),N1(indx),'b-s','LineWidth',1.5,'MarkerSize',5)
hold on
plot(t(indx),N2(indx),'r-*','LineWidth',1.5,'MarkerSize',5)


legend('vortex','anti-vortex')
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_{\rm v}$','Interpreter','latex','FontSize',16)
xlim([0 401]);