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
figure(1); set(gcf,'Color','white'); box OFF; hold on;

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
%%
figure(2); set(gcf,'Color','white'); box OFF; hold on;

%% Datos crudos
if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt ==1 %si se corrigieron datos -> en la figura hay dos img
    subplot(2,1,1)
end
IKI_trial=reshape(seq_results(1,1).IKI_per_trial',1, []);
%noTrials=length(IKI_trial); %Number of trials: 12 seq x 15 block = 180 trials
plot(IKI_trial);
hold on

for i=1:max(seq_results.cant_SeqBlock):length(IKI_trial)
    xline(i); %indicates a new block 
end

xlabel('Trials','FontName','Arial','FontSize',12)
ylabel('Interkeys interval','FontName','Arial','FontSize',12);
ylim([0 (max([seq_results.Interval12, seq_results.Interval23, ...
              seq_results.Interval34, seq_results.Interval45]))])
xlim([0 length(IKI_trial)]);
title('Curva de Learning - Datos crudos')

%% datos corregidos
if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt ==1
    subplot(2,1,2)
    IKI_trial_corr=reshape(seq_results(1,1).IKI_per_trial_corr',1, []);
    plot(IKI_trial_corr);
    hold on

    for i=1:max(seq_results.cant_SeqBlock):length(IKI_trial_corr)
        xline(i);
    end

    xlabel('Trials','FontName','Arial','FontSize',12)
    ylabel('Interkeys interval','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        %le dejo el mismo limite superior que en el no filtrado para conservar la
        %escala del gràfico
        ylim([0 (max([seq_results.Interval12, seq_results.Interval23, ...
                      seq_results.Interval34, seq_results.Interval45]))])
     else
        if  strcmp(seq_results(1,1).flag_tipo_norm,'Z')
            ylim([-5 5])
            yline(0)
        else
            ylim([0 1]) 
        end
        
    end
    xlim([0 length(IKI_trial_corr)]);
    title(['Curva de Learning - ' titulo])
end %end if datos corregidos
%% save
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
%%
figure(3); set(gcf,'Color','white'); box OFF; hold on;

%% MOGS acumulado
subplot(2,3,3)
seq_results.MOGS_acumulativo=cumsum(seq_results.MOGS,'omitnan');
plot(seq_results.MOGS_acumulativo,'r.');
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
ylim([-1.5 1.5])
xlim([0 length(seq_results.MOGS_acumulativo)]);
yline(0)


%% MONGS acumulado
subplot(2,3,2)
seq_results.MONGS_acumulativo=cumsum(seq_results.MONGS,'omitnan');
plot(seq_results.MONGS_acumulativo,'b.');
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
ylim([-1.5 1.5])
xlim([0 length(seq_results.MONGS_acumulativo)]);
yline(0)

%% TOTAL LEARNING acumulado
subplot(2,3,1)
seq_results.Total_Learning_acumulativo=cumsum(seq_results.Total_Learning,'omitnan');
plot(seq_results.Total_Learning_acumulativo,'k.');
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
ylim([-1.5 1.5])
xlim([0 length(seq_results.Total_Learning_acumulativo)]);
title('Acumulado')
yline(0)

%% MOGS no acumulado
subplot(2,3,6)
plot(seq_results.MOGS,'r.');
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MOGs','FontName','Arial','FontSize',12);
ylim([-0.5 0.5])
xlim([0 length(seq_results.MOGS)]);
yline(0)

%% MONGS no acumulado
subplot(2,3,5)
plot(seq_results.MONGS,'b.');
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('MONGs','FontName','Arial','FontSize',12);
ylim([-0.5 0.5])
xlim([0 length(seq_results.MONGS)]);
yline(0)

%% TOTAL LEARNING no acumulado
subplot(2,3,4)
plot(seq_results.Total_Learning,'k.');
xlabel('Block','FontName','Arial','FontSize',12)
ylabel('Total Learning','FontName','Arial','FontSize',12);
ylim([-0.5 0.5])
xlim([0 length(seq_results.Total_Learning)]);
title('No acumulado')
yline(0)

%% Save
saveas(gcf,[path fname(1:end-4) '_MicroGains.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_MicroGains.' 'png']);
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        FIGURE 4:                                    %%%
%%%                                                                     %%%
%%%               Plots Micro Gains as filtered data.                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt ==1
    figure(4); set(gcf,'Color','white'); box OFF; hold on; sgtitle(['Micro Gains - ' titulo])

    %% MOGS acumulado
    subplot(2,3,3)
    seq_results.MOGS_acumulativo_corr=cumsum(seq_results.MOGS_corr,'omitnan');
    plot(seq_results.MOGS_acumulativo_corr,'r.');
    xlabel('Block','FontName','Arial','FontSize',12)
    ylabel('MOGs - corr','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        ylim([-1.5 1.5])
    else
        if strcmp(seq_results(1,1).flag_tipo_norm,'Z')
            ylim([-12 12])
        else
            ylim([-5 5])
        end
    end
    xlim([0 length(seq_results.MOGS_acumulativo)]);
    yline(0)


    %% MONGS acumulado
    subplot(2,3,2)
    seq_results.MONGS_acumulativo_corr=cumsum(seq_results.MONGS_corr,'omitnan');
    plot(seq_results.MONGS_acumulativo_corr,'b.');
    xlabel('Block','FontName','Arial','FontSize',12)
    ylabel('MONGs - corr','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        ylim([-1.5 1.5])
    else
        if strcmp(seq_results(1,1).flag_tipo_norm,'Z')
            ylim([-12 12])
        else
            ylim([-5 5])
        end
    end
    xlim([0 length(seq_results.MONGS_acumulativo)]);
    yline(0)

    %% TOTAL LEARNING
    subplot(2,3,1)
    seq_results.Total_Learning_acumulativo_corr=cumsum(seq_results.Total_Learning_corr,'omitnan');
    plot(seq_results.Total_Learning_acumulativo_corr,'k.');
    xlabel('Block','FontName','Arial','FontSize',12)
    ylabel('Total Learning - corr','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        ylim([-1.5 1.5])
    else
        if strcmp(seq_results(1,1).flag_tipo_norm,'Z')
            ylim([-12 12])
        else
            ylim([-5 5])
        end
    end
    xlim([0 length(seq_results.Total_Learning_acumulativo)]);
    title('Acumulado')
    yline(0)

    %% MOGS no acumulado
    subplot(2,3,6)
    plot(seq_results.MOGS_corr,'r.');
    xlabel('Block','FontName','Arial','FontSize',12)
    ylabel('MOGs - corr','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        ylim([-0.5 0.5])
    else
        ylim([-5 5])
    end
    xlim([0 length(seq_results.MOGS)]);
    yline(0)

    %% MONGS no acumulado
    subplot(2,3,5)
    plot(seq_results.MONGS_corr,'b.');
    xlabel('Block','FontName','Arial','FontSize',12)
    ylabel('MONGs - corr','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        ylim([-0.5 0.5])
    else
        ylim([-5 5])
    end
    xlim([0 length(seq_results.MONGS)]);
    yline(0)

    %% TOTAL LEARNING
    subplot(2,3,4)
    plot(seq_results.Total_Learning_corr,'k.');
    xlabel('Block','FontName','Arial','FontSize',12)
    ylabel('Total Learning - corr','FontName','Arial','FontSize',12);
    if seq_results(1,1).flag_norm==0
        ylim([-0.5 0.5])
    else
        ylim([-5 5])
    end
    xlim([0 length(seq_results.Total_Learning)]);
    title('No acumulado')
    yline(0)

    %% Save figure: .fig and .png

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
figure(5); set(gcf,'Color','white'); box OFF; hold on;

% MICRO MICRO No acumulativo
aux_mogs=reshape(seq_results.MicroMOGS',1, []);
aux_mongs=reshape(seq_results.MicroMONGS',1, []);

% MicroMogs
subplot(2,2,1)
plot(aux_mogs,'r.')
for i=1:(max(seq_results.cant_SeqBlock)-1):length(aux_mogs)
    xline(i)
end
yline(0)
%ylim([min(aux_mogs) max(aux_mogs)])
ylim([-1 1])
%xlim([0 length(aux_mogs)])
title('No Acum. Crudo')
ylabel('Micro MOGS')


% MicroMongs
subplot(2,2,2)
plot(aux_mongs,'b.')
for i=1:max(seq_results.cant_SeqBlock):length(aux_mongs)
    xline(i)
end
yline(0)
%ylim([min(aux_mongs) max(aux_mongs)])
ylim([-1 1])
xlim([0 length(aux_mongs)])
title('No Acum. Crudo')
ylabel('Micro MONGS')


% MICRO MICRO Acumulativo - Se hace la acumulación por bloque, no de la tarea completa.
%MicroMogs
subplot(2,2,3)
for i=1:size(seq_results.MicroMOGS,1)
     seq_results(1,1).MicroMogs_acum(i,:)=cumsum(seq_results(1,1).MicroMOGS(i,:),'omitnan');
     plot(((i-1)*(seq_results.cant_SeqBlock-1)+1):((i-1)*(seq_results.cant_SeqBlock-1)+1+(seq_results.cant_SeqBlock-2)),seq_results(1,1).MicroMogs_acum(i,:),'r.');
     xline((i-1)*(seq_results.cant_SeqBlock-1)+1); hold on; %la línea indica el comienzo del bloque
end
title('MICRO MOGS ACUM')
%ylim([min(seq_results(1,1).MicroMogs_acum,[],'all') max(seq_results(1,1).MicroMogs_acum,[],'all')])
ylim([-3 3])
%xlim([0 length(aux_mogs)])
yline(0)

% MicroMongs
subplot(2,2,4)
for i=1:size(seq_results.MicroMONGS,1)
     seq_results(1,1).MicroMongs_acum(i,:)=cumsum(seq_results(1,1).MicroMONGS(i,:),'omitnan');
     plot(((i-1)*seq_results.cant_SeqBlock+1):((i-1)*seq_results.cant_SeqBlock+1+(seq_results.cant_SeqBlock-1)),seq_results(1,1).MicroMongs_acum(i,:),'b.');
     xline((i-1)*seq_results.cant_SeqBlock+1); hold on; %la línea indica el comienzo del bloque
end
title('MICRO MONGS ACUM')
%ylim([min(seq_results(1,1).MicroMongs_acum,[],'all') max(seq_results(1,1).MicroMongs_acum,[],'all')])
ylim([-3 3])
xlim([0 length(aux_mongs)])
yline(0)

clear aux_mogs; clear aux_mongs; clear i;
%% Save figure: .fig and .png
saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_crudo.' 'fig']);
saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_crudo.' 'png']);

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                            FIGURE 6                                 %%%
%%%             Micro Micro Gains as Filtered and/or Normalized data    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt ==1
    figure(6); set(gcf,'Color','white'); box OFF; hold on; sgtitle(['Micro Micro Gains - ' titulo]);

    % MICRO MICRO No acumulativo
    aux_mogs=reshape(seq_results.MicroMOGS_corr',1, []);
    aux_mongs=reshape(seq_results.MicroMONGS_corr',1, []);

    % MicroMogs
    subplot(2,2,1)
    plot(aux_mogs,'r.')
    for i=1:(max(seq_results.cant_SeqBlock)-1):length(aux_mogs)
        xline(i)
    end
    yline(0)
    %ylim([min(aux_mogs) max(aux_mogs)])
    if seq_results(1,1).flag_norm==0
        ylim([-1.5 1.5])
    else
        ylim([-15 15])
    end
    %xlim([0 length(aux_mogs)])
    title('No Acum. corr')
    ylabel('Micro MOGS')

    % MicroMongs
    subplot(2,2,2)
    plot(aux_mongs,'b.')
    for i=1:max(seq_results.cant_SeqBlock):length(aux_mongs)
        xline(i)
    end
    yline(0)
    %ylim([min(aux_mongs) max(aux_mongs)])
    if seq_results(1,1).flag_norm==0
        ylim([-1.5 1.5])
    else
        ylim([-15 15])
    end
    xlim([0 length(aux_mongs)])
    title('No Acum. corr')
    ylabel('Micro MONGS')

    % MICRO MICRO Acumulativo - Se hace la acumulación por bloque, no de la tarea completa.
    %MicroMogs
    seq_results(1,1).mediana_MicroMogs_acum=NaN(1,15); %15 bloques
    seq_results(1,1).std_MicroMogs_acum=NaN(1,15);
    subplot(2,2,3)
    for i=1:size(seq_results.MicroMOGS_corr,1)
         seq_results(1,1).MicroMogs_corr_acum(i,:)=cumsum(seq_results(1,1).MicroMOGS_corr(i,:),'omitnan');
         if seq_results(1,1).flag_norm==0
             seq_results(1,1).mediana_MicroMogs_acum(i)=nanmedian(seq_results(1,1).MicroMogs_corr_acum(i,:));
             seq_results(1,1).std_MicroMogs_acum(i)=nanstd(seq_results(1,1).MicroMogs_corr_acum(i,:));
         end
         plot(((i-1)*(seq_results.cant_SeqBlock-1)+1):((i-1)*(seq_results.cant_SeqBlock-1)+1+(seq_results.cant_SeqBlock-2)),seq_results(1,1).MicroMogs_corr_acum(i,:),'r.');
         xline((i-1)*(seq_results.cant_SeqBlock-1)+1); hold on; %la línea indica el comienzo del bloque
    end
    title('MICRO MOGS CORR ACUM')
    %ylim([min(seq_results(1,1).MicroMogs_corr_acum,[],'all') max(seq_results(1,1).MicroMogs_corr_acum,[],'all')])
    if seq_results(1,1).flag_norm==0
        ylim([-3 3])
    else
        ylim([-15 15])
    end
    %xlim([0 length(aux_mogs)])
    yline(0)

    % MicroMongs
    seq_results(1,1).mediana_MicroMongs_acum=NaN(1,15); %15 bloques
    seq_results(1,1).std_MicroMongs_acum=NaN(1,15);
    subplot(2,2,4)
    for i=1:size(seq_results.MicroMONGS_corr,1)
         seq_results(1,1).MicroMongs_corr_acum(i,:)=cumsum(seq_results(1,1).MicroMONGS_corr(i,:),'omitnan');
         if seq_results(1,1).flag_norm==0
             seq_results(1,1).mediana_MicroMongs_acum(i)=nanmedian(seq_results(1,1).MicroMongs_corr_acum(i,:));
             seq_results(1,1).std_MicroMongs_acum(i)=nanstd(seq_results(1,1).MicroMongs_corr_acum(i,:));
         end
         plot(((i-1)*seq_results.cant_SeqBlock+1):((i-1)*seq_results.cant_SeqBlock+1+(seq_results.cant_SeqBlock-1)),seq_results(1,1).MicroMongs_corr_acum(i,:),'b.');
         xline((i-1)*seq_results.cant_SeqBlock+1); hold on; %la línea indica el comienzo del bloque
    end
    title('MICRO MONGS CORR ACUM')
    %ylim([min(seq_results(1,1).MicroMongs_corr_acum,[],'all') max(seq_results(1,1).MicroMongs_corr_acum,[],'all')])
    if seq_results(1,1).flag_norm==0
        ylim([-3 3])
    else
        ylim([-15 15])
    end
    yline(0)
    xlim([0 length(aux_mongs)])

    clear aux_mogs; clear aux_mongs; clear i;
    %% Save figure: .fig and .png
    saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_corr.' 'fig']);
    saveas(gcf,[path fname(1:end-4) '_MicroMicroGains_corr.' 'png']);
end %end if data_corr

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                          FIGURE 7                                   %%%
%%% Each Block learning curve: each transition of a correct sequence is %%%
%%% represented in a vector as in [interval12 interval23 interval34 ... %%%
%%% interval45 ...]. This way, we can see how each trial was executed.  %%%
%%% This plot is similar to a learning curve but instead of separating  %%%
%%% blocks it separates sequences. It allows to see the MicroMicro Gains%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(7); set(gcf,'Color','white'); box OFF; hold on;

if seq_results(1,1).flag_filt ==1
    subplot(2,1,1)
end
barra=max(seq_results(1,1).interkey_matrix,[],'all')+0.1;
for j=1:4:size(seq_results(1,1).interkey_matrix,2)
    %secuencia
    plot(j:j+3,seq_results(1,1).interkey_matrix(:,j:j+3),'k-'); hold on;
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
title('Raw')

if seq_results(1,1).flag_filt ==1
    subplot(2,1,2)
    for j=1:4:size(seq_results(1,1).interkey_matrix_corr,2)
        %secuencia
        plot(j:j+3,seq_results(1,1).interkey_matrix_corr(:,j:j+3),'k-'); hold on;
        %barras de ITI
        if mod(j-1,4*seq_results.cant_SeqBlock)== 0 %si j cae en un rest hay que poner la barra de otro color. Hay 48= 4 transiciones x 12 secuencias
            bar(j-4+3.5,barra,1,'FaceColor',[128 193 219]./255,'EdgeColor',[128 193 219]./255);
            hold on;
        end
         bar(j+3.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
         hold on;

    end
    xlabel('transitions');
    ylabel('time [s]');
    title('Filt')
end
%% save
saveas(gcf,[path ['curva_seq' '.'] 'fig']);
saveas(gcf,[path ['curva_seq' '.'] 'png']);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 8                                %%%
%%% Median of micro micro gains per block: Based on figures 5 and 6,    %%% 
%%% median value is calculated for each block. This meassure allows to  %%%
%%% see if the micro micro gain of the whole block is positive or not.  %%%
%%% The median value is calculated for the acumulative and non acumulative
%%% gains if the data is not normalized. Otherwise is only calculated   %%%
%%% for the non acumulative gains.                                      %%%
%%%                                                                     %%%
%%%                            GC 29/12/22                              %%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(8); set(gcf,'Color','white'); box OFF; hold on;

%MOGS NO ACUM
seq_results(1,1).mediana_MicroMogs=NaN(1,15);
seq_results(1,1).std_MicroMogs=NaN(1,15);

for i=1:size(seq_results.MicroMOGS_corr,1)
    seq_results(1,1).mediana_MicroMogs(i)=nanmedian(seq_results.MicroMOGS_corr(i,:));
    seq_results(1,1).std_MicroMogs(i)=nanstd(seq_results.MicroMOGS_corr(i,:));
end

if seq_results(1,1).flag_norm==0
    subplot(2,2,1)
    plot(seq_results(1,1).mediana_MicroMogs,'r.')
    errorbar(seq_results(1,1).mediana_MicroMogs,seq_results(1,1).std_MicroMogs,'r')
    ylim([-1 1])
else
    subplot(1,2,1)
    plot(seq_results(1,1).mediana_MicroMogs,'r.')
    errorbar(seq_results(1,1).mediana_MicroMogs,seq_results(1,1).std_MicroMogs,'r')
    ylim([-5 5])
end
yline(0)
ylabel('MicroMogs [s]')
xlabel('Block')
title('No acum')

%MONGS NO ACUM
seq_results(1,1).mediana_MicroMongs=NaN(1,15);
seq_results(1,1).std_MicroMongs=NaN(1,15);

for i=1:size(seq_results.MicroMONGS_corr,1)
    seq_results(1,1).mediana_MicroMongs(i)=nanmedian(seq_results.MicroMONGS_corr(i,:));
    seq_results(1,1).std_MicroMongs(i)=nanstd(seq_results.MicroMONGS_corr(i,:));
end

if seq_results(1,1).flag_norm==0
    subplot(2,2,2)
    plot(seq_results(1,1).mediana_MicroMongs,'b.')
    errorbar(seq_results(1,1).mediana_MicroMongs,seq_results(1,1).std_MicroMongs,'b')
    ylim([-1 1])
else
    subplot(1,2,2)
    plot(seq_results(1,1).mediana_MicroMongs,'b.')
    errorbar(seq_results(1,1).mediana_MicroMongs,seq_results(1,1).std_MicroMongs,'b')
    ylim([-5 5])
end
yline(0)
ylabel('MicroMongs [s]')
xlabel('Block')
title('No acum')

if seq_results(1,1).flag_norm==0 %si no esta normalizado
    % MOGS ACUM
    subplot(2,2,3)
    plot(seq_results(1,1).mediana_MicroMogs_acum,'r.')
    errorbar(seq_results(1,1).mediana_MicroMogs_acum,seq_results(1,1).std_MicroMogs_acum,'r')
    yline(0)
    ylabel('MicroMogs acum [s]')
    xlabel('Block')
    ylim([-3 3])
    title('acum')
    
    % MONGS ACUM
    subplot(2,2,4)
    plot(seq_results(1,1).mediana_MicroMongs_acum,'b.')
    errorbar(seq_results(1,1).mediana_MicroMongs_acum,seq_results(1,1).std_MicroMongs_acum,'b')
    yline(0)
    ylabel('MicroMongs acum [s]')
    xlabel('Block')
    ylim([-3 3])
    title('acum')

end

%% save
saveas(gcf,[path fname(1:end-4) ['_MicroMicroGains_Median' '.'] 'fig']);
saveas(gcf,[path fname(1:end-4) ['_MicroMicroGains_Median' '.'] 'png']);

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