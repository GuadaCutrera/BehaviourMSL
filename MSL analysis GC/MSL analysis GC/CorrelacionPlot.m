function CorrelacionPlot(Group_Results,MOGS,MONGS,MOGS_acum,MONGS_acum,titulo,paradigm_flag)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%           Correlation Block Duration Vs MOGS and MONGS              %%%
%%% Because some of the subjects didn't have the expected behaviour, we %%%
%%% think that the Micro Gains may be retalted to the time each subject %%%
%%% takes to complete each block.                                       %%%
%%% In order to compare ITI subjects with no ITI subjects, there are 2  %%%
%%% aproches:                                                           %%%
%%%         - Leave the ITI as part of the Block Duration (as the figures%%
%%%             above)                                                  %%%
%%%         - Substract the 11 ITIs from the Block Duration             %%%
%%%                                                                     %%%
%%% This figure shows the first aproach with non acumulative and acumulative
%%% raw data.                                                           %%%
%%% The mean values are shown in the figure, but a matrix for each subject%
%%%is created.                                                          %%%
%%% In order to get the R^2 value of the correlation, we make a linear  %%%
%%% regression.                                                         %%%
%%%                         GC 12/5/2023                                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo);

if strcmp(paradigm_flag,'teclas')==1
    %MOGS NO ACUMULADO
    subplot(2,2,1)
    plot(MOGS,Group_Results.duration_group_mean(1:(end-1)),'r.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.duration_group_mean(1:(end-1))', [ones(length(MOGS), 1) MOGS']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MOGS', Group_Results.duration_group_mean(1:(end-1))'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MOGS, b(1) + b(2)*MOGS,'r'); % Graficar la recta de regresión
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))]);
    xlabel('MOGS');
    ylabel('Block Duration');
    clear b; clear r; clear r2; clear p;

    % MONGS NO ACUMULADO
    subplot(2,2,2)
    plot(MONGS,Group_Results.duration_group_mean,'b.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.duration_group_mean', [ones(length(MONGS), 1) MONGS']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MONGS', Group_Results.duration_group_mean'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MONGS, b(1) + b(2)*MONGS); % Graficar la recta de regresión
    %title(['Coeficiente de correlación R^2 = ' num2str(r2)]);
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))])
    xlabel('MONGS');
    ylabel('Block Duration');

    clear b; clear r; clear r2; clear p;

    % MOGS ACUM
    subplot(2,2,3)
    plot(MOGS_acum,Group_Results.duration_group_mean(1:(end-1)),'r.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.duration_group_mean(1:(end-1))', [ones(length(MOGS_acum), 1) MOGS_acum']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MOGS_acum', Group_Results.duration_group_mean(1:(end-1))'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MOGS_acum, b(1) + b(2)*MOGS_acum,'r'); % Graficar la recta de regresión
    %title(['Coeficiente de correlación R^2 = ' num2str(r2)]);
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))])
    xlabel('MOGS - acum');
    ylabel('Block Duration');
    clear b; clear r; clear r2; clear p;


    % MONGS ACUMULADO
    subplot(2,2,4)
    plot(MONGS_acum,Group_Results.duration_group_mean,'b.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.duration_group_mean', [ones(length(MONGS_acum), 1) MONGS_acum']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MONGS_acum', Group_Results.duration_group_mean'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MONGS_acum, b(1) + b(2)*MONGS_acum); % Graficar la recta de regresión
    %title(['Coeficiente de correlación R^2 = ' num2str(r2)]);
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))])
    xlabel('MONGS - acum');
    ylabel('Block Duration');

    clear b; clear r; clear r2; clear p;

else
        %MOGS NO ACUMULADO
    subplot(2,2,1)
    plot(MOGS,Group_Results.seq_group_mean(1:(end-1)),'r.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.seq_group_mean(1:(end-1))', [ones(length(MOGS), 1) MOGS']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MOGS', Group_Results.seq_group_mean(1:(end-1))'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MOGS, b(1) + b(2)*MOGS,'r'); % Graficar la recta de regresión
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))]);
    xlabel('MOGS');
    ylabel('Seq Duration');
    clear b; clear r; clear r2; clear p;

    % MONGS NO ACUMULADO
    subplot(2,2,2)
    plot(MONGS,Group_Results.seq_group_mean,'b.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.seq_group_mean', [ones(length(MONGS), 1) MONGS']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MONGS', Group_Results.seq_group_mean'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MONGS, b(1) + b(2)*MONGS); % Graficar la recta de regresión
    %title(['Coeficiente de correlación R^2 = ' num2str(r2)]);
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))])
    xlabel('MONGS');
    ylabel('Seq Duration');

    clear b; clear r; clear r2; clear p;

    % MOGS ACUM
    subplot(2,2,3)
    plot(MOGS_acum,Group_Results.seq_group_mean(1:(end-1)),'r.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.seq_group_mean(1:(end-1))', [ones(length(MOGS_acum), 1) MOGS_acum']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MOGS_acum', Group_Results.seq_group_mean(1:(end-1))'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MOGS_acum, b(1) + b(2)*MOGS_acum,'r'); % Graficar la recta de regresión
    %title(['Coeficiente de correlación R^2 = ' num2str(r2)]);
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))])
    xlabel('MOGS - acum');
    ylabel('Seq Duration');
    clear b; clear r; clear r2; clear p;


    % MONGS ACUMULADO
    subplot(2,2,4)
    plot(MONGS_acum,Group_Results.seq_group_mean,'b.','MarkerSize', 15)
    hold on;
    b = regress(Group_Results.seq_group_mean', [ones(length(MONGS_acum), 1) MONGS_acum']); % Obtener los coeficientes de la recta de regresión
    [r,p] = corrcoef(MONGS_acum', Group_Results.seq_group_mean'); % Calcular el coeficiente de correlación R2
    r2 = r(1,2)^2;
    plot(MONGS_acum, b(1) + b(2)*MONGS_acum); % Graficar la recta de regresión
    %title(['Coeficiente de correlación R^2 = ' num2str(r2)]);
    title(['R^2=' num2str(r2) ' - pValue=' num2str(p(2))])
    xlabel('MONGS - acum');
    ylabel('Seq Duration');

    clear b; clear r; clear r2; clear p;
end
