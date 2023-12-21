function [Intro_Group, Intro_Task_Group]=Intro_Analisis_Grupal(Path,SUJETOS,Results,titulo)
Grupo='Grupo_punto';
Completo='2'; % vacio para grupo completo, 2 para cuando se quitan puntos

iki_visual_group=[];
speed_visual_group=[];
MOGS_group=[];
MONGS_group=[];
TL_group=[];
MicroMOGS_group=[];
MicroMONGS_group=[];
MicroMOGS_acum_group=[];
MicroMONGS_acum_group=[];

N=length(SUJETOS);

%Cargo los .mat de los sujetos
for i=1:length(SUJETOS)
   Intro(i).S=Intro_Analisis([Path SUJETOS(i).S '.mat'],SUJETOS(i).S);
   Intro(i).S.IKI_visual=Visualization_LearningCurve(Intro(i).S.IKI_per_trial,Intro(i).S.seqduration,Intro(i).S);
   Intro(i).S.speed_visual=1./Intro(i).S.IKI_visual;
   Intro(i).S.MONGS=Intro(i).S.IKI_per_trial(1)-Intro(i).S.IKI_per_trial(3);
   Intro(i).S.MOGS=Intro(i).S.IKI_per_trial(3)-Results(i).S.seq_results.IKI_per_trial(1);
   Intro(i).S.TL=Intro(i).S.IKI_per_trial(1)-Results(i).S.seq_results.IKI_per_trial(1);
   Results_Intro=Intro(i).S; %para guardarlo
   save([Path SUJETOS(i).S '_results' Completo '.mat'],'Results_Intro');
   
   iki_visual_group=[iki_visual_group; Intro(i).S.IKI_visual];
   speed_visual_group=[speed_visual_group; Intro(i).S.speed_visual];
   MOGS_group=[MOGS_group;Intro(i).S.MOGS];
   MONGS_group=[MONGS_group;Intro(i).S.MONGS];
   TL_group=[TL_group;Intro(i).S.TL];
   MicroMOGS_group=[MicroMOGS_group;Intro(i).S.MicroMOGS];
   MicroMONGS_group=[MicroMONGS_group;Intro(i).S.MicroMONGS];
   
   MicroMOGS_acum_group=[MicroMOGS_acum_group;cumsum(Intro(i).S.MicroMOGS,'omitnan')];
   MicroMONGS_acum_group=[MicroMONGS_acum_group;cumsum(Intro(i).S.MicroMONGS,'omitnan')];
   
end




%% para guardar todo en struct de intro
Group_Parameters.iki_visual_group=iki_visual_group;
Group_Parameters.speed_visual_group=speed_visual_group;
Group_Parameters.MOGS_group=MOGS_group;
Group_Parameters.MONGS_group=MONGS_group;
Group_Parameters.TL_group=TL_group;
Group_Parameters.MicroMOGS_group=MicroMOGS_group;
Group_Parameters.MicroMONGS_group=MicroMONGS_group;
Group_Parameters.MicroMOGS_acum_group=MicroMOGS_acum_group;
Group_Parameters.MicroMONGS_acum_group=MicroMONGS_acum_group;

Intro_Group.Group_Parameters=Group_Parameters;

%mean and std
Intro_Group.iki_visual_group_mean=nanmean(iki_visual_group,1);
Intro_Group.iki_visual_group_std=nanstd(iki_visual_group,0,1)/sqrt(N);
Intro_Group.speed_visual_group_mean=nanmean(speed_visual_group,1);
Intro_Group.speed_visual_group_std=nanstd(speed_visual_group,0,1)/sqrt(N);

Intro_Group.MOGS_group_mean=nanmean(MOGS_group,1);
Intro_Group.MOGS_group_std=nanstd(MOGS_group,0,1)/sqrt(N);
Intro_Group.MONGS_group_mean=nanmean(MONGS_group,1);
Intro_Group.MONGS_group_std=nanstd(MONGS_group,0,1)/sqrt(N);
Intro_Group.TL_group_mean=nanmean(TL_group,1);
Intro_Group.TL_group_std=nanstd(TL_group,0,1)/sqrt(N);

Intro_Group.MicroMOGS_group_mean=nanmean(MicroMOGS_group,1);
Intro_Group.MicroMOGS_group_std=nanstd(MicroMOGS_group,0,1)/sqrt(N);
Intro_Group.MicroMONGS_group_mean=nanmean(MicroMONGS_group,1);
Intro_Group.MicroMONGS_group_std=nanstd(MicroMONGS_group,0,1)/sqrt(N);

Intro_Group.MicroMOGS_acum_group_mean=nanmean(MicroMOGS_acum_group,1);
Intro_Group.MicroMOGS_acum_group_std=nanstd(MicroMOGS_acum_group,0,1)/sqrt(N);
Intro_Group.MicroMONGS_acum_group_mean=nanmean(MicroMONGS_acum_group,1);
Intro_Group.MicroMONGS_acum_group_std=nanstd(MicroMONGS_acum_group,0,1)/sqrt(N);

save([Path Grupo '\Intro + Task\Group_Results_Intro' Completo '.mat'],'Intro_Group'); %Guarda solo lo de la intro
close all

%% Lo acoplo a Results y llamo a las funciones de Plot (INTRO + TASK)
Intro_Task.iki_group=[];
Intro_Task.speed_group=[];
Intro_Task.MOGS_group=[];
Intro_Task.MONGS_group=[];
Intro_Task.TL_group=[];
Intro_Task.MOGS_acum_group=[];
Intro_Task.MONGS_acum_group=[];
Intro_Task.TL_acum_group=[];
Intro_Task.MicroMOGS_group=[];
Intro_Task.MicroMONGS_group=[];
Intro_Task.MicroMOGS_acum_group=[];
Intro_Task.MicroMONGS_acum_group=[];
Intro_Task.MicroMOGS_media_group=[];
Intro_Task.MicroMONGS_media_group=[];
Intro_Task.MicroMOGS_acum_media_group=[];
Intro_Task.MicroMONGS_acum_media_group=[];

Intro_Task.MicroMOGS_mediana_group=[];
Intro_Task.MicroMONGS_mediana_group=[];
Intro_Task.MicroMOGS_acum_mediana_group=[];
Intro_Task.MicroMONGS_acum_mediana_group=[];

max_seq=0;
for i=1:length(Results)
    if max(Results(i).S.seq_results.correct)>max_seq
        max_seq=max(Results(i).S.seq_results.correct);
    end
end
for i=1:length(Results)
        columnas_nan=nan(size(Results(i).S.seq_results.IKI_per_trial,1),max_seq-size(Results(i).S.seq_results.IKI_per_trial,2));

        %MICRO MICRO OFFLINE
        Results(i).S.seq_results.MicroMOGS=[Results(i).S.seq_results.MicroMOGS columnas_nan];
        Results(i).S.seq_results.MicroMogs_acum=[Results(i).S.seq_results.MicroMogs_acum columnas_nan];
        
        
        %MICRO MICRO ONLINE
        Results(i).S.seq_results.MicroMONGS=[Results(i).S.seq_results.MicroMONGS columnas_nan]; 
        Results(i).S.seq_results.MicroMongs_acum=[Results(i).S.seq_results.MicroMongs_acum columnas_nan];
        
end

for i=1:length(SUJETOS)
        
    Intro_Task.iki_group=[Intro_Task.iki_group;iki_visual_group(i,:) Results(i).S.seq_results.IKI_visual];
    Intro_Task.speed_group=[Intro_Task.speed_group;1./Intro_Task.iki_group(i,:)];
    
    %MICRO
    Intro_Task.MOGS_group=[Intro_Task.MOGS_group;MOGS_group(i) Results(i).S.seq_results.MOGS'];
    Intro_Task.MONGS_group=[Intro_Task.MONGS_group;MONGS_group(i) Results(i).S.seq_results.MONGS];
    Intro_Task.TL_group=[Intro_Task.TL_group;TL_group(i) Results(i).S.seq_results.Total_Learning];
    %sumo la intro como primer punto para el acum
    if isnan(MOGS_group(i))
        Intro_Task.MOGS_acum_group=[Intro_Task.MOGS_acum_group;MOGS_group(i) Results(i).S.seq_results.MOGS_acumulativo'+0];
        Intro_Task.TL_acum_group=[Intro_Task.TL_acum_group;TL_group(i) Results(i).S.seq_results.Total_Learning_acumulativo+0];
    else 
        Intro_Task.MOGS_acum_group=[Intro_Task.MOGS_acum_group;MOGS_group(i) Results(i).S.seq_results.MOGS_acumulativo'+MOGS_group(i)];
        Intro_Task.TL_acum_group=[Intro_Task.TL_acum_group;TL_group(i) Results(i).S.seq_results.Total_Learning_acumulativo+TL_group(i)];
    end
    if isnan(MONGS_group(i))
        Intro_Task.MONGS_acum_group=[Intro_Task.MONGS_acum_group;MONGS_group(i) Results(i).S.seq_results.MONGS_acumulativo+0];
    else
        Intro_Task.MONGS_acum_group=[Intro_Task.MONGS_acum_group;MONGS_group(i) Results(i).S.seq_results.MONGS_acumulativo+MONGS_group(i)];
    end

    Results(i).S.seq_results.MicroMOGS=reshape(Results(i).S.seq_results.MicroMOGS',1,[]);
    Results(i).S.seq_results.MicroMONGS=reshape(Results(i).S.seq_results.MicroMONGS',1,[]);
    
    Results(i).S.seq_results.MicroMogs_acum=reshape(Results(i).S.seq_results.MicroMogs_acum',1,[]);
    Results(i).S.seq_results.MicroMongs_acum=reshape(Results(i).S.seq_results.MicroMongs_acum',1,[]);
    
    %MICRO MICRO
    Intro_Task.MicroMOGS_group=[Intro_Task.MicroMOGS_group;MicroMOGS_group(i,:) Results(i).S.seq_results.MicroMOGS];
    Intro_Task.MicroMONGS_group=[Intro_Task.MicroMONGS_group;MicroMONGS_group(i,:) Results(i).S.seq_results.MicroMONGS];
    %sumo la intro para el acum
    if isnan(MicroMOGS_acum_group(i,end))
        Intro_Task.MicroMOGS_acum_group=[Intro_Task.MicroMOGS_acum_group;MicroMOGS_acum_group(i,:) Results(i).S.seq_results.MicroMogs_acum+0];
    else
        Intro_Task.MicroMOGS_acum_group=[Intro_Task.MicroMOGS_acum_group;MicroMOGS_acum_group(i,:) Results(i).S.seq_results.MicroMogs_acum+MicroMOGS_acum_group(i,end)];
    end
    if isnan(MicroMONGS_acum_group(i,end))
        Intro_Task.MicroMONGS_acum_group=[Intro_Task.MicroMONGS_acum_group;MicroMONGS_acum_group(i,:) Results(i).S.seq_results.MicroMongs_acum+0];
    else
        Intro_Task.MicroMONGS_acum_group=[Intro_Task.MicroMONGS_acum_group;MicroMONGS_acum_group(i,:) Results(i).S.seq_results.MicroMongs_acum+MicroMONGS_acum_group(i,end)];
    end

    %MICRO MICRO media x bloque
    Intro_Task.MicroMOGS_media_group=[Intro_Task.MicroMOGS_media_group;nanmean(MicroMOGS_group(i,:)) Results(i).S.seq_results.media_MicroMogs];
    Intro_Task.MicroMONGS_media_group=[Intro_Task.MicroMONGS_media_group;nanmean(MicroMONGS_group(i,:)) Results(i).S.seq_results.media_MicroMongs];
    %sumo la intro para el acum
    Intro_Task.MicroMOGS_acum_media_group=[Intro_Task.MicroMOGS_acum_media_group;nanmean(MicroMOGS_group(i,:)) Results(i).S.seq_results.media_MicroMogs_acum+nanmean(MicroMOGS_group(i,:))];
    Intro_Task.MicroMONGS_acum_media_group=[Intro_Task.MicroMONGS_acum_media_group;nanmean(MicroMONGS_group(i,:)) Results(i).S.seq_results.media_MicroMongs_acum+nanmean(MicroMONGS_group(i,:))];
    
    %MICRO MICRO mediana x bloque
    Intro_Task.MicroMOGS_mediana_group=[Intro_Task.MicroMOGS_mediana_group;nanmedian(MicroMOGS_group(i,:)) Results(i).S.seq_results.mediana_MicroMogs];
    Intro_Task.MicroMONGS_mediana_group=[Intro_Task.MicroMONGS_mediana_group;nanmedian(MicroMONGS_group(i,:)) Results(i).S.seq_results.mediana_MicroMongs];
    %sumo la intro para el acum
    Intro_Task.MicroMOGS_acum_mediana_group=[Intro_Task.MicroMOGS_acum_mediana_group;nanmedian(MicroMOGS_group(i,:)) Results(i).S.seq_results.mediana_MicroMogs_acum+nanmedian(MicroMOGS_group(i,:))];
    Intro_Task.MicroMONGS_acum_mediana_group=[Intro_Task.MicroMONGS_acum_mediana_group;nanmedian(MicroMONGS_group(i,:)) Results(i).S.seq_results.mediana_MicroMongs_acum+nanmedian(MicroMONGS_group(i,:))];
 
    
end

Intro_Task_Group.Intro_Task=Intro_Task; %Guardo las matrices

%%%%%%%%%%%%%%%%%%%%%%   mean and std  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%iki
Intro_Task_Group.iki_visual_group_mean=nanmean(Intro_Task.iki_group,1);
Intro_Task_Group.iki_visual_group_std=nanstd(Intro_Task.iki_group,0,1)/sqrt(N);

%PlotInteractivo(SUJETOS,Intro_Task_Group.Intro_Task,Intro_Task_Group,[Path 'Grupo_punto\Intro + Task\']);
Visualization_Learning_Grupal(Intro_Task_Group.iki_visual_group_mean,Intro_Task_Group.iki_visual_group_std,'iki',titulo)
saveas(gcf,[Path Grupo '\Intro + Task\' 'Learning_Visual' Completo '.' 'fig']);

%speed
Intro_Task_Group.speed_visual_group_mean=nanmean(Intro_Task.speed_group,1);
Intro_Task_Group.speed_visual_group_std=nanstd(Intro_Task.speed_group,0,1)/sqrt(N);
Visualization_Learning_Grupal(Intro_Task_Group.speed_visual_group_mean,Intro_Task_Group.speed_visual_group_std,'speed',titulo)
saveas(gcf,[Path Grupo '\Intro + Task\' 'Speed_Visual' Completo '.' 'fig']);

%Micro Gains no acum
Intro_Task_Group.MOGS_group_mean=nanmean(Intro_Task.MOGS_group,1);
Intro_Task_Group.MOGS_group_std=nanstd(Intro_Task.MOGS_group,0,1)/sqrt(N);
Intro_Task_Group.MONGS_group_mean=nanmean(Intro_Task.MONGS_group,1);
Intro_Task_Group.MONGS_group_std=nanstd(Intro_Task.MONGS_group,0,1)/sqrt(N);
Intro_Task_Group.TL_group_mean=nanmean(Intro_Task.TL_group,1);
Intro_Task_Group.TL_group_std=nanstd(Intro_Task.TL_group,0,1)/sqrt(N);

struct.flag_norm=0;
struct.flag_filt=0;
MicroGains_Plot_Grupal(Intro_Task_Group.MOGS_group_mean,Intro_Task_Group.MOGS_group_std,Intro_Task_Group.MONGS_group_mean...
    ,Intro_Task_Group.MONGS_group_std,Intro_Task_Group.TL_group_mean,Intro_Task_Group.TL_group_std,Intro_Task.MOGS_group,Intro_Task.MONGS_group,Intro_Task.TL_group,titulo,struct)
saveas(gcf,[Path Grupo '\Intro + Task\' 'Micro_Gains_no_acum' Completo '.' 'fig']);


%Micro gains acum
Intro_Task_Group.MOGS_acum_group_mean=nanmean(Intro_Task.MOGS_acum_group,1);
Intro_Task_Group.MOGS_acum_group_std=nanstd(Intro_Task.MOGS_acum_group,0,1)/sqrt(N);
Intro_Task_Group.MONGS_acum_group_mean=nanmean(Intro_Task.MONGS_acum_group,1);
Intro_Task_Group.MONGS_acum_group_std=nanstd(Intro_Task.MONGS_acum_group,0,1)/sqrt(N);
Intro_Task_Group.TL_acum_group_mean=nanmean(Intro_Task.TL_acum_group,1);
Intro_Task_Group.TL_acum_group_std=nanstd(Intro_Task.TL_acum_group,0,1)/sqrt(N);

MicroGains_Plot_Grupal(Intro_Task_Group.MOGS_acum_group_mean,Intro_Task_Group.MOGS_acum_group_std,Intro_Task_Group.MONGS_acum_group_mean...
    ,Intro_Task_Group.MONGS_acum_group_std,Intro_Task_Group.TL_acum_group_mean,Intro_Task_Group.TL_acum_group_std,Intro_Task.MOGS_acum_group,...
    Intro_Task.MONGS_acum_group,Intro_Task.TL_acum_group,titulo,struct)
saveas(gcf,[Path Grupo '\Intro + Task\' 'Micro_Gains_acum' Completo '.' 'fig']);

% Micro Micro
Intro_Task_Group.MicroMOGS_group_mean=nanmean(Intro_Task.MicroMOGS_group,1);
Intro_Task_Group.MicroMOGS_group_std=nanstd(Intro_Task.MicroMOGS_group,0,1)/sqrt(N);
Intro_Task_Group.MicroMONGS_group_mean=nanmean(Intro_Task.MicroMONGS_group,1);
Intro_Task_Group.MicroMONGS_group_std=nanstd(Intro_Task.MicroMONGS_group,0,1)/sqrt(N);

Intro_Task_Group.MicroMOGS_acum_group_mean=nanmean(Intro_Task.MicroMOGS_acum_group,1);
Intro_Task_Group.MicroMOGS_acum_group_std=nanstd(Intro_Task.MicroMOGS_acum_group,0,1)/sqrt(N);
Intro_Task_Group.MicroMONGS_acum_group_mean=nanmean(Intro_Task.MicroMONGS_acum_group,1);
Intro_Task_Group.MicroMONGS_acum_group_std=nanstd(Intro_Task.MicroMONGS_acum_group,0,1)/sqrt(N);

% 
% MicroMicroGains_Plot_Grupal(Intro_Task_Group.MicroMOGS_group_mean,Intro_Task_Group.MicroMOGS_group_std,...
%     Intro_Task_Group.MicroMONGS_group_mean,Intro_Task_Group.MicroMONGS_group_std,Intro_Task.MicroMOGS_group,...
%     Intro_Task.MicroMONGS_group,titulo,Group_Parameters)

% media por bloque - media across micro micro
Intro_Task_Group.MicroMOGS_media_group_mean=nanmean(Intro_Task.MicroMOGS_media_group,1);
Intro_Task_Group.MicroMOGS_media_group_std=nanstd(Intro_Task.MicroMOGS_media_group,0,1)/sqrt(N);
Intro_Task_Group.MicroMONGS_media_group_mean=nanmean(Intro_Task.MicroMONGS_media_group,1);
Intro_Task_Group.MicroMONGS_media_group_std=nanstd(Intro_Task.MicroMONGS_media_group,0,1)/sqrt(N);

Intro_Task_Group.MicroMOGS_acum_media_group_mean=nanmean(Intro_Task.MicroMOGS_acum_media_group,1);
Intro_Task_Group.MicroMOGS_acum_media_group_std=nanstd(Intro_Task.MicroMOGS_acum_media_group,0,1)/sqrt(N);
Intro_Task_Group.MicroMONGS_acum_media_group_mean=nanmean(Intro_Task.MicroMONGS_acum_media_group,1);
Intro_Task_Group.MicroMONGS_acum_media_group_std=nanstd(Intro_Task.MicroMONGS_acum_media_group,0,1)/sqrt(N);


MeanMicroMicroGains_Plot_Grupal(Intro_Task_Group.MicroMONGS_media_group_mean,Intro_Task_Group.MicroMOGS_media_group_mean,...
    Intro_Task_Group.MicroMONGS_media_group_std,Intro_Task_Group.MicroMOGS_media_group_std,...
    Intro_Task_Group.MicroMOGS_acum_media_group_mean,Intro_Task_Group.MicroMONGS_acum_media_group_mean,...
    Intro_Task.MicroMOGS_acum_media_group,Intro_Task.MicroMONGS_acum_media_group,titulo,struct,'media')

% media por bloque - mediana across micro micro
Intro_Task_Group.MicroMOGS_media_group_median=nanmedian(Intro_Task.MicroMOGS_media_group,1);
Intro_Task_Group.MicroMONGS_media_group_median=nanmedian(Intro_Task.MicroMONGS_media_group,1);

Intro_Task_Group.MicroMOGS_acum_media_group_median=nanmedian(Intro_Task.MicroMOGS_acum_media_group,1);
Intro_Task_Group.MicroMONGS_acum_media_group_median=nanmedian(Intro_Task.MicroMONGS_acum_media_group,1);


MeanMicroMicroGains_Plot_Grupal(Intro_Task_Group.MicroMONGS_media_group_median,Intro_Task_Group.MicroMOGS_media_group_median,...
    Intro_Task_Group.MicroMONGS_media_group_std,Intro_Task_Group.MicroMOGS_media_group_std,...
    Intro_Task_Group.MicroMOGS_acum_media_group_median,Intro_Task_Group.MicroMONGS_acum_media_group_median,...
    Intro_Task.MicroMOGS_acum_media_group,Intro_Task.MicroMONGS_acum_media_group,titulo,struct,'media')

%%
% mediana por bloque - media across micro micro
Intro_Task_Group.MicroMOGS_mediana_group_mean=nanmean(Intro_Task.MicroMOGS_mediana_group,1);
Intro_Task_Group.MicroMOGS_mediana_group_std=nanstd(Intro_Task.MicroMOGS_mediana_group,0,1)/sqrt(N);
Intro_Task_Group.MicroMONGS_mediana_group_mean=nanmean(Intro_Task.MicroMONGS_mediana_group,1);
Intro_Task_Group.MicroMONGS_mediana_group_std=nanstd(Intro_Task.MicroMONGS_mediana_group,0,1)/sqrt(N);

Intro_Task_Group.MicroMOGS_acum_mediana_group_mean=nanmean(Intro_Task.MicroMOGS_acum_mediana_group,1);
Intro_Task_Group.MicroMOGS_acum_mediana_group_std=nanstd(Intro_Task.MicroMOGS_acum_mediana_group,0,1)/sqrt(N);
Intro_Task_Group.MicroMONGS_acum_mediana_group_mean=nanmean(Intro_Task.MicroMONGS_acum_mediana_group,1);
Intro_Task_Group.MicroMONGS_acum_mediana_group_std=nanstd(Intro_Task.MicroMONGS_acum_mediana_group,0,1)/sqrt(N);


MeanMicroMicroGains_Plot_Grupal(Intro_Task_Group.MicroMONGS_mediana_group_mean,Intro_Task_Group.MicroMOGS_mediana_group_mean,...
    Intro_Task_Group.MicroMONGS_mediana_group_std,Intro_Task_Group.MicroMOGS_mediana_group_std,...
    Intro_Task_Group.MicroMOGS_acum_mediana_group_mean,Intro_Task_Group.MicroMONGS_acum_mediana_group_mean,...
    Intro_Task.MicroMOGS_acum_mediana_group,Intro_Task.MicroMONGS_acum_mediana_group,titulo,struct,'mediana')

% mediana por bloque - mediana across micro micro
Intro_Task_Group.MicroMOGS_mediana_group_median=nanmedian(Intro_Task.MicroMOGS_mediana_group,1);
Intro_Task_Group.MicroMONGS_mediana_group_median=nanmedian(Intro_Task.MicroMONGS_mediana_group,1);

Intro_Task_Group.MicroMOGS_acum_mediana_group_median=nanmedian(Intro_Task.MicroMOGS_acum_mediana_group,1);
Intro_Task_Group.MicroMONGS_acum_mediana_group_median=nanmedian(Intro_Task.MicroMONGS_acum_mediana_group,1);


MeanMicroMicroGains_Plot_Grupal(Intro_Task_Group.MicroMONGS_mediana_group_median,Intro_Task_Group.MicroMOGS_mediana_group_median,...
    Intro_Task_Group.MicroMONGS_mediana_group_std,Intro_Task_Group.MicroMOGS_mediana_group_std,...
    Intro_Task_Group.MicroMOGS_acum_mediana_group_median,Intro_Task_Group.MicroMONGS_acum_mediana_group_median,...
    Intro_Task.MicroMOGS_acum_mediana_group,Intro_Task.MicroMONGS_acum_mediana_group,titulo,struct,'mediana')

save([Path Grupo '\Intro + Task\Group_Results_Intro_Task' Completo '.mat'],'Intro_Task_Group'); %Guarda solo lo de la intro

