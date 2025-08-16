my_line = ["--o" "-.s" "--d" "-p" "-.o" "--s" "-.d" "--p" "-.o" "-.s" "-.d" "-.p" "-o" "-.s" "-.d"];

tiledlayout(2,2);
nexttile
load quench_to_Omega_0.mat;
indx = 1;
for ind = 1:4:57
    plot(t_1,mean(Nvt(:,ind:(ind+3)),2),my_line(indx),'LineWidth',1,'MarkerSize',2)
    indx = indx + 1;
    hold on
end
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_v$','Interpreter','latex','FontSize',16)
xlim([0 401]);



nexttile
load quench_to_Omega_01.mat;
indx = 1;
for ind = 1:4:57
    plot(t_1,mean(Nvt(:,ind:(ind+3)),2),'-o','LineWidth',1,'MarkerSize',2)
    indx =  indx + 1;
    hold on
end
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_{\rm v}$','Interpreter','latex','FontSize',16)
xlim([0 401]);


nexttile
load quench_to_Omega_02.mat;
indx = 1;
for ind = 1:8:113
    plot(t_1,mean(Nvt(:,ind:(ind+7)),2),my_line(indx),'LineWidth',1,'MarkerSize',1)
    indx = indx + 1;
    hold on
end
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_v$','Interpreter','latex','FontSize',16)
xlim([0 401]);


nexttile
load quench_to_Omega_05.mat;
indx = 1;
for ind = 1:8:113
    plot(t_1,mean(Nvt(:,ind:(ind+7)),2),my_line(indx),'LineWidth',1,'MarkerSize',2)
    indx = indx + 1;
    hold on
end
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N_v$','Interpreter','latex','FontSize',16)
xlim([0 401]);



f = gcf;
exportgraphics(f,'vortex_with_time_Omega.pdf','Resolution',600)