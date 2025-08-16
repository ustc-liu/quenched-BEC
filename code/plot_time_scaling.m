tq = [40 50 60 70 80 90 100 110 120 130 140 150 160]';

t_critical = 2/3*tq;
t_create = [47 57 65 74 82 92 101 110 119 128 137 145 154]';
t_scaling = t_create-t_critical;
logt = log(tq);
logy = log(t_scaling);

loglog(tq,t_scaling,'s','MarkerSize',6)
xlabel('$\tau_q$','Interpreter','latex','FontSize',16)
ylabel('$\hat{t}-t_c$','Interpreter','latex','FontSize',16)
ft = fit(logt,logy,'poly1');

% segment one
x1 = logt(1:5);
y1 = logy(1:5);
ft1 = fit(x1,y1,'poly1');
% segment two
x2 = logt(6:13);
y2 = logy(6:13);
ft2 = fit(x2,y2,'poly1');

x_seg1 = 36:90;
x_seg2 = 80:170;
%y = t_scaling;

hold on

y_seg1 = exp(ft1.p2)*x_seg1.^(ft1.p1);
y_seg2 = exp(ft2.p2)*x_seg2.^(ft2.p1);
loglog(x_seg1,y_seg1,'k-.','LineWidth',2)
loglog(x_seg2,y_seg2,'r--','LineWidth',2)