tq = [40 50 60 70 80 90 100 110 120 130 140 150 160]';

Nv = [361 319 281 269 268 244 226 222 219 203 196 186 172]';
logt = log(tq);
logy = log(Nv);

loglog(tq,Nv,'s','MarkerSize',6)
xlabel('$\tau_q$','Interpreter','latex','FontSize',16)
ylabel('$N_v$','Interpreter','latex','FontSize',16)
ft = fit(logt,logy,'poly1');

% segment one
x1 = logt(1:7);
y1 = logy(1:7);
ft1 = fit(x1,y1,'poly1');
% segment two
x2 = logt(8:13);
y2 = logy(8:13);
ft2 = fit(x2,y2,'poly1');

x_seg1 = 36:90;
x_seg2 = 100:170;
%y = t_scaling;

hold on

y_seg1 = exp(ft1.p2)*x_seg1.^(ft1.p1);
y_seg2 = exp(ft2.p2)*x_seg2.^(ft2.p1);
loglog(x_seg1,y_seg1,'k-.','LineWidth',2)
loglog(x_seg2,y_seg2,'r--','LineWidth',2)