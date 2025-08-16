function vortices = calc_vortex_winding(theta)
cutoff = pi;
[N,M] = size(theta);
vortices = zeros(N, M);
if isa(theta, 'gpuArray')
    vortices = gpuArray(vortices);
end
% for ii = 1:N
%     for jj = 1:M
%         tl = theta(ii,jj);
%         bl = theta(mod(ii, N)+1, jj);
%         br = theta(mod(ii, N)+1, mod(jj, M)+1);
%         tr = theta(ii,mod(jj, M)+1);
%         loop_vec = [tl bl br tr tl];
%         vortices(ii,jj) = sum(diff(unwrap(loop_vec)))/(2*pi);
%     end
% end
tl = theta;
bl = circshift(theta, [1,0]);
br = circshift(theta, [1,1]);
tr = circshift(theta, [0,1]);
loop_vec = [tl(:)'; bl(:)'; br(:)'; tr(:)'; tl(:)'];
% loop_vec = [tl(:), bl(:), br(:), tr(:), tl(:)];
% size(loop_vec)
% size(unwrap(loop_vec, [], 2))
% size(diff(unwrap(loop_vec, [], 2), 1, 2))
% % vortices(:) = sum(diff(unwrap(loop_vec)))/(2*pi);
% vortices(:) = sum(diff(unwrap(loop_vec, [], 2), 1, 2), 2)/(2*pi);

dp = diff(loop_vec);
dps = mod(dp+pi,2*pi) - pi;

dps(dps==-pi & dp>0) = pi;     % Preserve variation sign for pi vs. -pi 
dp_corr = dps - dp;              % Incremental phase corrections 
dp_corr(abs(dp)<cutoff) = 0;   % Ignore correction when incr. variation is < CUTOFF

dp_final = dp_corr + dp;

vortices(:) = sum(dp_final)/(2*pi);
end