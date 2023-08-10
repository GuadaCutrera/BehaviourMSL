function seq_results=Plot_Individual_Figures(seq_results,path,fname)

%En caso de que la data sea corregida por filtrado o normalización
% GC 20/5/2023
if seq_results(1,1).flag_norm==0
    titulo_norm='sin norm';
else
    titulo_norm=seq_results(1,1).flag_tipo_norm;
end
if seq_results(1,1).flag_filt ==1
    titulo_filt='filt';
else
    titulo_filt='sin filt';
end
titulo=[titulo_filt ' - ' titulo_norm];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                                                                     %%%
%%%                             FIGURE 1:                               %%%
%%% Block Duraion: Time in between start of green cross and start of the%%%
%%% red one.                                                            %%%
%%%                                                                     %%%
%%% Correct Sequence Duration: mean value of the difference of last     %%% 
%%% and first key presses of correct sequences, per block               %%%
%%%                                                                     %%%
%%% Number of correct sequences: sum of correct sequences per block     %%%
%%%                                                                     %%%
%%% Interkey Interval: mean value of interkey intervals of correct      %%%
%%% sequences per block.                                                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
figure; set(gcf,'Color','white'); box OFF; hold on;

%% Plot Block duration
subplot(2,2,1); 
% errorbar(1:1:length(seq_results.GOduration),seq_results.GOduration, seq_results.standard);
plot(1:1:length(seq_results.GOduration),seq_results.GOduration,'+');
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Block duration','FontName','Arial','FontSize',12); 
ylim([0 (max(seq_results.GOduration))+min(seq_results.GOduration)]);
xlim([0 length(seq_results.GOduration)+1]);

%% Plot correct sequences duration
subplot(2,2,2); 
errorbar(1:1:length(seq_results.SEQduration),seq_results.SEQduration,seq_results.SEQstandard); 
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12); 
ylabel('Correct Sequences duration','FontName','Arial','FontSize',12); 
ylim([0 (max(seq_results.SEQduration)+min(seq_results.SEQduration))]);
xlim([0 length(seq_results.SEQduration)+1]);

%% Number of correct sequences
subplot(2,2,3);  plot(seq_results.correct,'bo','MarkerSize', 6);
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Correct Sequences','FontName','Arial','FontSize',12);
ylim([0 (max(seq_results.correct))+3]);
xlim([0 length(seq_results.correct)+1]);
%% Plot Interkeys interval per block --- HABRIA QUE PONER UN GRÀFICO DE ESTE FILTRADO
subplot(2,2,4)
plot(seq_results.Intervalmean,'k.','MarkerSize', 12);
xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Interkeys interval','FontName','Arial','FontSize',12);
ylim([0 (max([seq_results.Interval12, seq_results.Interval23, ...
              seq_results.Interval34, seq_results.Interval45]))])
xlim([0 length(seq_results.Interval12)+1]);

%% save
saveas(gcf,[path fname(1:end-4) '_CorrectSeq_Duration.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_CorrectSeq_Duration.' 'png']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 2:                               %%%
%%% IKI_per_trial: Interkey Interval on each correct sequence. This type%%%
%%% of plot is also known to the lab as "the learning curve"            %%%
%%% It only plots the interval of correct sequences one after another.  %%%
%%%                                                                     %%%
%%% It's also included the filtered version of IKI_per_trial            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

InterKeyInterval_Plot_Individual(seq_results,titulo)
% save
saveas(gcf,[path fname(1:end-4) '_CurvaLearning.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_CurvaLearning.' 'png']);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        FIGURE 3:                                    %%%
%%%                                                                     %%%
%%%               Plots Micro Gains as raw data.                        %%%
%%%                                                                     %%%
%%% Acum MOGS: acumulative sum of Micro Offline Gains per block         %%%
%%% Acum MONGS: acumulative sum of Micro Online Gains per block         %%%
%%% Acum TL: acumulative sum of Total Learning per block                %%%
%%% Not Acum MOGS: Micro Offline Gains per block                        %%%
%%% Not Acum MONGS: Micro Online Gains per block                        %%%
%%% Not Acum TL: Total Learning per block                               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% MOGS acumulado
seq_results.MOGS_acumulativo=cumsum(seq_results.MOGS,'omitnan');
% MONGS acumulado
seq_results.MONGS_acumulativo=cumsum(seq_results.MONGS,'omitnan');
% TOTAL LEARNING acumulado
seq_results.Total_Learning_acumulativo=cumsum(seq_results.Total_Learning,'omitnan');


MicroGains_Plot_Individual(seq_results.MOGS,seq_results.MONGS,seq_results.Total_Learning,...
    seq_results.MOGS_acumulativo,seq_results.MONGS_acumulativo,seq_results.Total_Learning_acumulativo,['Micro Gains - crudo'],seq_results)

% Save
saveas(gcf,[path fname(1:end-4) '_MicroGains.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_MicroGains.' 'png']);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        FIGURE 4:                                    %%%
%%%                                                                     %%%
%%%               Plots Micro Gains as filtered data.                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt ==1

    % MOGS acumulado
    seq_results.MOGS_acumulativo_corr=cumsum(seq_results.MOGS_corr,'omitnan');
    % MONGS acumulado
    seq_results.MONGS_acumulativo_corr=cumsum(seq_results.MONGS_corr,'omitnan');
    % TOTAL LEARNING
    seq_results.Total_Learning_acumulativo_corr=cumsum(seq_results.Total_Learning_corr,'omitnan');
   
    MicroGains_Plot_Individual(seq_results.MOGS_corr,seq_results.MONGS_corr,seq_results.Total_Learning_corr,...
        seq_results.MOGS_acumulativo_corr,seq_results.MONGS_acumulativo_corr,seq_results.Total_Learning_acumulativo_corr,['Micro Gains - ' titulo],seq_results)

    % Save figure: .fig and .png
    saveas(gcf,[path fname(1:end-4) '_MicroGains_corr.' 'fig']);
    saveas(gcf,[path fname(1:end-4) '_MicroGains_corr.' 'png']);
end % end if data_corr
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                            FIGURE 5                                 %%%
%%%                  Micro Micro Gains as Raw data                      %%%
%%%                                                                     %%%
%%% MicroMogs Not Acum: Micro offline gains per trial                   %%%
%%% MicroMongs Not Acum: Micro online gains per trial                   %%%
%%% MicroMogs Acum: sum of Micro Offline gains per trial                %%%
%%% MicroMongs Acum: sum of Micro Online gains per trial                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[seq_results.MicroMogs_acum,seq_results.MicroMongs_acum]= MicroMicroGains_Plot_Individual(seq_results.MicroMOGS,seq_results.MicroMONGS,['Micro Micro Gains - crudo'],seq_results);
% Save figure: .fig and .png
saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_crudo.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_crudo.' 'png']);

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                            FIGURE 6                                 %%%
%%%             Micro Micro Gains as Filtered and/or Normalized data    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt ==1
%     [seq_results.MicroMogs_corr_acum,seq_results.MicroMongs_corr_acum]= MicroMicroGains_Plot_Individual(seq_results.MicroMOGS_corr,seq_results.MicroMONGS_corr,['Micro Micro Gains - ' titulo ],seq_results);

%     saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_corr.' 'fig']);
%     saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_corr.' 'png']);
% end %end if data_corr

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                          FIGURE 7                                   %%%
%%% Each Block learning curve: each transition of a correct sequence is %%%
%%% represented in a vector as in [interval12 interval23 interval34 ... %%%
%%% interval45 ...]. This way, we can see how each trial was executed.  %%%
%%% This plot is similar to a learning curve but instead of separating  %%%
%%% blocks it separates sequences. It allows to see the MicroMicro Gains%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure; set(gcf,'Color','white'); box OFF; hold on;
% 
% if seq_results(1,1).flag_filt ==1
%     subplot(2,1,1)
% end
% barra=max(seq_results(1,1).interkey_matrix,[],'all')+0.1;
% for j=1:4:size(seq_results(1,1).interkey_matrix,2)
%     %secuencia
%     plot(j:j+3,seq_results(1,1).interkey_matrix(:,j:j+3),'k-'); hold on;
%     %barras de ITI
%     if mod(j-1,48)== 0 %si j cae en un rest hay que poner la barra de otro color. Hay 48= 4 transiciones x 12 secuencias
%         bar(j-4+3.5,barra,1,'FaceColor',[128 193 219]./255,'EdgeColor',[128 193 219]./255);
%         hold on;
%     end
%      bar(j+3.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
%      hold on;
% 
% end
% xlabel('transitions');
% ylabel('time [s]');
% title('Raw')
% 
% if seq_results(1,1).flag_filt ==1
%     subplot(2,1,2)
%     for j=1:4:size(seq_results(1,1).interkey_matrix_corr,2)
%         %secuencia
%         plot(j:j+3,seq_results(1,1).interkey_matrix_corr(:,j:j+3),'k-'); hold on;
%         %barras de ITI
%         if mod(j-1,4*seq_results.cant_SeqBlock)== 0 %si j cae en un rest hay que poner la barra de otro color. Hay 48= 4 transiciones x 12 secuencias
%             bar(j-4+3.5,barra,1,'FaceColor',[128 193 219]./255,'EdgeColor',[128 193 219]./255);
%             hold on;
%         end
%          bar(j+3.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
%          hold on;
% 
%     end
%     xlabel('transitions');
%     ylabel('time [s]');
%     title('Filt')
% end
% %% save
% saveas(gcf,[path ['curva_seq' '.'] 'fig']);
% saveas(gcf,[path ['curva_seq' '.'] 'png']);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 8                                %%%
%%% Mean of micro micro gains per block: Based on figures 5 and 6,      %%% 
%%% mean value is calculated for each block. This meassure allows to    %%%
%%% see if the micro micro gain of the whole block is positive or not.  %%%
%%% The mean value is calculated for the acumulative and non acumulative
%%% gains if the data is not normalized. Otherwise is only calculated   %%%
%%% for the non acumulative gains.                                      %%%
%%%                                                                     %%%
%%%                            GC 29/12/22                              %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%figure; set(gcf,'Color','white'); box OFF; hold on;

%MOGS NO ACUM
seq_results(1,1).media_MicroMogs=NaN(1,size(seq_results.MicroMOGS,1));
seq_results(1,1).std_MicroMogs=NaN(1,size(seq_results.MicroMOGS,1));

for i=1:size(seq_results.MicroMOGS,1)
    seq_results(1,1).media_MicroMogs(i)=nanmean(seq_results.MicroMOGS(i,:));
    seq_results(1,1).std_MicroMogs(i)=nanstd(seq_results.MicroMOGS(i,:));
end


%MONGS NO ACUM
seq_results(1,1).media_MicroMongs=NaN(1,15);
seq_results(1,1).std_MicroMongs=NaN(1,15);

for i=1:size(seq_results.MicroMONGS,1)
    seq_results(1,1).media_MicroMongs(i)=nanmean(seq_results.MicroMONGS(i,:));
    seq_results(1,1).std_MicroMongs(i)=nanstd(seq_results.MicroMONGS(i,:));
end

MeanMicroMicro_Gains_Plot_Indivudual(seq_results(1,1).media_MicroMogs,seq_results(1,1).media_MicroMongs,seq_results(1,1).std_MicroMogs,seq_results(1,1).std_MicroMongs,seq_results)

% if seq_results(1,1).flag_norm==0 %si no esta normalizado
%     % MOGS ACUM
%     subplot(2,2,3)
%     plot(seq_results(1,1).mediana_MicroMogs_acum,'r.')
%     errorbar(seq_results(1,1).mediana_MicroMogs_acum,seq_results(1,1).std_MicroMogs_acum,'r')
%     yline(0)
%     ylabel('MicroMogs acum [s]')
%     xlabel('Block')
%     ylim([-3 3])
%     title('acum')
%     
%     % MONGS ACUM
%     subplot(2,2,4)
%     plot(seq_results(1,1).mediana_MicroMongs_acum,'b.')
%     errorbar(seq_results(1,1).mediana_MicroMongs_acum,seq_results(1,1).std_MicroMongs_acum,'b')
%     yline(0)
%     ylabel('MicroMongs acum [s]')
%     xlabel('Block')
%     ylim([-3 3])
%     title('acum')
% 
% end
%% save
saveas(gcf,[path fname(1:end-4) ['_MicroMicroGains_crudo_Median' '.'] 'fig']);
saveas(gcf,[path fname(1:end-4) ['_MicroMicroGains_curdo_Median' '.'] 'png']);


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Learning Curve by Bonstrup                      %%%
%%%                         GC 23/6/23                                  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
seq_results.IKI_visual=Visualization_LearningCurve(seq_results(1,1).IKI_per_trial,seq_results(1,1).seqduration,seq_results);
saveas(gcf,[path fname(1:end-4) '_CurvaLearningVisual.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_CurvaLearningVisual.' 'png']);

seq_results.IKI_visual_corr=Visualization_LearningCurve(seq_results(1,1).IKI_per_trial_corr,seq_results(1,1).seqduration,seq_results);
saveas(gcf,[path fname(1:end-4) '_CurvaLearningVisual_corr.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_CurvaLearningVisual_corr.' 'png']);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%              MicroMicro Gains visualization as bonstrup             %%%
%%%                             GC 6/8/23                               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[seq_results.MicroMOGS_visual,seq_results.MicroMONGS_visual] = Visualization_MicroMicroGains_Individual(seq_results.MicroMOGS,seq_results.MicroMONGS);
saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_Visual.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_Visual.' 'png']);



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 9                                %%%
%%% Sequence Duration: This is an other representation of the learning  %%%
%%% curve in which instead of ploting the mean value of the transitions %%%
%%% on each sequence, we plot the sum of them.                          %%%
%%% Subplot 1: Per trial                                                %%%
%%% Subplot 2: Per block. Mean value of the correct sequences           %%%
%%%                                                                     %%%
%%%                           GC 3/1/23                                 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% figure(9); set(gcf,'Color','white'); box OFF; hold on;
% 
% %subplot(1,2,1)
% plot(reshape(seq_results(1,1).seqduration_trial',1,[]))
% for i=1:12:noTrials
%     xline(i); %indicates a new block 
% end

% %% save
% saveas(gcf,[path fname(1:end-4) '_CorrectSeq_Duration.' 'fig']);
% saveas(gcf,[path fname(1:end-4) '_CorrectSeq_Duration.' 'png']);
end