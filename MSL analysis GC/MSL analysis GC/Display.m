%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             PLOTS con INTRO
clear
clc
close all

% la intro y task de 16 % sin el punto del wo ITI y w ITI de la intro
Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Intro + Task\Group_Results_Intro_Task.mat');
Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Intro + Task\Group_Results_Intro_Task2.mat');
path_para_Guardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Con Intro\';

%PlotInteractivo(ones(1,16),Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task,Group_Results_w_ITI_1s.Intro_Task_Group,'');



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     primer punto de la mediana a cero               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Display - original\'];

Resultados_1st_to_0_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Intro_Task_Group.iki_visual_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MOGS_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MONGS_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.TL_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MOGS_acum_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MONGS_acum_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.TL_acum_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_mean, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_mean,0);

% aux para que no calcule el speed sino que solo lo mueva
aux_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Intro_Task_Group.speed_visual_group_mean,...
    ones(3,3),ones(3,3),ones(3,3),ones(3,3),ones(3,3), ones(3,3),...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_median,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_median,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_median,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_median, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_median,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_median,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_median,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_median,0);

Resultados_1st_to_0_ITI.speed_visual_mean=aux_ITI.iki_visual_mean;
Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_median=aux_ITI.Micro_MOGS_acum_media_mean;
Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_median=aux_ITI.Micro_MONGS_acum_media_mean;
Resultados_1st_to_0_ITI.Micro_MOGS_media_median=aux_ITI.Micro_MOGS_media_mean;
Resultados_1st_to_0_ITI.Micro_MONGS_media_median=aux_ITI.Micro_MONGS_media_mean;
Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_median=aux_ITI.Micro_MOGS_acum_mediana_mean;
Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_median=aux_ITI.Micro_MONGS_acum_mediana_mean;
Resultados_1st_to_0_ITI.Micro_MOGS_mediana_median=aux_ITI.Micro_MOGS_mediana_mean;
Resultados_1st_to_0_ITI.Micro_MONGS_mediana_median=aux_ITI.Micro_MONGS_mediana_mean;


% SIN ITI
Resultados_1st_to_0_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Intro_Task_Group.iki_visual_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MOGS_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MONGS_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.TL_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MOGS_acum_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MONGS_acum_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.TL_acum_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_mean,...
   Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_mean,...
   Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_mean,...
   Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_mean,0);

% aux para que no calcule el speed sino que solo lo mueva
aux_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Intro_Task_Group.speed_visual_group_mean,...
    ones(3,3),ones(3,3),ones(3,3),ones(3,3),ones(3,3), ones(3,3),...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_median,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_median,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_median,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_median, ...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_median,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_median,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_median,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_median,0);

Resultados_1st_to_0_wo_ITI.speed_visual_mean=aux_wo_ITI.iki_visual_mean;
Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_median=aux_wo_ITI.Micro_MOGS_acum_media_mean;
Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_median=aux_wo_ITI.Micro_MONGS_acum_media_mean;
Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_median=aux_wo_ITI.Micro_MOGS_media_mean;
Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_median=aux_wo_ITI.Micro_MONGS_media_mean;
Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_median=aux_wo_ITI.Micro_MOGS_acum_mediana_mean;
Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_median=aux_wo_ITI.Micro_MONGS_acum_mediana_mean;
Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_median=aux_wo_ITI.Micro_MOGS_mediana_mean;
Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_median=aux_wo_ITI.Micro_MONGS_mediana_mean;

%% -------------------------- IKI y SPEED -----------------------------------

%uso la media del primer punto a cero pero la std de la original proque al
%first point to zero le paso solo la media y su std seria cero. 

Matriz_iki(1,:)=Resultados_1st_to_0_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_0_ITI.iki_visual_mean;
std_iki(1,:)=Group_Results_wo_ITI.Intro_Task_Group.iki_visual_group_std;
std_iki(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.iki_visual_group_std;

Matriz_speed(1,:)=Resultados_1st_to_0_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_0_ITI.speed_visual_mean;
std_speed(1,:)=Group_Results_wo_ITI.Intro_Task_Group.speed_visual_group_std;
std_speed(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.speed_visual_group_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'0',pathGuardar);

%% ------------------------ MICRO GAINS ------------------------------------

Matriz_MOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_0_ITI.TL_acum_mean;

Matriz_MOGS_std(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MOGS_acum_group_std;
Matriz_MOGS_std(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MOGS_acum_group_std;

Matriz_MONGS_std(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MONGS_acum_group_std;
Matriz_MONGS_std(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MONGS_acum_group_std;

Matriz_TL_std(1,:)=Group_Results_wo_ITI.Intro_Task_Group.TL_acum_group_std;
Matriz_TL_std(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.TL_acum_group_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'0',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains 0.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains 0.' 'png']);

%% ------------------------ MICRO GAINS TAPPING------------------------------------

Matriz_MOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_tapping_mean_1st;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_tapping_mean_1st;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_tapping_mean_1st;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_tapping_mean_1st;

Matriz_TL_acum(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_tapping_mean_1st;
Matriz_TL_acum(2,:)=Resultados_1st_to_0_ITI.TL_acum_tapping_mean_1st;

aux_ITI=MicroGains_speed(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.speed_group,37);
aux_wo_ITI=MicroGains_speed(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.speed_group,37);

Resultados_1st_to_0_ITI.MOGS_acum_tapping_std=aux_ITI.MOGS_acum_tapping_std;
Resultados_1st_to_0_ITI.MONGS_acum_tapping_std=aux_ITI.MONGS_acum_tapping_std;
Resultados_1st_to_0_ITI.TL_acum_tapping_std=aux_ITI.TL_acum_tapping_std;

Resultados_1st_to_0_wo_ITI.MOGS_acum_tapping_std=aux_wo_ITI.MOGS_acum_tapping_std;
Resultados_1st_to_0_wo_ITI.MONGS_acum_tapping_std=aux_wo_ITI.MONGS_acum_tapping_std;
Resultados_1st_to_0_wo_ITI.TL_acum_tapping_std=aux_wo_ITI.TL_acum_tapping_std;

Matriz_MOGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_tapping_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_tapping_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_tapping_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_tapping_std;

Matriz_TL_std(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_tapping_std;
Matriz_TL_std(2,:)=Resultados_1st_to_0_ITI.TL_acum_tapping_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'0',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains 0 Tapping.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains 0 Tapping.' 'png']);
% struct.flag_norm=1;
% struct.flag_tipo_norm='Z';
% struct.flag_filt=0;
% MicroGains_Plot_Grupal(Matriz_MOGS_acum(1,:),Matriz_MOGS_std(1,:),Matriz_MONGS_acum(1,:),Matriz_MONGS_std(1,:),Matriz_TL_acum(1,:),Matriz_TL_std(1,:),...
%     aux_wo_ITI.MOGS_acum_tapping,aux_wo_ITI.MONGS_acum_tapping,aux_wo_ITI.TL_acum_tapping,'Without ITI speed',struct)
% MicroGains_Plot_Grupal(Matriz_MOGS_acum(2,:),Matriz_MOGS_std(2,:),Matriz_MONGS_acum(2,:),Matriz_MONGS_std(2,:),Matriz_TL_acum(2,:),Matriz_TL_std(2,:),...
%     aux_ITI.MOGS_acum_tapping,aux_ITI.MONGS_acum_tapping,aux_ITI.TL_acum_tapping,'With ITI speed',struct)
%% ---------------------------MICRO MICRO GAINS ----------------------------

% media por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_media_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_media_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_std;


% MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0')
% saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'fig']);
% saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'png']);

struct.flag_norm=0;
struct.flag_filt=0;
MeanMicroMicroGains_Plot_Grupal(Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_mean,Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_std,Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_std,...
    Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_mean,Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_mean,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group,'Without ITI',struct,'Media',...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_media_group)

MeanMicroMicroGains_Plot_Grupal(Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_mean,Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_std,Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_std,...
    Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_mean,Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_mean,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group,'With ITI',struct,'Media',...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_media_group)

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% mediana por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_mediana_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_mediana_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% media por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_media_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_media_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_std;



MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;


% mediana por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_mediana_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_mediana_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        MEDIA DE CADA BLOQUE                         %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Learning_ITI.InterKey_ITI=MeanPerBlock_Learning(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.iki_visual_group_mean);
Learning_wo_ITI.InterKey_wo_ITI=MeanPerBlock_Learning(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group, ...
    Group_Results_wo_ITI.Intro_Task_Group.iki_visual_group_mean);

Grupo_ITI.Interkey.media_por_bloque=Learning_ITI.InterKey_ITI.media_por_bloque;
Grupo_ITI.Interkey.mediana_por_bloque=Learning_ITI.InterKey_ITI.mediana_por_bloque;
Grupo_wo_ITI.Interkey.media_por_bloque=Learning_wo_ITI.InterKey_wo_ITI.media_por_bloque;
Grupo_wo_ITI.Interkey.mediana_por_bloque=Learning_wo_ITI.InterKey_wo_ITI.mediana_por_bloque;


%%
Learning_ITI.Speed_ITI=MeanPerBlock_Learning(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.speed_group, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.speed_visual_group_mean);
Learning_wo_ITI.Speed_wo_ITI=MeanPerBlock_Learning(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.speed_group, ...
    Group_Results_wo_ITI.Intro_Task_Group.speed_visual_group_mean);

Grupo_ITI.Speed.media_por_bloque=Learning_ITI.Speed_ITI.media_por_bloque;
Grupo_ITI.Speed.mediana_por_bloque=Learning_ITI.Speed_ITI.mediana_por_bloque;
Grupo_wo_ITI.Speed.media_por_bloque=Learning_wo_ITI.Speed_wo_ITI.media_por_bloque;
Grupo_wo_ITI.Speed.mediana_por_bloque=Learning_wo_ITI.Speed_wo_ITI.mediana_por_bloque;

%%
InterKey_ITI_cero=MeanPerBlock_Learning([], Resultados_1st_to_0_ITI.iki_visual_mean);
InterKey_wo_ITI_cero=MeanPerBlock_Learning([], Resultados_1st_to_0_wo_ITI.iki_visual_mean);

Learning_ITI.InterKey_ITI.Media_de_la_Media_cero=InterKey_ITI_cero.Media_de_la_media;
Learning_ITI.InterKey_ITI.Mediana_de_la_Media_cero=InterKey_ITI_cero.Mediana_de_la_media;
Learning_wo_ITI.InterKey_wo_ITI.Media_de_la_Media_cero=InterKey_wo_ITI_cero.Media_de_la_media;
Learning_wo_ITI.InterKey_wo_ITI.Mediana_de_la_Media_cero=InterKey_wo_ITI_cero.Mediana_de_la_media;

%%
Speed_ITI_cero=MeanPerBlock_Learning([],Resultados_1st_to_0_ITI.speed_visual_mean);
Speed_wo_ITI_cero=MeanPerBlock_Learning([],Resultados_1st_to_0_wo_ITI.speed_visual_mean);

Learning_ITI.Speed_ITI.Media_de_la_Media_cero=Speed_ITI_cero.Media_de_la_media;
Learning_ITI.Speed_ITI.Mediana_de_la_Media_cero=Speed_ITI_cero.Mediana_de_la_media;
Learning_wo_ITI.Speed_wo_ITI.Media_de_la_Media_cero=Speed_wo_ITI_cero.Media_de_la_media;
Learning_wo_ITI.Speed_wo_ITI.Mediana_de_la_Media_cero=Speed_wo_ITI_cero.Mediana_de_la_media;


%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         ESTADISTICA MSL                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

MOGS(:,1)=Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_acum_group(:,29)';
MOGS(:,2)=Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_acum_group(:,29)';

MONGS(:,1)=Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_acum_group(:,29)';
MONGS(:,2)=Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_acum_group(:,29)';

TL(:,1)=Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_acum_group(:,29)';
TL(:,2)=Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_acum_group(:,29)';

GainsIKI=estadistica_MSL(MOGS, MONGS, TL);
%%
MOGS_speed(:,1)=aux_wo_ITI.MOGS_acum_tapping(:,29)';
MOGS_speed(:,2)=aux_ITI.MOGS_acum_tapping(:,29)';

MONGS_speed(:,1)=aux_wo_ITI.MONGS_acum_tapping(:,29)';
MONGS_speed(:,2)=aux_ITI.MONGS_acum_tapping(:,29)';

TL_speed(:,1)=aux_wo_ITI.TL_acum_tapping(:,29)';
TL_speed(:,2)=aux_ITI.TL_acum_tapping(:,29)';

GainsSpeed=estadistica_MSL(MOGS_speed, MONGS_speed, TL_speed);