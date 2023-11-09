function estadistica_MSL(MOGS, MONGS, TL)


% T test a cero
[h_mogs,p_mogs,ci_mogs,tstat_mogs]=ttest(MOGS);
[h_mongs,p_mongs,ci_mongs,tstat_mongs]=ttest(MONGS);
[h_TL,p_TL,ci_TL,tstat_TL]=ttest(TL);

% T test paired
[h_paired,p_paired,ci_paired,stats_paired]=ttest2(MOGS,MONGS);
