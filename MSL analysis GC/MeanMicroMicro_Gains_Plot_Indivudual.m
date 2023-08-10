function MeanMicroMicro_Gains_Plot_Indivudual(MicroMogs_mean,MicroMongs_mean,MicroMogs_std,MicroMongs_std,seq_results)
figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle('Mean value per block - crudo')

% Micro MOGS
if seq_results(1,1).flag_norm==0
    subplot(2,2,1)
    plot(MicroMogs_mean,'r.')
    errorbar(MicroMogs_mean,MicroMogs_std,'s')
    ylim([-1 1])
else
    subplot(1,2,1)
    plot(MicroMogs_mean,'r.')
    errorbar(MicroMogs_mean,MicroMogs_std,'s')
    ylim([-5 5])
end
yline(0)
ylabel('MicroMogs [s]')
xlabel('Block')
title('No acum')

% Micro MONGS
if seq_results(1,1).flag_norm==0
    subplot(2,2,2)
    plot(MicroMongs_mean,'b.')
    errorbar(MicroMongs_mean,MicroMongs_std,'s')
    ylim([-1 1])
else
    subplot(1,2,2)
    plot(MicroMongs_mean,'b.')
    errorbar(MicroMongs_mean,MicroMongs_std,'s')
    ylim([-5 5])
end
yline(0)
ylabel('MicroMongs [s]')
xlabel('Block')
title('No acum')