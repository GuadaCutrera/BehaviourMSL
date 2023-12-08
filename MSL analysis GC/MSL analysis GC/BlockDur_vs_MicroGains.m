function BlockDur_vs_MicroGains(Group_Results,MOGS,MONGS,MOGS_acum,MONGS_acum,titulo,paradigm_flag)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             FIGURE 17                               %%%
%%% Figure with 3 axis to show how Micro Gains change with the block    %%%
%%% duration in each block.                                             %%%
%%% In order to compare ITI subjects with no ITI subjects, there are 2  %%%
%%% aproches:                                                           %%%
%%%         - Leave the ITI as part of the Block Duration (as the figures%%
%%%             above)                                                  %%%
%%%         - Substract the 11 ITIs from the Block Duration             %%%
%%% This figure shows the first aproach with non acumulative and acumulative
%%% FILTERED data.                                                      %%%
%%%                        GC 12/5/2023                                 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo);

if strcmp(paradigm_flag,'teclas')==1
    %% MOGS NO ACUM
    subplot(2,2,1)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean,'k.','MarkerSize', 15)
    ylabel('Block Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MOGS),MOGS,'r.','MarkerSize', 15)
    ylabel('MOGS')
    ax.YColor = 'k';
    xlabel('Blocks')
    legend('Block Dur','MOGS')

    %% MONGS NO ACUM
    subplot(2,2,2)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean,'k.','MarkerSize', 15)
    ylabel('Block Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MONGS),MONGS,'b.','MarkerSize', 15)
    ylabel('MONGS')
    ax.YColor = 'k';
    xlabel('Blocks')
    legend('Block Dur','MONGS')


    %% MONGS  ACUM
    subplot(2,2,3)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean,'k.','MarkerSize', 15)
    ylabel('Block Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MOGS_acum),MOGS_acum,'r.','MarkerSize', 15)
    ylabel('MOGS - acum')
    ax.YColor = 'k';
    xlabel('Blocks')

    %% MONGS  ACUM
    subplot(2,2,4)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.duration_group_mean),Group_Results.duration_group_mean,'k.','MarkerSize', 15)
    ylabel('Block Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MONGS_acum),MONGS_acum,'b.','MarkerSize', 15)
    ylabel('MONGS - acum')
    ax.YColor = 'k';
    xlabel('Blocks')
else
     %% MOGS NO ACUM
    subplot(2,2,1)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.seq_group_mean),Group_Results.seq_group_mean,'k.','MarkerSize', 15)
    ylabel('Seq Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MOGS),MOGS,'r.','MarkerSize', 15)
    ylabel('MOGS')
    ax.YColor = 'k';
    xlabel('Blocks')
    legend('Block Dur','MOGS')

    %% MONGS NO ACUM
    subplot(2,2,2)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.seq_group_mean),Group_Results.seq_group_mean,'k.','MarkerSize', 15)
    ylabel('Seq Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MONGS),MONGS,'b.','MarkerSize', 15)
    ylabel('MONGS')
    ax.YColor = 'k';
    xlabel('Blocks')
    legend('Block Dur','MONGS')


    %% MONGS  ACUM
    subplot(2,2,3)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.seq_group_mean),Group_Results.seq_group_mean,'k.','MarkerSize', 15)
    ylabel('Seq Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MOGS_acum),MOGS_acum,'r.','MarkerSize', 15)
    ylabel('MOGS - acum')
    ax.YColor = 'k';
    xlabel('Blocks')

    %% MONGS  ACUM
    subplot(2,2,4)
    ax=gca;
    yyaxis left;
    plot(1:length(Group_Results.seq_group_mean),Group_Results.seq_group_mean,'k.','MarkerSize', 15)
    ylabel('Seq Duration')
    ax.YColor = 'k';
    yyaxis right;
    plot(1:length(MONGS_acum),MONGS_acum,'b.','MarkerSize', 15)
    ylabel('MONGS - acum')
    ax.YColor = 'k';
    xlabel('Blocks')
end
    