function MeanMicroMicroGains_Plot_Grupal(MicroMongs_mean,MicroMogs_mean,MicroMongs_std,MicroMogs_std,titulo,Group_Parameters)

figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)

%MOGS NO ACUM--------------------------------------------------------------
subplot(1,2,1)
plot(1:1:length(MicroMogs_mean),MicroMogs_mean,'+');
errorbar(1:1:length(MicroMogs_mean),MicroMogs_mean,MicroMogs_std,'s');
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('MicroMogs - mean','FontName','Arial','FontSize',12); 
xlim([0 length(MicroMogs_mean)+1]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-0.15 0.15])
else
    ylim([-0.5 0.5])
end
yline(0)

%MONGS NO ACUM ------------------------------------------------------------
subplot(1,2,2)
plot(1:1:length(MicroMongs_mean),MicroMongs_mean,'+');
errorbar(1:1:length(MicroMongs_mean),MicroMongs_mean, MicroMongs_std,'s');
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('MicroMongs - mean','FontName','Arial','FontSize',12); 
xlim([0 length(MicroMongs_mean)+1]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-0.15 0.15])
else
    ylim([-0.5 0.5])
end
yline(0)

% %MOGS ACUM ----------------------------------------------------------------
% subplot(2,2,3)
% plot(1:1:length(Group_Results.mediana_MicroMogs_acum_mean),Group_Results.mediana_MicroMogs_acum_mean,'+');
% errorbar(1:1:length(Group_Results.mediana_MicroMogs_acum_mean),Group_Results.mediana_MicroMogs_acum_mean, Group_Results.mediana_MicroMogs_acum_std);
% hold on;
% xlabel('Blocks','FontName','Arial','FontSize',12);
% ylabel('MicroMogs - median','FontName','Arial','FontSize',12); 
% title('Acum')
% %ylim([0 (max(Group_Results.mediana_MicroMogs_acum_mean)+min(Group_Results.mediana_MicroMogs_acum_mean))]);
% xlim([0 length(Group_Results.mediana_MicroMogs_acum_mean)+1]);
% ylim([-0.5 0.5])
% yline(0)
% 
% %MONGS ACUM ---------------------------------------------------------------
% Group_Results.mediana_MicroMongs_acum_mean=nanmean(Group_Parameters.mediana_MicroMONGS_acum_group);
% Group_Results.mediana_MicroMongs_acum_std=nanstd(Group_Parameters.mediana_MicroMONGS_acum_group)/sqrt(N); %error estandar
% 
% subplot(2,2,4)
% plot(1:1:length(Group_Results.mediana_MicroMongs_acum_mean),Group_Results.mediana_MicroMongs_acum_mean,'+');
% errorbar(1:1:length(Group_Results.mediana_MicroMongs_acum_mean),Group_Results.mediana_MicroMongs_acum_mean, Group_Results.mediana_MicroMongs_acum_std);
% hold on;
% xlabel('Blocks','FontName','Arial','FontSize',12);
% ylabel('MicroMongs - median','FontName','Arial','FontSize',12); 
% title('Acum')
% %ylim([0 (max(Group_Results.mediana_MicroMongs_acum_mean)+min(Group_Results.mediana_MicroMongs_acum_mean))]);
% xlim([0 length(Group_Results.mediana_MicroMongs_acum_mean)+1]);
% ylim([-0.5 0.5])
% yline(0)