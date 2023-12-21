%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Esta funcion

function MeanMicroMicroGains_Plot_Grupal(MicroMongs_mean,MicroMogs_mean,MicroMongs_std,MicroMogs_std,...
    MicroMogs_acum_mean,MicroMongs_acum_mean,MicroMogs_acum_subjects,MicroMongs_acum_subjects,titulo,Group_Parameters,flag_media_mediana,...
    MicroMongs_subjects,MicroMogs_subjects)

figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)
set(gcf,'Position',get(0,'ScreenSize'));

%MOGS NO ACUM--------------------------------------------------------------
subplot(2,2,1)
if nargin < 13
    plot(1:1:length(MicroMogs_mean),MicroMogs_mean,'+');
    errorbar(1:1:length(MicroMogs_mean),MicroMogs_mean,MicroMogs_std,'s');
else
    mad_MicroMogs=7*mad(MicroMogs_subjects,1);
    for i=1:size(MicroMogs_subjects,1)
        s=scatter(1:size(MicroMogs_subjects,2),MicroMogs_subjects(i,:),'r','filled','MarkerEdgeAlpha',0.25);
        s.MarkerFaceAlpha = 0.25;
        hold on;
    end
    plot(1:1:length(MicroMogs_mean),MicroMogs_mean,'k','MarkerSize',10);
    x_vector =[1:1:length(MicroMogs_mean) fliplr(1:1:length(MicroMogs_mean))];
    x_vector2=[MicroMogs_mean+mad_MicroMogs,fliplr(MicroMogs_mean-mad_MicroMogs)];
    patch = fill(x_vector, x_vector2, [100 100 100]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
end
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel(['MicroMogs - ' flag_media_mediana],'FontName','Arial','FontSize',12); 
xlim([0 length(MicroMogs_mean)+1]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    %ylim([-0.5 0.5])
    ylim([-2 2])
else
    ylim([-0.5 0.5])
end
yline(0)

%MONGS NO ACUM ------------------------------------------------------------
subplot(2,2,2)
if nargin < 13
    plot(1:1:length(MicroMongs_mean),MicroMongs_mean,'+');
    errorbar(1:1:length(MicroMongs_mean),MicroMongs_mean, MicroMongs_std,'s');
else
    mad_MicroMongs=7*mad(MicroMongs_subjects,1);
    for i=1:size(MicroMongs_subjects,1)
        s=scatter(1:size(MicroMongs_subjects,2),MicroMongs_subjects(i,:),'b','filled','MarkerEdgeAlpha',0.25);
        s.MarkerFaceAlpha = 0.25;
        hold on;
    end
    plot(1:1:length(MicroMongs_mean),MicroMongs_mean,'k','MarkerSize',10);
    x_vector =[1:1:length(MicroMongs_mean) fliplr(1:1:length(MicroMongs_mean))];
    x_vector2=[MicroMongs_mean+mad_MicroMongs,fliplr(MicroMongs_mean-mad_MicroMongs)];
    patch = fill(x_vector, x_vector2, [100 100 100]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
end
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel(['MicroMongs - ' flag_media_mediana],'FontName','Arial','FontSize',12); 
xlim([0 length(MicroMongs_mean)+1]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    %ylim([-0.15 0.15])
    %ylim([-0.5 0.5])
    ylim([-2 2])
else
    ylim([-0.5 0.5])
end
yline(0)

%MOGS ACUM ----------------------------------------------------------------
subplot(2,2,3)

for i=1:size(MicroMogs_acum_subjects,1)
    s=scatter(1:size(MicroMogs_acum_subjects,2),MicroMogs_acum_subjects(i,:),'r','filled','MarkerEdgeAlpha',0.25);
    s.MarkerFaceAlpha = 0.25;
    hold on;
end
plot(1:1:length(MicroMogs_acum_mean),MicroMogs_acum_mean,'k.','MarkerSize',10);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel(['MicroMogs - ' flag_media_mediana],'FontName','Arial','FontSize',12); 
title('Acum')
xlim([0 length(MicroMogs_acum_mean)+1]);
ylim([-4.1 4.1])
yline(0)
 box on;

%MONGS ACUM ---------------------------------------------------------------
subplot(2,2,4)

for i=1:size(MicroMongs_acum_subjects,1)
    s=scatter(1:size(MicroMongs_acum_subjects,2),MicroMongs_acum_subjects(i,:),'b','filled','MarkerEdgeAlpha',0.25);
    s.MarkerFaceAlpha = 0.25;
    hold on;
end
plot(1:1:length(MicroMongs_acum_mean),MicroMongs_acum_mean,'k.','MarkerSize',10);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel(['MicroMongs - ' flag_media_mediana],'FontName','Arial','FontSize',12); 
title('Acum')
xlim([0 length(MicroMongs_acum_mean)+1]);
ylim([-4.1 4.1])
yline(0)
 box on;