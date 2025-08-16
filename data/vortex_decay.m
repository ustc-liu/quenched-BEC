clear
load quench_to_Omega_01.mat;
indx = 1;
Nt = cell(15,2);
for ind = 1:4:57
    Nt_temp = mean(Nvt(:,ind:(ind+3)),2);

    temp_1 = max(Nvt(:,ind));
    indx_max_1 = find(Nvt(:,ind) == temp_1,1,'last');

    temp_2 = max(Nvt(:,ind+1));
    indx_max_2 = find(Nvt(:,ind+1) == temp_2,1,'last');

    temp_3 = max(Nvt(:,ind+2));
    indx_max_3 = find(Nvt(:,ind+2) == temp_3,1,'last');

    temp_4 = max(Nvt(:,ind+3));
    indx_max_4 = find(Nvt(:,ind+3) == temp_4,1,'last');

    %temp = [temp_1 temp_2 temp_3 temp_4];
    indx_max = max([indx_max_1 indx_max_2 indx_max_3 indx_max_4]);
    
    Nt{indx,1} = (indx_max:401)';
    Nt{indx,2} = Nt_temp(indx_max:401);
    
    indx = indx + 1;
end
marker_list = ["bo" "ks" "gd" "c*" "mx" "yp" "wh" "^" "v" "."];
face_color = ["b" "k" "g" "c" "m" "y" "w"];
tiledlayout("horizontal",'Padding','compact','TileSpacing', 'compact');
nexttile
t = Nt{1,1};
N = Nt{1,2};
for ind = 1:1
    loglog(Nt{ind,1},Nt{ind,2},marker_list(ind),'MarkerSize',2,'MarkerFaceColor',face_color(ind))
    hold on
end
ft1 = fit(log(t),log(N),'poly1');
a1 = ft1.p1;
b1 = ft1.p2;
y1 = exp(b1)./t.^(-a1);
loglog(t,y1,'r-.','LineWidth',2)
grid on
grid minor
xlabel('$t$','interpreter','latex','fontsize',16)
ylabel('$N(t)$','Interpreter','latex','FontSize',16)

nexttile
loglog(t./log(t),N,marker_list(ind),'MarkerSize',2,'MarkerFaceColor',face_color(ind))
hold on
ft2 = fit(log(t./log(t)),log(N),'poly1');
a2 = ft2.p1;
b2 = ft2.p2;
y2 = exp(b2)./(t./log(t)).^(-a2);
loglog(t./log(t),y2,'r-.','LineWidth',2)
xlabel('$t/\log(t)$','interpreter','latex','fontsize',16)
ylabel('$N(t)$','Interpreter','latex','FontSize',16)
grid on
grid minor