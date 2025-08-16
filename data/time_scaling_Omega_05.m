load quench_to_Omega_05.mat;
N_thresh = 20;
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
t_c = tq/1.5;
Dt = t_hat-t_c;
subplot(1,2,1)
loglog(tq,Dt,'rp')
xlabel('\tau_q')
ylabel('t-t_c')
subplot(1,2,2)
loglog(tq,Nmax,'rp')
xlabel('\tau_q')
ylabel('N_v')