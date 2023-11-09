%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                       GC 15/4/2023                                  %%%
%%% Esta funcion permite analizar la data de forma grupal que fue procesada
%%% por la funcion de flor Id_runAnalysis_FJ.                           %%%
%%% Solo se centra en las ganancias, y las secuencias correctas.        %%%
%%% Parámetros:                                                         %%%
%%%         - SUJETOS: struct que contiene la data de todos los sujetos %%%
%%%         - Path: donde se van a guardar el GroupResults y las figuras%%%
%%% Como la función de flor solo procesa data cruda, este análisis grupal%%
%%% tiene la limitacion de no analizar data filtrada ni normalizada     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function Id_RunAnalysisGroup_FJ(SUJETOS,path)

% CorrectSeq_Dur
duration_group=[]; seq_group=[]; 
seq_group_num=[];key_group=[];

%Micro Gains Raw
mogs_group=[]; mogs_acumulado_group=[];
mongs_group=[]; mongs_acumulado_group=[];
TL_acumulado_group=[]; TL_group=[];

%Curva de learning
Intertap_meanxSeq_group=[];

for i=1:length(SUJETOS)
    intertap_mean=NaN(15,12); %15 bloques x 12 seq
    intertaps_aux=SUJETOS(i).S.seq_results.intertaps_correct; %matriz de 15 bloques x 59 transiciones
    for block=1:size(intertaps_aux,1) %bloques
        index=1; 
        for interval=1:5:size(intertaps_aux,2) %59 transiciones
            intertap_mean(block,index)=nanmean([intertaps_aux(block,interval) intertaps_aux(block,interval+1) intertaps_aux(block,interval+2) intertaps_aux(block,interval+3)]);
            index=index+1;
        end
    end
    intertap_mean=reshape(intertap_mean',1, []);
    SUJETOS(i).S.seq_results.Intertap_meanxSeq=intertap_mean;
end

%% Pongo los datos de cada sujeto de forma matricial. 
N=length(SUJETOS);
for i=1:length(SUJETOS)
     
    duration_group=[duration_group;SUJETOS(i).S.seq_results.GOduration];
    seq_group=[seq_group;SUJETOS(i).S.seq_results.SEQduration];
    seq_group_num=[seq_group_num;SUJETOS(i).S.seq_results.correct];
%    key_group=[key_group;SUJETOS(i).S.seq_results.Intervalmean];
    
    mogs_group=[mogs_group;SUJETOS(i).S.seq_results.micro_offline_intertaps_correct];
    mogs_acumulado_group=[mogs_acumulado_group;cumsum(SUJETOS(i).S.seq_results.micro_offline_intertaps_correct,'omitnan')];
    
    mongs_group=[mongs_group;SUJETOS(i).S.seq_results.micro_online_intertaps_correct];
    mongs_acumulado_group=[mongs_acumulado_group;cumsum(SUJETOS(i).S.seq_results.micro_online_intertaps_correct,'omitnan')];
    
    TL_group=[TL_group;SUJETOS(i).S.seq_results.total_learning_intertaps_correct];
    TL_acumulado_group=[TL_acumulado_group;cumsum(SUJETOS(i).S.seq_results.total_learning_intertaps_correct,'omitnan')];
    
    
    Intertap_meanxSeq_group=[Intertap_meanxSeq_group;SUJETOS(i).S.seq_results.Intertap_meanxSeq];
    
end

%%                             Plot figures

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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); set(gcf,'Color','white'); box OFF; hold on; %sgtitle(titulo)

subplot(2,2,1); 
Group_Results.duration_group_mean = nanmean(duration_group,1);
Group_Results.duration_group_std = nanstd(duration_group,0,1)/sqrt(N);

plot(1:1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean,'+');
errorbar(1:1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean, Group_Results.duration_group_std);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Block duration','FontName','Arial','FontSize',12); 
ylim([0 (max(Group_Results.duration_group_mean)+min(Group_Results.duration_group_mean))]);
xlim([0 length(Group_Results.duration_group_mean)+1]);

%% Plot correct sequences duration
Group_Results.seq_group_mean = nanmean(seq_group,1);
Group_Results.seq_group_std = nanstd(seq_group,0,1)/sqrt(N);

subplot(2,2,2); 
errorbar(1:1:length(Group_Results.seq_group_mean),Group_Results.seq_group_mean,Group_Results.seq_group_std); 
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12); 
ylabel('Correct Sequences duration','FontName','Arial','FontSize',12); 
ylim([0 (max(Group_Results.seq_group_mean)+min(Group_Results.seq_group_mean))]);
xlim([0 length(Group_Results.seq_group_mean)+1]);

%% Number of correct sequences
Group_Results.seq_group_num_mean = nanmean(seq_group_num,1);
Group_Results.seq_group_num_std = nanstd(seq_group_num,0,1)/sqrt(N);

subplot(2,2,3);  
plot(Group_Results.seq_group_num_mean,'+','MarkerSize', 6);
errorbar(1:length(Group_Results.seq_group_num_mean),Group_Results.seq_group_num_mean,Group_Results.seq_group_num_std)
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Correct Sequences','FontName','Arial','FontSize',12);
ylim([0 (max(Group_Results.seq_group_num_mean))+3]);
xlim([0 length(Group_Results.seq_group_num_mean)+1]);

%% save
saveas(gcf,[path 'CorrectSeq_Duration_Group.' 'fig']);
saveas(gcf,[path 'CorrectSeq_Duration_Group.' 'png']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        FIGURE 2:                                    %%%
%%%                                                                     %%%
%%%               Plots Micro Gains as raw data.                        %%%
%%%                                                                     %%%
%%% Acum MOGS: acumulative sum of Micro Offline Gains per block         %%%
%%% Acum MONGS: acumulative sum of Micro Online Gains per block         %%%
%%% Acum TL: acumulative sum of Total Learning per block                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2); set(gcf,'Color','white'); box OFF; hold on; %sgtitle([titulo ' - crudo'])

%% MOGS acumulado
Group_Results.mogs_group_acumulado_mean = nanmean(mogs_acumulado_group,1);                                       
Group_Results.mogs_group_acumulado_std = nanstd(mogs_acumulado_group,0,1)/sqrt(N);    

subplot(1,4,3)
plot(Group_Results.mogs_group_acumulado_mean,'r.','MarkerSize', 15); hold on;

for i=1:size(mogs_acumulado_group,1)
    s=scatter(1:size(mogs_acumulado_group,2),mogs_acumulado_group(i,:),'r','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
ylim([-1 1.5])
xlim([0 length(Group_Results.mogs_group_acumulado_mean)]);
yline(0);

%% MONGS acumulado
Group_Results.mongs_group_acumulado_mean = nanmean(mongs_acumulado_group,1);                                       
Group_Results.mongs_group_acumulado_std = nanstd(mongs_acumulado_group,0,1)/sqrt(N);    

subplot(1,4,2)
plot(Group_Results.mongs_group_acumulado_mean,'b.','MarkerSize',15); hold on;

for i=1:size(mongs_acumulado_group,1)
    s=scatter(1:size(mongs_acumulado_group,2),mongs_acumulado_group(i,:),'b','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
ylim([-1 1.5])
xlim([0 length(Group_Results.mongs_group_acumulado_mean)]);
yline(0);

%% TOTAL LEARNING
Group_Results.TL_group_acumulado_mean = nanmean(TL_acumulado_group,1);                                       
Group_Results.TL_group_acumulado_std = nanstd(TL_acumulado_group,0,1)/sqrt(N);  

subplot(1,4,1)
plot(Group_Results.TL_group_acumulado_mean,'k.','MarkerSize',15); hold on;

for i=1:size(TL_acumulado_group,1)
    s=scatter(1:size(TL_acumulado_group,2),TL_acumulado_group(i,:),'k','filled','MarkerEdgeAlpha',0.1);
    s.MarkerFaceAlpha = 0.1;
    hold on;
end

xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
ylim([-1 1.5])
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

ylim([-1 1.5])
yline(0);
xlabel('Blocks')
legend('','MOGS','', 'MONGS', '', 'Total Learning')

clear x_vector; clear i; clear patch; 

saveas(gcf,[path '_MicroGains_acum_crudo_Group.' 'fig']);
saveas(gcf,[path '_MicroGains_acum_crudo_Group.' 'png']);
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 3:                               %%%
%%% IKI_per_trial: Interkey Interval on each correct sequence. This type%%%
%%% of plot is also known to the lab as "the learning curve"            %%%
%%% It only plots the mean interval of correct sequences one after another.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3); set(gcf,'Color','white'); box OFF; hold on; 



Group_Results.Intertap_meanxSeq_group_mean = nanmean(Intertap_meanxSeq_group,1);              
Group_Results.Intertap_meanxSeq_group_std = nanstd(Intertap_meanxSeq_group,0,1)/sqrt(N);               

barra=max(Group_Results.Intertap_meanxSeq_group_mean(:)+0.1);

for i=1:12:length(Group_Results.Intertap_meanxSeq_group_mean)
    %error estandar
    x_vector = [i:i+11, fliplr(i:i+11)];
    x_vector2=[Group_Results.Intertap_meanxSeq_group_mean(i:i+11)+Group_Results.Intertap_meanxSeq_group_std(i:i+11),fliplr(Group_Results.Intertap_meanxSeq_group_mean(i:i+11)-Group_Results.Intertap_meanxSeq_group_std(i:i+11))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;

    %media
    plot(i:i+11,Group_Results.Intertap_meanxSeq_group_mean(i:i+11),'k','LineWidth',0.5);
    hold on;

    %barras de rest
    bar(i+11.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    hold on;
end

%% save
saveas(gcf,[path 'CurvaLearning_Group.' 'fig']);
saveas(gcf,[path 'CurvaLearning_Group.' 'png']);

%%
save([path 'Group_Results.mat'],'Group_Results');
end