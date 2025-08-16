t = 2:10000;
t = t';
N = log(t)./t;
indx_1 = 1:999;
fit(log(t(indx_1)),log(N(indx_1)),'poly1')

