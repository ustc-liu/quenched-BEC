load('quench_to_Omega_01.mat')
Nv = mean(Nvt(:,9:12),2);
plot(t_1,Nv)
t = t_1(60:401);
N = Nv(60:401);

x = linspace(40,450);
a = 2.255e+03;
b = -0.0181;
c = 766.4057;
d = -0.0023;
y = a*exp(b*x)+c*exp(d*x);
nu = -x./y.*(a*b*exp(b*x)+c*d*exp(d*x));

tiledlayout("horizontal",'Padding','compact','TileSpacing', 'compact');
nexttile
plot(t,N,'ko','MarkerSize',6,'MarkerFaceColor','auto')
hold on
plot(x,y,'r--','LineWidth',1.5)
xlabel('$t$','Interpreter','latex','FontSize',16)
ylabel('$N(t)$','Interpreter','latex','fontsize',16)

nexttile
plot(x,nu,'b-','LineWidth',2)
xlabel('$t$','Interpreter','latex','FontSize',16)
ylabel('$\alpha$','Interpreter','latex','FontSize',16)
xlim([0 400])
ylim([0 1])

