clear
load quench_to_Omega_02.mat;
N_thresh = 5;
t_hat = zeros(15,1);
Nmax = zeros(15,1);
Nvar = zeros(15,1);
indx = 1;
for ind = 1:8:113
    Nt = mean(Nvt(:,ind:(ind+7)),2);
    temp_1 = max(Nvt(:,ind));
    temp_2 = max(Nvt(:,ind+1));
    temp_3 = max(Nvt(:,ind+2));
    temp_4 = max(Nvt(:,ind+3));
    temp_5 = max(Nvt(:,ind+4));
    temp_6 = max(Nvt(:,ind+5));
    temp_7 = max(Nvt(:,ind+6));
    temp_8 = max(Nvt(:,ind+7));
    temp = [temp_1 temp_2 temp_3 temp_4 temp_5 temp_6 temp_7 temp_8];
    Nmax(indx) = max(temp);
    Nvar(indx) = std(temp);
    t_hat(indx) = t_1(find(Nt<=N_thresh, 1, 'last' ));
    indx = indx + 1;
end
tq = 20:10:160;
tq = tq';
t_c = tq/1.8;
Dt = t_hat-t_c;

ft1 = fit(log(tq(4:15)),log(Dt(4:15)),'poly1');
a1 = ft1.p1;
b1 = ft1.p2;
nu_z = 1/(1/a1-1);
ft2 = fit(log(tq(5:15)),log(Nmax(5:15)),'poly1');
a2 = ft2.p1;
b2 = ft2.p2;
nu = -(1+nu_z)*a2/2;
z = nu_z/nu;

x1 = linspace(15,170,500);
x2 = linspace(20,170,500);
y1 = exp(b1)*x1.^a1;
y2 = exp(b2)./x2.^(-a2);
%subplot(1,2,1)
f = tiledlayout("horizontal",'Padding','compact','TileSpacing', 'compact');
nexttile
b = loglog(tq,Dt,'bo');
b.MarkerFaceColor = 'blue';
b.MarkerSize = 6;
hold on
loglog(x1,y1,'k-.','LineWidth',1.5)
xlim([15 170])
grid on
grid minor
xlabel('$\tau_q$','interpreter','latex','fontsize',16)
ylabel('$\hat{t}-t_C$','Interpreter','latex','FontSize',16)


%subplot(1,2,2)
nexttile
c = errorbar(tq,Nmax,Nvar,'bs');
set(gca, 'XScale','log', 'YScale','log')
xlim([20 170])
c.MarkerFaceColor = 'blue';
c.MarkerSize = 4;
hold on
loglog(x2,y2,'k-.','LineWidth',1.5)
xlabel('$\tau_q$','interpreter','latex','fontsize',16)
ylabel('$N_{\rm max}$','Interpreter','latex','FontSize',16)
grid on
grid minor

%exportgraphics(f,'scaling_laws.pdf','Resolution',300)
