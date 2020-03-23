function [] = plot_BestParams(fitConds,fitResults,idir)

sum_log_Lh  = -fitResults.minus_sum_log_Lh;
f_sigma_m      = fitResults.fit_sigma_m;
f_mu_0      = fitResults.fit_mu_0;
f_sigma_0      = fitResults.fit_sigma_0;
f_kappa_WMdecay  = fitResults.fit_kappa_WMdecay;

i_sigma_m      = fitConds.init_sigma_m;
i_mu_0      = fitConds.init_mu_0;
i_sigma_0      = fitConds.init_sigma_0;
i_kappa_WMdecay  = fitConds.init_kappa_WMdecay;

% visualize Inf values to be 10^6
f_sigma_m(f_sigma_m>10^6)            = 10^6;
f_mu_0(f_mu_0>10^6)            = 10^6;
f_sigma_0(f_sigma_0>10^6)            = 10^6;
f_kappa_WMdecay(f_kappa_WMdecay>10^6)    = 10^6;

i_sigma_m(i_sigma_m>10^6)            = 10^6;
i_mu_0(i_mu_0>10^6)            = 10^6;
i_sigma_0(i_sigma_0>10^6)            = 10^6;
i_kappa_WMdecay(i_kappa_WMdecay>10^6)    = 10^6;

%
close all
h = figure;
set(h,'position',[-1811 256 2000 600])
r = 150; % pixels per inch
set(h,'paperunits','inches','paperposition',[0 0 4000 1500]/r)
nX = length(sum_log_Lh);
%
subplot(2,5,1)
hold on
plot(sum_log_Lh,'marker','*','linestyle','none')
iSub = fitConds.iSub;
title(['sum log Lh, iSub:' num2str(iSub)],'fontsize',20)
xlim([1 nX])
%
subplot(2,5,2)
hold on
plot(f_sigma_m,'marker','*','linestyle','none')
title('sigma_m')
ylabel('fitted')
xlim([1 nX])
%
subplot(2,5,3)
hold on
plot(f_mu_0,'marker','*','linestyle','none')
title('mu_0')
ylabel('fitted')
xlim([1 nX])
%
subplot(2,5,4)
hold on
plot(f_sigma_0,'marker','*','linestyle','none')
title('sigma_0')
ylabel('fitted')
xlim([1 nX])
%
subplot(2,5,5)
hold on
plot(f_kappa_WMdecay,'marker','*','linestyle','none')
title('kappa_WMdecay')
ylabel('fitted')
xlim([1 nX])
%
subplot(2,5,7)
hold on
plot(i_sigma_m,'marker','*','linestyle','none')
title('sigma_m')
ylabel('initial')
xlim([1 nX])
%
subplot(2,5,8)
hold on
plot(i_mu_0,'marker','*','linestyle','none')
title('mu_0')
ylabel('initial')
xlim([1 nX])
%
subplot(2,5,9)
hold on
plot(i_sigma_0,'marker','*','linestyle','none')
title('sigma_0')
ylabel('initial')
xlim([1 nX])
%
subplot(2,5,10)
hold on
plot(i_kappa_WMdecay,'marker','*','linestyle','none')
title('kappa_WMdecay')
ylabel('initial')
xlim([1 nX])
%
saveas(gcf,[idir '/figure_' num2str(iSub) '.tiff'])
end