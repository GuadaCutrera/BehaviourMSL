function Gains=estadistica_MSL(MOGS, MONGS, TL)
%cada columna es un grupo


for i=1:size(MOGS,2)
    % TEST DENTRO DE UN MISMO GRUPO
    
    % T test a cero
    [Gains.h_mogs(:,i),Gains.p_mogs(:,i),Gains.ci_mogs(:,i),Gains.tstat_mogs(:,i)]=ttest(MOGS(:,i));
    [Gains.h_mongs(:,i),Gains.p_mongs(:,i),Gains.ci_mongs(:,i),Gains.tstat_mongs(:,i)]=ttest(MONGS(:,i));
    [Gains.h_TL(:,i),Gains.p_TL(:,i),Gains.ci_TL(:,i),Gains.tstat_TL(:,i)]=ttest(TL(:,i));

    % T test paired
    [Gains.h_paired(:,i),Gains.p_paired(:,i),Gains.ci_paired(:,i),Gains.stats_paired(:,i)]=ttest2(MOGS(:,i),MONGS(:,i));
end

%ANOVA 1 way
[Gains.p_mogs_anova,tabla_mogs_anova]=anova1(MOGS);
[Gains.p_mongs_anova,tabla_mongs_anova]=anova1(MONGS);
[Gains.p_TL_anova,tabla_RL_anova]=anova1(TL);

%ANOVA 2 way
[Gains.p_mogs_anova2,tabla_mogs_anova2]=anova2(MOGS);
[Gains.p_mongs_anova2,tabla_mongs_anova2]=anova2(MONGS);
[Gains.p_TL_anova2,tabla_RL_anova2]=anova2(TL);