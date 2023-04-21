%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This function is called from ID_RunAnalysisGroup2.m or              %%%
%%% Analisis_Seq_Grupal.m If used for time paradigm make sure its scripted 
%%%                                                                     %%%
%%% Parameters:                                                         %%%
%%%    - Group_Parameters: has all the parameters calculated on each    %%%
%%%    individual (from "Analisis_Seq_Individual.m") from all subjects  %%%
%%%    being analized as a group.                                       %%%
%%%    - Path: where to store the figures                               %%%
%%%    - Titulo: how the group is called. example: "With ITI"            %%%
%%%    - Paradigm_flag: wich paradigm is being analyzed "time" or "key" %%%
%%%    - N: subjects
%%%                                                                     %%%
%%% Group_Results: stores the results as mean value and standard error  %%% 
%%%                                                                     %%%
%%%                             GC 19/12/22                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Group_Results = Plot_Grupal_Figures(Group_Parameters,path,titulo,paradigm_flag,N)
%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 1:                               %%%
%%% Block Duraion: Time in between start of green cross and start of the%%%
%%% red one.                                                            %%%
%%%                                                                     %%%
%%% Correct Sequence Duration: mean value of the difference of last     %%% 
%%% and first intertap interval of correct sequences, per block         %%%
%%%                                                                     %%%
%%% Number of correct sequences: sum of correct sequences per block     %%%
%%%                                                                     %%%
%%% Interkey Interval: mean value of interkey intervals of correct      %%%
%%% sequences per block.                                                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)

subplot(2,2,1); 
Group_Results.duration_group_mean = nanmean(Group_Parameters.duration_group,1);
Group_Results.duration_group_std = nanstd(Group_Parameters.duration_group,0,1)/sqrt(N);

plot(1:1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean,'+');
errorbar(1:1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean, Group_Results.duration_group_std);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Block duration','FontName','Arial','FontSize',12); 
ylim([0 (max(Group_Results.duration_group_mean)+min(Group_Results.duration_group_mean))]);
xlim([0 length(Group_Results.duration_group_mean)+1]);

%% Plot correct sequences duration
Group_Results.seq_group_mean = nanmean(Group_Parameters.seq_group,1);
Group_Results.seq_group_std = nanstd(Group_Parameters.seq_group,0,1)/sqrt(N);

subplot(2,2,2); 
errorbar(1:1:length(Group_Results.seq_group_mean),Group_Results.seq_group_mean,Group_Results.seq_group_std); 
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12); 
ylabel('Correct Sequences duration','FontName','Arial','FontSize',12); 
ylim([0 (max(Group_Results.seq_group_mean)+min(Group_Results.seq_group_mean))]);
xlim([0 length(Group_Results.seq_group_mean)+1]);

%% Number of correct sequences
Group_Results.seq_group_num_mean = nanmean(Group_Parameters.seq_group_num,1);
Group_Results.seq_group_num_std = nanstd(Group_Parameters.seq_group_num,0,1)/sqrt(N);

subplot(2,2,3);  plot(Group_Results.seq_group_num_mean,'+','MarkerSize', 6);
errorbar(1:length(Group_Results.seq_group_num_mean),Group_Results.seq_group_num_mean,Group_Results.seq_group_num_std)
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Correct Sequences','FontName','Arial','FontSize',12);
ylim([0 (max(Group_Results.seq_group_num_mean))+3]);
xlim([0 length(Group_Results.seq_group_num_mean)+1]);

%% Plot Interkeys interval
Group_Results.key_group_mean = nanmean(Group_Parameters.key_group,1);
Group_Results.key_group_std = nanstd(Group_Parameters.key_group,0,1)/sqrt(N);

subplot(2,2,4)
plot(Group_Results.key_group_mean,'k.','MarkerSize', 10); hold on
errorbar(1:1:length(Group_Results.key_group_mean),Group_Results.key_group_mean,Group_Results.key_group_std); 
xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Interkeys interval','FontName','Arial','FontSize',12);
ylim([0 max(Group_Results.key_group_mean+0.1)])
xlim([0 length(Group_Results.key_group_mean)+1]);

%% save
saveas(gcf,[path 'CorrectSeq_Duration_Group.' 'fig']);
saveas(gcf,[path 'CorrectSeq_Duration_Group.' 'png']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 2:                               %%%
%%% IKI_per_trial: Interkey Interval on each correct sequence. This type%%%
%%% of plot is also known to the lab as "the learning curve"            %%%
%%% It only plots the mean interval of correct sequences one after another.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2); set(gcf,'Color','white'); box OFF; hold on; sgtitle([titulo ' - crudo'])

Group_Results.iki_group_mean = nanmean(Group_Parameters.iki_group,1);              
Group_Results.iki_group_std = nanstd(Group_Parameters.iki_group,0,1)/sqrt(N);               

barra=max(Group_Results.iki_group_mean(:)+0.1);
if strcmp(paradigm_flag,'teclas')==1
    for i=1:12:length(Group_Results.iki_group_mean)
        %error estandar
        x_vector = [i:i+11, fliplr(i:i+11)];
        x_vector2=[Group_Results.iki_group_mean(i:i+11)+Group_Results.iki_group_std(i:i+11),fliplr(Group_Results.iki_group_mean(i:i+11)-Group_Results.iki_group_std(i:i+11))];
        patch = fill(x_vector, x_vector2, [128 193 219]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 1);
        hold on;

        %media
        plot(i:i+11,Group_Results.iki_group_mean(i:i+11),'k','LineWidth',0.5);
        hold on;

        %barras de rest
        bar(i+11.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
        hold on;
    end
    
else %Cuando corta por tiempo
    
    for i=1:max_seq:length(Group_Results.iki_group_mean)
        %error estandar
        x_vector = [i:(i+max_seq-1), fliplr(i:(i+max_seq-1))];
        x_vector2=[Group_Results.iki_group_mean(i:(i+max_seq-1))+Group_Results.iki_group_std(i:(i+max_seq-1)),fliplr(Group_Results.iki_group_mean(i:(i+max_seq-1)) - Group_Results.iki_group_std(i:(i+max_seq-1)))];
        
        %este contador me va a permitir no graficar los errores de los NaNs y poder cerrar los patch para rellenarlos
        cont=1;
        while ~isnan(x_vector2(cont))
            cont=cont+1; 
        end
        cont=cont-1;
        x_vector2(isnan(x_vector2))=[];
        x_vector=[x_vector(1:cont) x_vector((end-cont+1):end)];
                
        patch = fill(x_vector, x_vector2, [128 193 219]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 1);
       
        hold on;

        %media
        plot(i:i+max_seq-1,Group_Results.iki_group_mean(i:(i+max_seq-1)),'k','LineWidth',0.5);
        hold on;

        %barras de rest
        bar(i+(max_seq-1)+0.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
        hold on;
    end
    
end
xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Interkeys interval','FontName','Arial','FontSize',12);
ylim([min(Group_Results.iki_group_mean-0.1) max(Group_Results.iki_group_mean+0.1)])
xlim([0 length(Group_Results.iki_group_mean)+1]);


saveas(gcf,[path 'CurvaLearning_Group.' 'fig']);
saveas(gcf,[path 'CurvaLearning_Group.' 'png']);

clear x_vector; clear x_vector2; clear barra; clear i; clear patch; clear cont; clear max_seq;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% FIGURE 3: It's also included the filtered version of IKI_per_trial  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3); set(gcf,'Color','white'); box OFF; hold on; %sgtitle([titulo ' - filtrado'])

Group_Results.iki_group_filt_mean = nanmean(Group_Parameters.iki_group_filt,1);              
Group_Results.iki_group_filt_std = nanstd(Group_Parameters.iki_group_filt,0,1)/sqrt(N);               

barra=max(Group_Results.iki_group_filt_mean(:)+0.1); 
if strcmp(paradigm_flag,'teclas')==1
    for i=1:12:length(Group_Results.iki_group_filt_mean)
        %error estandar
        x_vector = [i:i+11, fliplr(i:i+11)];
        x_vector2=[Group_Results.iki_group_filt_mean(i:i+11)+Group_Results.iki_group_filt_std(i:i+11),fliplr(Group_Results.iki_group_filt_mean(i:i+11)-Group_Results.iki_group_filt_std(i:i+11))];
        patch = fill(x_vector, x_vector2, [128 193 219]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 1);
        hold on;

        %media
        plot(i:i+11,Group_Results.iki_group_filt_mean(i:i+11),'k','LineWidth',0.5);
        hold on;

        %barras de rest
        bar(i+11.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
        hold on;
    end
    
else %Cuando corta por tiempo
    
    for i=1:max_seq:length(Group_Results.iki_group_filt_mean)
        %error estandar
        x_vector = [i:(i+max_seq-1), fliplr(i:(i+max_seq-1))];
        x_vector2=[Group_Results.iki_group_filt_mean(i:(i+max_seq-1))+Group_Results.iki_group_filt_std(i:(i+max_seq-1)),fliplr(Group_Results.iki_group_filt_mean(i:(i+max_seq-1)) - Group_Results.iki_group_filt_std(i:(i+max_seq-1)))];
        
        %este contador me va a permitir no graficar los errores de los NaNs y poder cerrar los patch para rellenarlos
        cont=1;
        while ~isnan(x_vector2(cont))
            cont=cont+1; 
        end
        cont=cont-1;
        x_vector2(isnan(x_vector2))=[];
        x_vector=[x_vector(1:cont) x_vector((end-cont+1):end)];
                
        patch = fill(x_vector, x_vector2, [128 193 219]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 1);
       
        hold on;

        %media
        plot(i:i+max_seq-1,Group_Results.iki_group_filt_mean(i:(i+max_seq-1)),'k','LineWidth',0.5);
        hold on;

        %barras de rest
        bar(i+(max_seq-1)+0.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
        hold on;
    end
    
end
xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Interkeys interval','FontName','Arial','FontSize',12);
%GC 18/1/23
if Group_Parameters.flag_norm==0
    %misma escala q crudo
    ylim([min(Group_Results.iki_group_mean-0.1) max(Group_Results.iki_group_mean+0.1)])
    norm_titulo='sin norm';
else
    if strcmp(Group_Parameters.flag_tipo_norm,'Z')
        ylim([-3 3])
    else %norm 01
        ylim([0 1])
    end
    norm_titulo=Group_Parameters.flag_tipo_norm;
end
xlim([0 length(Group_Results.iki_group_mean)+1]);
title([titulo ' - Curva de Learning - Datos filtrados - ' norm_titulo])

clear x_vector; clear x_vector2; clear barra; clear i; clear patch; clear cont; clear max_seq; clear norm_titulo;

saveas(gcf,[path 'CurvaLearning_filt_Group.' 'fig']);
saveas(gcf,[path 'CurvaLearning_filt_Group.' 'png']);

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        FIGURE 4:                                    %%%
%%%                                                                     %%%
%%%               Plots Micro Gains as raw data.                        %%%
%%%                                                                     %%%
%%% Acum MOGS: acumulative sum of Micro Offline Gains per block         %%%
%%% Acum MONGS: acumulative sum of Micro Online Gains per block         %%%
%%% Acum TL: acumulative sum of Total Learning per block                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(4); set(gcf,'Color','white'); box OFF; hold on; sgtitle([titulo ' - crudo'])

%% MOGS acumulado
Group_Results.mogs_group_acumulado_mean = nanmean(Group_Parameters.mogs_acumulado_group,1);                                       
Group_Results.mogs_group_acumulado_std = nanstd(Group_Parameters.mogs_acumulado_group,0,1)/sqrt(N);    

subplot(1,4,3)
plot(Group_Results.mogs_group_acumulado_mean,'r.','MarkerSize', 15); hold on;

for i=1:size(Group_Parameters.mogs_acumulado_group,1)
    s=scatter(1:size(Group_Parameters.mogs_acumulado_group,2),Group_Parameters.mogs_acumulado_group(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.mogs_group_acumulado_mean)]);
yline(0);

%% MONGS acumulado
Group_Results.mongs_group_acumulado_mean = nanmean(Group_Parameters.mongs_acumulado_group,1);                                       
Group_Results.mongs_group_acumulado_std = nanstd(Group_Parameters.mongs_acumulado_group,0,1)/sqrt(N);    

subplot(1,4,2)
plot(Group_Results.mongs_group_acumulado_mean,'b.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.mongs_acumulado_group,1)
    s=scatter(1:size(Group_Parameters.mongs_acumulado_group,2),Group_Parameters.mongs_acumulado_group(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.mongs_group_acumulado_mean)]);
yline(0);

%% TOTAL LEARNING
Group_Results.TL_group_acumulado_mean = nanmean(Group_Parameters.TL_acumulado_group,1);                                       
Group_Results.TL_group_acumulado_std = nanstd(Group_Parameters.TL_acumulado_group,0,1)/sqrt(N);  

subplot(1,4,1)
plot(Group_Results.TL_group_acumulado_mean,'k.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.TL_acumulado_group,1)
    s=scatter(1:size(Group_Parameters.TL_acumulado_group,2),Group_Parameters.TL_acumulado_group(i,:),'k','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.TL_group_acumulado_mean)]);
yline(0);

%% Grafico completo
subplot(1,4,4)

%mogs
    %error estandar
    x_vector = [1:length(Group_Results.mogs_group_acumulado_mean), fliplr(1:length(Group_Results.mogs_group_acumulado_mean))];
    patch = fill(x_vector, [Group_Results.mogs_group_acumulado_mean + Group_Results.mogs_group_acumulado_std , fliplr(Group_Results.mogs_group_acumulado_mean - Group_Results.mogs_group_acumulado_std)], [243 169 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mogs_group_acumulado_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.mongs_group_acumulado_mean), fliplr(1:length(Group_Results.mongs_group_acumulado_mean))];
    patch = fill(x_vector, [Group_Results.mongs_group_acumulado_mean + Group_Results.mongs_group_acumulado_std , fliplr(Group_Results.mongs_group_acumulado_mean - Group_Results.mongs_group_acumulado_std)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mongs_group_acumulado_mean,'b','LineWidth',0.5);

%Total Learning

    %error estandar
    x_vector = [1:length(Group_Results.TL_group_acumulado_mean), fliplr(1:length(Group_Results.TL_group_acumulado_mean))];
    patch = fill(x_vector, [Group_Results.TL_group_acumulado_mean + Group_Results.TL_group_acumulado_std , fliplr(Group_Results.TL_group_acumulado_mean - Group_Results.TL_group_acumulado_std)], [200 200 200]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.5);
    hold on;
    
    %media
    plot(Group_Results.TL_group_acumulado_mean,'k','LineWidth',0.5);

ylim([-1 1])
yline(0);
xlabel('Blocks')
legend('','MOGS','', 'MONGS', '', 'Total Learning')

clear x_vector; clear i; clear patch; 

saveas(gcf,[path '_MicroGains_acum_crudo_Group.' 'fig']);
saveas(gcf,[path '_MicroGains_acum_crudo_Group.' 'png']);
    
 %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                          FIGURE 5                                   %%%
%%%             Plot MOGs no acumulativo crudo                          %%%
%%%                                                                     %%%
%%% Not Acum MOGS: Micro Offline Gains per block                        %%%
%%% Not Acum MONGS: Micro Online Gains per block                        %%%
%%% Not Acum TL: Total Learning per block                               %%%
%%%                                                                     %%%
%%%                         GC 7/3/23                                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5); set(gcf,'Color','white'); box OFF; hold on; sgtitle([titulo ' - crudo - no acum'])

Group_Results.mogs_group_mean = nanmean(Group_Parameters.mogs_group,1);                                       
Group_Results.mogs_group_std = nanstd(Group_Parameters.mogs_group,0,1)/sqrt(N);               

subplot(1,4,3)
plot(Group_Results.mogs_group_mean,'r.','MarkerSize', 15); hold on;

for i=1:size(Group_Parameters.mogs_group,1)
    s=scatter(1:size(Group_Parameters.mogs_group,2),Group_Parameters.mogs_group(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.mogs_group_mean)]);
yline(0);

%% MONGS no acumulado

Group_Results.mongs_group_mean = nanmean(Group_Parameters.mongs_group,1);                                       
Group_Results.mongs_group_std = nanstd(Group_Parameters.mongs_group,0,1)/sqrt(N);    

subplot(1,4,2)
plot(Group_Results.mongs_group_mean,'b.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.mongs_group,1)
    s=scatter(1:size(Group_Parameters.mongs_group,2),Group_Parameters.mongs_group(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.mongs_group_mean)]);
yline(0);

%% TOTAL LEARNING

Group_Results.TL_group_mean = nanmean(Group_Parameters.TL_group,1);                                       
Group_Results.TL_group_std = nanstd(Group_Parameters.TL_group,0,1)/sqrt(N);  

subplot(1,4,1)
plot(Group_Results.TL_group_mean,'k.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.TL_group,1)
    s=scatter(1:size(Group_Parameters.TL_group,2),Group_Parameters.TL_group(i,:),'k','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.TL_group_mean)]);
yline(0);

%% Grafico completo

subplot(1,4,4)

%mogs
    %error estandar
    x_vector = [1:length(Group_Results.mogs_group_mean), fliplr(1:length(Group_Results.mogs_group_mean))];
    patch = fill(x_vector, [Group_Results.mogs_group_mean + Group_Results.mogs_group_std , fliplr(Group_Results.mogs_group_mean - Group_Results.mogs_group_std)], [243 169 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mogs_group_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.mongs_group_mean), fliplr(1:length(Group_Results.mongs_group_mean))];
    patch = fill(x_vector, [Group_Results.mongs_group_mean + Group_Results.mongs_group_std , fliplr(Group_Results.mongs_group_mean - Group_Results.mongs_group_std)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mongs_group_mean,'b','LineWidth',0.5);

%Total Learning

    %error estandar
    x_vector = [1:length(Group_Results.TL_group_mean), fliplr(1:length(Group_Results.TL_group_mean))];
    patch = fill(x_vector, [Group_Results.TL_group_mean + Group_Results.TL_group_std , fliplr(Group_Results.TL_group_mean - Group_Results.TL_group_std)], [200 200 200]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.5);
    hold on;
    
    %media
    plot(Group_Results.TL_group_mean,'k','LineWidth',0.5);

    ylim([-1 1])
    yline(0);
    xlabel('Blocks')
    legend('','MOGS','', 'MONGS', '', 'Total Learning')

clear x_vector; clear i; clear patch; 

saveas(gcf,[path '_MicroGains_crudo_Group.' 'fig']);
saveas(gcf,[path '_MicroGains_crudo_Group.' 'png']);

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        FIGURE 6:                                    %%%
%%%                                                                     %%%
%%%               Plots Micro Gains as filtered data.                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6); set(gcf,'Color','white'); box OFF; hold on; %sgtitle([titulo ' - filtrado'])

%% MOGS acumulado
Group_Results.mogs_group_acumulado_filt_mean = nanmean(Group_Parameters.mogs_acumulado_group_filt,1);                                       
Group_Results.mogs_group_acumulado_filt_std = nanstd(Group_Parameters.mogs_acumulado_group_filt,0,1)/sqrt(N);    

subplot(1,4,3)
plot(Group_Results.mogs_group_acumulado_filt_mean,'r.','MarkerSize', 15); hold on;

for i=1:size(Group_Parameters.mogs_acumulado_group_filt,1)
    s=scatter(1:size(Group_Parameters.mogs_acumulado_group_filt,2),Group_Parameters.mogs_acumulado_group_filt(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
%GC 18/1/23
if Group_Parameters.flag_norm==0
    %misma escala q crudo
    ylim([-1 1])
else
    if strcmp(Group_Parameters.flag_tipo_norm,'Z')
        ylim([-10 10])
    else %norm 01
        ylim([-3 3])
    end
end
xlim([0 length(Group_Results.mogs_group_acumulado_filt_mean)]);
yline(0);

%% MONGS acumulado
Group_Results.mongs_group_acumulado_filt_mean = nanmean(Group_Parameters.mongs_acumulado_group_filt,1);                                       
Group_Results.mongs_group_acumulado_filt_std = nanstd(Group_Parameters.mongs_acumulado_group_filt,0,1)/sqrt(N);    

subplot(1,4,2)
plot(Group_Results.mongs_group_acumulado_filt_mean,'b.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.mongs_acumulado_group_filt,1)
    s=scatter(1:size(Group_Parameters.mongs_acumulado_group_filt,2),Group_Parameters.mongs_acumulado_group_filt(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
%GC 18/1/23
if Group_Parameters.flag_norm==0
    %misma escala q crudo
    ylim([-1 1])
else
    if strcmp(Group_Parameters.flag_tipo_norm,'Z')
        ylim([-10 10])
    else %norm 01
        ylim([-3 3])
    end
end
xlim([0 length(Group_Results.mongs_group_acumulado_filt_mean)]);
yline(0);

%% TOTAL LEARNING
Group_Results.TL_group_acumulado_filt_mean = nanmean(Group_Parameters.TL_acumulado_group_filt,1);                                       
Group_Results.TL_group_acumulado_filt_std = nanstd(Group_Parameters.TL_acumulado_group_filt,0,1)/sqrt(N);  

subplot(1,4,1)
plot(Group_Results.TL_group_acumulado_filt_mean,'k.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.TL_acumulado_group_filt,1)
    s=scatter(1:size(Group_Parameters.TL_acumulado_group_filt,2),Group_Parameters.TL_acumulado_group_filt(i,:),'k','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
%GC 18/1/23
if Group_Parameters.flag_norm==0
    %misma escala q crudo
    ylim([-1 1])
else
    if strcmp(Group_Parameters.flag_tipo_norm,'Z')
        ylim([-10 10])
    else %norm 01
        ylim([-3 3])
    end
end
xlim([0 length(Group_Results.TL_group_acumulado_filt_mean)]);
yline(0);

%% Grafico completo
subplot(1,4,4)

%mogs
    %error estandar
    x_vector = [1:length(Group_Results.mogs_group_acumulado_filt_mean), fliplr(1:length(Group_Results.mogs_group_acumulado_filt_mean))];
    patch = fill(x_vector, [Group_Results.mogs_group_acumulado_filt_mean + Group_Results.mogs_group_acumulado_filt_std , fliplr(Group_Results.mogs_group_acumulado_filt_mean - Group_Results.mogs_group_acumulado_filt_std)], [243 169 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mogs_group_acumulado_filt_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.mongs_group_acumulado_filt_mean), fliplr(1:length(Group_Results.mongs_group_acumulado_filt_mean))];
    patch = fill(x_vector, [Group_Results.mongs_group_acumulado_filt_mean + Group_Results.mongs_group_acumulado_filt_std , fliplr(Group_Results.mongs_group_acumulado_filt_mean - Group_Results.mongs_group_acumulado_filt_std)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mongs_group_acumulado_filt_mean,'b','LineWidth',0.5);

%Total Learning

    %error estandar
    x_vector = [1:length(Group_Results.TL_group_acumulado_filt_mean), fliplr(1:length(Group_Results.TL_group_acumulado_filt_mean))];
    patch = fill(x_vector, [Group_Results.TL_group_acumulado_filt_mean + Group_Results.TL_group_acumulado_filt_std , fliplr(Group_Results.TL_group_acumulado_filt_mean - Group_Results.TL_group_acumulado_filt_std)], [200 200 200]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.5);
    hold on;
    
    %media
    plot(Group_Results.TL_group_acumulado_filt_mean,'k','LineWidth',0.5);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    %misma escala q crudo
    ylim([-1 1])
    norm_titulo='sin norm';
else
    if strcmp(Group_Parameters.flag_tipo_norm,'Z')
        ylim([-10 10])
    else %norm 01
        ylim([-3 3])
    end
    norm_titulo=Group_Parameters.flag_tipo_norm;
end
sgtitle([titulo ' - Datos filtrados - ' norm_titulo])
yline(0);
xlabel('Blocks')
legend('','MOGS','', 'MONGS', '', 'Total Learning')

clear x_vector; clear i; clear patch; clear norm_titulo;

saveas(gcf,[path '_MicroGains_filt_acum_Group.' 'fig']);
saveas(gcf,[path '_MicroGains_filt_acum_Group.' 'png']);

 %% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                          FIGURE 7                                   %%%
%%%             Plot MOGs no acumulativo filtrado                       %%%
%%%                                                                     %%%
%%% Not Acum MOGS: Micro Offline Gains per block                        %%%
%%% Not Acum MONGS: Micro Online Gains per block                        %%%
%%% Not Acum TL: Total Learning per block                               %%%
%%%                                                                     %%%
%%%                         GC 7/3/23                                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(7); set(gcf,'Color','white'); box OFF; hold on; %sgtitle([titulo ' - filt - 01 - no acum'])

Group_Results.mogs_group_filt_mean = nanmean(Group_Parameters.mogs_group_filt,1);                                       
Group_Results.mogs_group_filt_std = nanstd(Group_Parameters.mogs_group_filt,0,1)/sqrt(N);               

subplot(1,4,3)
plot(Group_Results.mogs_group_filt_mean,'r.','MarkerSize', 15); hold on;

for i=1:size(Group_Parameters.mogs_group_filt,1)
    s=scatter(1:size(Group_Parameters.mogs_group_filt,2),Group_Parameters.mogs_group_filt(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.mogs_group_filt_mean)]);
yline(0);

%% MONGS no acumulado

Group_Results.mongs_group_filt_mean = nanmean(Group_Parameters.mongs_group_filt,1);                                       
Group_Results.mongs_group_filt_std = nanstd(Group_Parameters.mongs_group_filt,0,1)/sqrt(N);    

subplot(1,4,2)
plot(Group_Results.mongs_group_filt_mean,'b.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.mongs_group_filt,1)
    s=scatter(1:size(Group_Parameters.mongs_group_filt,2),Group_Parameters.mongs_group_filt(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.mongs_group_filt_mean)]);
yline(0);

%% TOTAL LEARNING

Group_Results.TL_group_filt_mean = nanmean(Group_Parameters.TL_group_filt,1);                                       
Group_Results.TL_group_filt_std = nanstd(Group_Parameters.TL_group_filt,0,1)/sqrt(N);  

subplot(1,4,1)
plot(Group_Results.TL_group_filt_mean,'k.','MarkerSize',15); hold on;

for i=1:size(Group_Parameters.TL_group_filt,1)
    s=scatter(1:size(Group_Parameters.TL_group_filt,2),Group_Parameters.TL_group_filt(i,:),'k','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
ylim([-1 1])
xlim([0 length(Group_Results.TL_group_filt_mean)]);
yline(0);

%% Grafico completo

subplot(1,4,4)

%mogs
    %error estandar
    x_vector = [1:length(Group_Results.mogs_group_filt_mean), fliplr(1:length(Group_Results.mogs_group_filt_mean))];
    patch = fill(x_vector, [Group_Results.mogs_group_filt_mean + Group_Results.mogs_group_filt_std , fliplr(Group_Results.mogs_group_filt_mean - Group_Results.mogs_group_filt_std)], [243 169 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mogs_group_filt_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.mongs_group_filt_mean), fliplr(1:length(Group_Results.mongs_group_filt_mean))];
    patch = fill(x_vector, [Group_Results.mongs_group_filt_mean + Group_Results.mongs_group_filt_std , fliplr(Group_Results.mongs_group_filt_mean - Group_Results.mongs_group_filt_std)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.mongs_group_filt_mean,'b','LineWidth',0.5);

%Total Learning

    %error estandar
    x_vector = [1:length(Group_Results.TL_group_filt_mean), fliplr(1:length(Group_Results.TL_group_filt_mean))];
    patch = fill(x_vector, [Group_Results.TL_group_filt_mean + Group_Results.TL_group_filt_std , fliplr(Group_Results.TL_group_filt_mean - Group_Results.TL_group_filt_std)], [200 200 200]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.5);
    hold on;
    
    %media
    plot(Group_Results.TL_group_filt_mean,'k','LineWidth',0.5);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    %misma escala q crudo
    ylim([-1 1])
    norm_titulo='sin norm';
else
    if strcmp(Group_Parameters.flag_tipo_norm,'Z')
        ylim([-10 10])
    else %norm 01
        ylim([-3 3])
    end
    norm_titulo=Group_Parameters.flag_tipo_norm;
end
    yline(0);
    xlabel('Blocks')
    legend('','MOGS','', 'MONGS', '', 'Total Learning')

sgtitle([titulo ' - no acum - Datos filtrados - ' norm_titulo])
clear x_vector; clear i; clear patch; 

saveas(gcf,[path '_MicroGains_filt_Group.' 'fig']);
saveas(gcf,[path '_MicroGains_filt_Group.' 'png']);


%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                            FIGURE 8                                 %%%
%%%                  Micro Micro Gains as Raw data                      %%%
%%%                                                                     %%%
%%% MicroMogs Not Acum: Micro offline gains per trial                   %%%
%%% MicroMongs Not Acum: Micro online gains per trial                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(8); set(gcf,'Color','white'); box OFF; hold on; sgtitle([titulo ' - crudo - no acum'])

%MICRO MOGS no acumulado
subplot(3,1,1)
Group_Results.micro_mogs_group_mean=nanmean(Group_Parameters.micro_mogs_group);
Group_Results.micro_mogs_group_std=nanstd(Group_Parameters.micro_mogs_group)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mogs_group,1)
    s=scatter(1:size(Group_Parameters.micro_mogs_group,2),Group_Parameters.micro_mogs_group(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mogs_group_mean,'k.','MarkerSize',10);
for j=1:11:length(Group_Results.micro_mogs_group_mean)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MOGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mogs_group_mean)]);
ylim([-2 2])
yline(0);


% MICRO MONGS no acumulado
subplot(3,1,2)
Group_Results.micro_mongs_group_mean=nanmean(Group_Parameters.micro_mongs_group);
Group_Results.micro_mongs_group_std=nanstd(Group_Parameters.micro_mongs_group)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mongs_group,1)
    s=scatter(1:size(Group_Parameters.micro_mongs_group,2),Group_Parameters.micro_mongs_group(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mongs_group_mean,'k.','MarkerSize',10);
for j=1:12:length(Group_Results.micro_mongs_group_mean)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MONGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mongs_group_mean)]);
ylim([-2 2])
yline(0);

% GRAFICO COMPLETO No acumulado
subplot(3,1,3)

% para que sean comparables mogs y mongs debo agregar un NaN al final de
% cada bloque de mogs asi ambos tienen 12 elementos en cada bloque
aux_micro_mogs_mean=[];
for i=1:11:(length(Group_Results.micro_mogs_group_mean))
    aux_micro_mogs_mean=[aux_micro_mogs_mean Group_Results.micro_mogs_group_mean(i:(i-1)+11) NaN];
end

%mogs
    %error estandar --- GC 28/2/23
%     x_vector = [1:length(Group_Results.micro_mogs_group_mean), fliplr(1:length(Group_Results.micro_mogs_group_mean))];
%     patch = fill(x_vector, [Group_Results.micro_mogs_group_mean + Group_Results.micro_mogs_group_std , fliplr(Group_Results.micro_mogs_group_mean - Group_Results.micro_mogs_group_std)], [243 169 114]./255);
%     set(patch, 'edgecolor', 'none');
%     set(patch, 'FaceAlpha', 0.3);
%     hold on;
    nan_cont=0;
    for i=1:11:length(Group_Results.micro_mogs_group_mean)
        x_vector = [(i+nan_cont):((i+nan_cont-1)+11), fliplr((i+nan_cont):((i+nan_cont-1)+11))];
        patch = fill(x_vector, [Group_Results.micro_mogs_group_mean(i:(i-1)+11) + Group_Results.micro_mogs_group_std(i:(i-1)+11) , fliplr(Group_Results.micro_mogs_group_mean(i:(i-1)+11) - Group_Results.micro_mogs_group_std(i:(i-1)+11))], [243 169 114]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 0.3);
        hold on;
        nan_cont=nan_cont+1;
    end
    %media
    plot(aux_micro_mogs_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.micro_mongs_group_mean), fliplr(1:length(Group_Results.micro_mongs_group_mean))];
    patch = fill(x_vector, [Group_Results.micro_mongs_group_mean + Group_Results.micro_mongs_group_std , fliplr(Group_Results.micro_mongs_group_mean - Group_Results.micro_mongs_group_std)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.micro_mongs_group_mean,'b','LineWidth',0.5);
    ylim([-0.5 0.5])
    yline(0)
    
clear aux_micro_mogs_mean; clear nan_cont
saveas(gcf,[path '_MicroMicroGains_crudo_Group.' 'fig']);
saveas(gcf,[path '_MicroMicroGains_crudo_Group.' 'png']);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 9 -Raw                           %%%
%%% MicroMogs Acum: sum of Micro Offline gains per trial                %%%
%%% MicroMongs Acum: sum of Micro Online gains per trial                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(9); set(gcf,'Color','white'); box OFF; hold on; sgtitle([titulo ' - crudo - acum'])

%MICRO MOGS acumulado
subplot(3,1,1)
Group_Results.micro_mogs_acumulado_group_mean=nanmean(Group_Parameters.micro_mogs_acumulado_group);
Group_Results.micro_mogs_acumulado_group_std=nanstd(Group_Parameters.micro_mogs_acumulado_group)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mogs_acumulado_group,1)
    s=scatter(1:size(Group_Parameters.micro_mogs_acumulado_group,2),Group_Parameters.micro_mogs_acumulado_group(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mogs_acumulado_group_mean,'k.','MarkerSize',10);
for j=1:11:length(Group_Results.micro_mogs_acumulado_group_mean)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MOGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mogs_acumulado_group_mean)]);
ylim([-2.5 2.5])
yline(0);


% MICRO MONGS acumulado
subplot(3,1,2)
Group_Results.micro_mongs_acumulado_group_mean=nanmean(Group_Parameters.micro_mongs_acumulado_group);
Group_Results.micro_mongs_acumulado_group_std=nanstd(Group_Parameters.micro_mongs_acumulado_group)/size(Group_Parameters.micro_mongs_acumulado_group,1); %error estandar

for i=1:size(Group_Parameters.micro_mongs_acumulado_group,1)
    s=scatter(1:size(Group_Parameters.micro_mongs_acumulado_group,2),Group_Parameters.micro_mongs_acumulado_group(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mongs_acumulado_group_mean,'k.','MarkerSize',10);
for j=1:12:length(Group_Results.micro_mongs_acumulado_group_mean)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MONGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mongs_acumulado_group_mean)]);
ylim([-2.5 2.5])
yline(0);

% GRAFICO COMPLETO acumulado
subplot(3,1,3)

% para que sean comparables mogs y mongs debo agregar un NaN al final de
% cada bloque de mogs asi ambos tienen 12 elementos en cada bloque
aux_micro_mogs_mean=[];
for i=1:11:(length(Group_Results.micro_mogs_acumulado_group_mean))
    aux_micro_mogs_mean=[aux_micro_mogs_mean Group_Results.micro_mogs_acumulado_group_mean(i:(i-1)+11) NaN];
end

%mogs
    %error estandar - GC 28/2/23
%     x_vector = [1:length(Group_Results.micro_mogs_acumulado_group_mean), fliplr(1:length(Group_Results.micro_mogs_acumulado_group_mean))];
%     patch = fill(x_vector, [Group_Results.micro_mogs_acumulado_group_mean + Group_Results.micro_mogs_acumulado_group_std , fliplr(Group_Results.micro_mogs_acumulado_group_mean - Group_Results.micro_mogs_acumulado_group_std)], [243 169 114]./255);
%     set(patch, 'edgecolor', 'none');
%     set(patch, 'FaceAlpha', 0.3);
%     hold on;
    nan_cont=0;
    for i=1:11:length(Group_Results.micro_mogs_acumulado_group_mean)
        x_vector = [(i+nan_cont):((i+nan_cont-1)+11), fliplr((i+nan_cont):((i+nan_cont-1)+11))];
        patch = fill(x_vector, [Group_Results.micro_mogs_acumulado_group_mean(i:(i-1)+11) + Group_Results.micro_mogs_acumulado_group_std(i:(i-1)+11) , ...
            fliplr(Group_Results.micro_mogs_acumulado_group_mean(i:(i-1)+11) - Group_Results.micro_mogs_acumulado_group_std(i:(i-1)+11))], [243 169 114]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 0.3);
        hold on;
        nan_cont=nan_cont+1;
    end

    %media
    plot(aux_micro_mogs_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.micro_mongs_acumulado_group_mean), fliplr(1:length(Group_Results.micro_mongs_acumulado_group_mean))];
    patch = fill(x_vector, [Group_Results.micro_mongs_acumulado_group_mean + Group_Results.micro_mongs_acumulado_group_std , fliplr(Group_Results.micro_mongs_acumulado_group_mean - Group_Results.micro_mongs_acumulado_group_std)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.micro_mongs_acumulado_group_mean,'b','LineWidth',0.5);
    ylim([-1 1])
    yline(0)
    
clear aux_micro_mogs_mean; clear nan_cont;
saveas(gcf,[path '_MicroMicroGains_acum_crudo_Group.' 'fig']);
saveas(gcf,[path '_MicroMicroGains_acum_crudo_Group.' 'png']);


%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                            FIGURE 10                                %%%
%%%             Micro Micro Gains as Filtered data                      %%%
%%%             non acumulative                                         %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(10); set(gcf,'Color','white'); box OFF; hold on; %sgtitle([titulo ' - filt - no acum'])

%MICRO MOGS no acumulado
subplot(3,1,1)
Group_Results.micro_mogs_group_mean_filt=nanmean(Group_Parameters.micro_mogs_group_filt);
Group_Results.micro_mogs_group_std_filt=nanstd(Group_Parameters.micro_mogs_group_filt)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mogs_group_filt,1)
    s=scatter(1:size(Group_Parameters.micro_mogs_group_filt,2),Group_Parameters.micro_mogs_group_filt(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mogs_group_mean_filt,'k.','MarkerSize',10);
for j=1:11:length(Group_Results.micro_mogs_group_mean_filt)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MOGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mogs_group_mean_filt)]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-1 1])
else %aca solo hay normalización Zscore
    ylim([-5 5])
end
yline(0);


% MICRO MONGS no acumulado
subplot(3,1,2)
Group_Results.micro_mongs_group_mean_filt=nanmean(Group_Parameters.micro_mongs_group_filt);
Group_Results.micro_mongs_group_std_filt=nanstd(Group_Parameters.micro_mongs_group_filt)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mongs_group,1)
    s=scatter(1:size(Group_Parameters.micro_mongs_group_filt,2),Group_Parameters.micro_mongs_group_filt(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mongs_group_mean_filt,'k.','MarkerSize',10);
for j=1:12:length(Group_Results.micro_mongs_group_mean_filt)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MONGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mongs_group_mean_filt)]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-1 1])
else %aca solo hay normalización Zscore
    ylim([-5 5])
end
yline(0);

% GRAFICO COMPLETO No acumulado
subplot(3,1,3)

% para que sean comparables mogs y mongs debo agregar un NaN al final de
% cada bloque de mogs asi ambos tienen 12 elementos en cada bloque
aux_micro_mogs_mean=[];
for i=1:11:(length(Group_Results.micro_mogs_group_mean_filt))
    aux_micro_mogs_mean=[aux_micro_mogs_mean Group_Results.micro_mogs_group_mean_filt(i:(i-1)+11) NaN];
end

%mogs
    %error estandar -- GC 28/02/23
%     x_vector = [1:length(Group_Results.micro_mogs_group_mean_filt), fliplr(1:length(Group_Results.micro_mogs_group_mean_filt))];
%     patch = fill(x_vector, [Group_Results.micro_mogs_group_mean_filt + Group_Results.micro_mogs_group_std_filt , fliplr(Group_Results.micro_mogs_group_mean_filt - Group_Results.micro_mogs_group_std_filt)], [243 169 114]./255);
%     set(patch, 'edgecolor', 'none');
%     set(patch, 'FaceAlpha', 0.3);
%     hold on;
    nan_cont=0;
    for i=1:11:length(Group_Results.micro_mogs_group_mean_filt)
        x_vector = [(i+nan_cont):((i+nan_cont-1)+11), fliplr((i+nan_cont):((i+nan_cont-1)+11))];
        patch = fill(x_vector, [Group_Results.micro_mogs_group_mean_filt(i:(i-1)+11) + Group_Results.micro_mogs_group_std_filt(i:(i-1)+11) , ...
            fliplr(Group_Results.micro_mogs_group_mean_filt(i:(i-1)+11) - Group_Results.micro_mogs_group_std_filt(i:(i-1)+11))], [243 169 114]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 0.3);
        hold on;
        nan_cont=nan_cont+1;
    end
    %media
    plot(aux_micro_mogs_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.micro_mongs_group_mean_filt), fliplr(1:length(Group_Results.micro_mongs_group_mean_filt))];
    patch = fill(x_vector, [Group_Results.micro_mongs_group_mean_filt + Group_Results.micro_mongs_group_std_filt , fliplr(Group_Results.micro_mongs_group_mean_filt - Group_Results.micro_mongs_group_std_filt)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.micro_mongs_group_mean_filt,'b','LineWidth',0.5);

%GC 18/1/23    
if Group_Parameters.flag_norm==0
    ylim([-0.3 0.3])
    norm_titulo='sin norm';
else %aca solo hay normalización Zscore
    ylim([-1.5 1.5])
    norm_titulo='norm Z';
end
yline(0)
sgtitle([titulo ' - filt - no acum - ' norm_titulo])
    
clear aux_micro_mogs_mean; clear norm_titulo; clear nan_cont;
saveas(gcf,[path '_MicroMicroGains_flit_Group.' 'fig']);
saveas(gcf,[path '_MicroMicroGains_filt_Group.' 'png']);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 11                               %%%
%%%                 Micro Micro Gains as filtered data                  %%%
%%%                 Acumulative                                         %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(11); set(gcf,'Color','white'); box OFF; hold on; %sgtitle([titulo ' - filt - acum'])

%MICRO MOGS acumulado
subplot(3,1,1)
Group_Results.micro_mogs_acumulado_group_mean_filt=nanmean(Group_Parameters.micro_mogs_acumulado_group_filt);
Group_Results.micro_mogs_acumulado_group_std_filt=nanstd(Group_Parameters.micro_mogs_acumulado_group_filt)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mogs_acumulado_group_filt,1)
    s=scatter(1:size(Group_Parameters.micro_mogs_acumulado_group_filt,2),Group_Parameters.micro_mogs_acumulado_group_filt(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mogs_acumulado_group_mean_filt,'k.','MarkerSize',10);
for j=1:11:length(Group_Results.micro_mogs_acumulado_group_mean_filt)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MOGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mogs_acumulado_group_mean_filt)]);
%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-2 2])
else %aca solo hay normalización Zscore
    ylim([-10 10])
end
yline(0);


% MICRO MONGS acumulado
subplot(3,1,2)
Group_Results.micro_mongs_acumulado_group_mean_filt=nanmean(Group_Parameters.micro_mongs_acumulado_group_filt);
Group_Results.micro_mongs_acumulado_group_std_filt=nanstd(Group_Parameters.micro_mongs_acumulado_group_filt)/sqrt(N); %error estandar

for i=1:size(Group_Parameters.micro_mongs_acumulado_group_filt,1)
    s=scatter(1:size(Group_Parameters.micro_mongs_acumulado_group_filt,2),Group_Parameters.micro_mongs_acumulado_group_filt(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.4;
    hold on;
end

plot(Group_Results.micro_mongs_acumulado_group_mean_filt,'k.','MarkerSize',10);
for j=1:12:length(Group_Results.micro_mongs_acumulado_group_mean_filt)
     xline(j); hold on;
end 
xlabel('Trial','FontName','Arial','FontSize',12)
ylabel('Micro MONGs','FontName','Arial','FontSize',12);
xlim([0 length(Group_Results.micro_mongs_acumulado_group_mean_filt)]);
%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-2 2])
else %aca solo hay normalización Zscore
    ylim([-10 10])
end
yline(0);

% GRAFICO COMPLETO acumulado
subplot(3,1,3)

% para que sean comparables mogs y mongs debo agregar un NaN al final de
% cada bloque de mogs asi ambos tienen 12 elementos en cada bloque
aux_micro_mogs_mean=[];
for i=1:11:(length(Group_Results.micro_mogs_acumulado_group_mean_filt))
    aux_micro_mogs_mean=[aux_micro_mogs_mean Group_Results.micro_mogs_acumulado_group_mean_filt(i:(i-1)+11) NaN];
end

%mogs
    %error estandar -- GC 28/02/23
%     x_vector = [1:length(Group_Results.micro_mogs_acumulado_group_mean_filt), fliplr(1:length(Group_Results.micro_mogs_acumulado_group_mean_filt))];
%     patch = fill(x_vector, [Group_Results.micro_mogs_acumulado_group_mean_filt + Group_Results.micro_mogs_acumulado_group_std_filt , fliplr(Group_Results.micro_mogs_acumulado_group_mean_filt - Group_Results.micro_mogs_acumulado_group_std_filt)], [243 169 114]./255);
%     set(patch, 'edgecolor', 'none');
%     set(patch, 'FaceAlpha', 0.3);
%     hold on;
    nan_cont=0;
    for i=1:11:length(Group_Results.micro_mogs_acumulado_group_mean_filt)
        x_vector = [(i+nan_cont):((i+nan_cont-1)+11), fliplr((i+nan_cont):((i+nan_cont-1)+11))];
        patch = fill(x_vector, [Group_Results.micro_mogs_acumulado_group_mean_filt(i:(i-1)+11) + Group_Results.micro_mogs_acumulado_group_std_filt(i:(i-1)+11) , ...
            fliplr(Group_Results.micro_mogs_acumulado_group_mean_filt(i:(i-1)+11) - Group_Results.micro_mogs_acumulado_group_std_filt(i:(i-1)+11))], [243 169 114]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 0.3);
        hold on;
        nan_cont=nan_cont+1;
    end
    %media
    plot(aux_micro_mogs_mean,'r','LineWidth',0.5);
%mongs

  %error estandar
    x_vector = [1:length(Group_Results.micro_mongs_acumulado_group_mean_filt), fliplr(1:length(Group_Results.micro_mongs_acumulado_group_mean_filt))];
    patch = fill(x_vector, [Group_Results.micro_mongs_acumulado_group_mean_filt + Group_Results.micro_mongs_acumulado_group_std_filt , fliplr(Group_Results.micro_mongs_acumulado_group_mean_filt - Group_Results.micro_mongs_acumulado_group_std_filt)],[128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(Group_Results.micro_mongs_acumulado_group_mean_filt,'b','LineWidth',0.5);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-0.5 0.5])
    norm_titulo='sin norm';
else %aca solo hay normalización Zscore
    ylim([-3 3])
    norm_titulo='norm Z';
end
yline(0)
sgtitle([titulo ' - filt - acum - ' norm_titulo])

clear aux_micro_mogs_mean; clear norm_titulo; clear nan_cont;
saveas(gcf,[path '_MicroMicroGains_acum_filt_Group.' 'fig']);
saveas(gcf,[path '_MicroMicroGains_acum_filt_Group.' 'png']);


%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         Figure 12                                   %%%
%%% Each Block learning curve: each transition of a correct sequence is %%%
%%% represented in a vector as in [interval12 interval23 interval34 ... %%%
%%% interval45 ...]. This way, we can see how each trial was executed.  %%%
%%% This plot is similar to a learning curve but instead of separating  %%%
%%% blocks it separates sequences. It allows to see the MicroMicro Gains%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(12); set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)

Group_Results.interkey_mat_mean=nanmean(Group_Parameters.interkey_mat);
Group_Results.interkey_mat_std=nanstd(Group_Parameters.interkey_mat)/sqrt(N); %error estandar

subplot(2,1,1)
barra=max(Group_Results.interkey_mat_mean,[],'all')+0.1;
for j=1:4:size(Group_Results.interkey_mat_mean,2)
    %error estandar
    x_vector = [j:j+3, fliplr(j:j+3)];
    x_vector2=[Group_Results.interkey_mat_mean(j:j+3)+Group_Results.interkey_mat_std(j:j+3),fliplr(Group_Results.interkey_mat_mean(j:j+3)-Group_Results.interkey_mat_std(j:j+3))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;
    %secuencia
    plot(j:j+3,Group_Results.interkey_mat_mean(:,j:j+3),'k-'); hold on;
    %barras de ITI
    if mod(j-1,48)== 0 %si j cae en un rest hay que poner la barra de otro color. Hay 48= 4 transiciones x 12 secuencias
        bar(j-4+3.5,barra,1,'FaceColor',[128 193 219]./255,'EdgeColor',[128 193 219]./255);
        hold on;
    end
     bar(j+3.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
     hold on;

end
xlabel('transitions');
ylabel('time [s]');
yline(0)
title('Raw')
clear x_vector; clear x_vector2; clear patch; clear j;

Group_Results.interkey_mat_mean_filt=nanmean(Group_Parameters.interkey_mat_filt);
Group_Results.interkey_mat_std_filt=nanstd(Group_Parameters.interkey_mat_filt)/sqrt(N); %error estandar

subplot(2,1,2)
barra=max(Group_Results.interkey_mat_mean_filt,[],'all')+0.1;
for j=1:4:size(Group_Results.interkey_mat_mean_filt,2)
    %error estandar
    x_vector = [j:j+3, fliplr(j:j+3)];
    x_vector2=[Group_Results.interkey_mat_mean_filt(j:j+3)+Group_Results.interkey_mat_std_filt(j:j+3),fliplr(Group_Results.interkey_mat_mean_filt(j:j+3)-Group_Results.interkey_mat_std_filt(j:j+3))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;
    %secuencia
    plot(j:j+3,Group_Results.interkey_mat_mean_filt(:,j:j+3),'k-'); hold on;
    %barras de ITI
    if mod(j-1,48)== 0 %si j cae en un rest hay que poner la barra de otro color. Hay 48= 4 transiciones x 12 secuencias
        bar(j-4+3.5,barra,1,'FaceColor',[128 193 219]./255,'EdgeColor',[128 193 219]./255);
        hold on;
    end
     bar(j+3.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
     hold on;

end
xlabel('transitions');
ylabel('time [s]');
yline(0)
title('Filt')

%%
saveas(gcf,[path 'Curva_seq_Group.' 'fig']);
saveas(gcf,[path 'Curva_seq_Group.' 'png']);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             Figure 13                               %%%
%%%  Micro Micro Gains median value per block. Shown data is filtered.  %%%
%%%  Non acumulative values are shown if data is normalized but acumulative
%%%  values are not.                                                    %%%
%%%                             GC 6/1/23                               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(13); set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)

%MOGS NO ACUM -------------------------------------------------------------
Group_Results.mediana_MicroMogs_mean=nanmedian(Group_Parameters.mediana_MicroMOGS_group);
Group_Results.mediana_MicroMogs_std=nanstd(Group_Parameters.mediana_MicroMOGS_group)/sqrt(N); %error estandar

subplot(2,2,1)
plot(1:1:length(Group_Results.mediana_MicroMogs_mean),Group_Results.mediana_MicroMogs_mean,'+');
errorbar(1:1:length(Group_Results.mediana_MicroMogs_mean),Group_Results.mediana_MicroMogs_mean, Group_Results.mediana_MicroMogs_std);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('MicroMogs - median','FontName','Arial','FontSize',12); 
%ylim([0 (max(Group_Results.mediana_MicroMogs_mean)+min(Group_Results.mediana_MicroMogs_mean))]);
xlim([0 length(Group_Results.mediana_MicroMogs_mean)+1]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-0.15 0.15])
else
    ylim([-0.5 0.5])
end
yline(0)

%MONGS NO ACUM ------------------------------------------------------------
Group_Results.mediana_MicroMongs_mean=nanmedian(Group_Parameters.mediana_MicroMONGS_group);
Group_Results.mediana_MicroMongs_std=nanstd(Group_Parameters.mediana_MicroMONGS_group)/sqrt(N); %error estandar

subplot(2,2,2)
plot(1:1:length(Group_Results.mediana_MicroMongs_mean),Group_Results.mediana_MicroMongs_mean,'+');
errorbar(1:1:length(Group_Results.mediana_MicroMongs_mean),Group_Results.mediana_MicroMongs_mean, Group_Results.mediana_MicroMongs_std);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('MicroMongs - median','FontName','Arial','FontSize',12); 
%ylim([0 (max(Group_Results.mediana_MicroMongs_mean)+min(Group_Results.mediana_MicroMongs_mean))]);
xlim([0 length(Group_Results.mediana_MicroMongs_mean)+1]);

%GC 18/1/23
if Group_Parameters.flag_norm==0
    ylim([-0.15 0.15])
else
    ylim([-0.5 0.5])
end
yline(0)

%MOGS ACUM ----------------------------------------------------------------
Group_Results.mediana_MicroMogs_acum_mean=nanmean(Group_Parameters.mediana_MicroMOGS_acum_group);
Group_Results.mediana_MicroMogs_acum_std=nanstd(Group_Parameters.mediana_MicroMOGS_acum_group)/sqrt(N); %error estandar

subplot(2,2,3)
plot(1:1:length(Group_Results.mediana_MicroMogs_acum_mean),Group_Results.mediana_MicroMogs_acum_mean,'+');
errorbar(1:1:length(Group_Results.mediana_MicroMogs_acum_mean),Group_Results.mediana_MicroMogs_acum_mean, Group_Results.mediana_MicroMogs_acum_std);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('MicroMogs - median','FontName','Arial','FontSize',12); 
title('Acum')
%ylim([0 (max(Group_Results.mediana_MicroMogs_acum_mean)+min(Group_Results.mediana_MicroMogs_acum_mean))]);
xlim([0 length(Group_Results.mediana_MicroMogs_acum_mean)+1]);
ylim([-0.5 0.5])
yline(0)

%MONGS ACUM ---------------------------------------------------------------
Group_Results.mediana_MicroMongs_acum_mean=nanmean(Group_Parameters.mediana_MicroMONGS_acum_group);
Group_Results.mediana_MicroMongs_acum_std=nanstd(Group_Parameters.mediana_MicroMONGS_acum_group)/sqrt(N); %error estandar

subplot(2,2,4)
plot(1:1:length(Group_Results.mediana_MicroMongs_acum_mean),Group_Results.mediana_MicroMongs_acum_mean,'+');
errorbar(1:1:length(Group_Results.mediana_MicroMongs_acum_mean),Group_Results.mediana_MicroMongs_acum_mean, Group_Results.mediana_MicroMongs_acum_std);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('MicroMongs - median','FontName','Arial','FontSize',12); 
title('Acum')
%ylim([0 (max(Group_Results.mediana_MicroMongs_acum_mean)+min(Group_Results.mediana_MicroMongs_acum_mean))]);
xlim([0 length(Group_Results.mediana_MicroMongs_acum_mean)+1]);
ylim([-0.5 0.5])
yline(0)

%%
saveas(gcf,[path '_Median_MicroMicroGains.' 'fig']);
saveas(gcf,[path '_Median_MicroMicroGains.' 'png']);

%%
