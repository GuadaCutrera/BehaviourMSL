%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                 TIME SUBJECTS COMPARE                              %%%
%%% solo comparo los bloques de tarea. Los hago empezar desde distintos
%%% puntos. 
%%% A ambos grupos debí quitarle un punto de un sujeto que era conflictivo
%%% por eso la carpeta se llama Grupo_punto.

clear all;
clc

Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Group_Results.mat');
Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Group_Results.mat');
path_para_Guardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Sin Intro\';

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             ORIGINAL                                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Original\'];

%---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_mean;
Matriz_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_mean;
std_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_std;
std_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_std;

Matriz_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_mean;
Matriz_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_mean;
std_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_std;
std_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,0,'',pathGuardar);

% LearningCompare(Matriz_speed,2)
% saveas(gcf,[pathGuardar 'TS_original.' 'fig']);
% saveas(gcf,[pathGuardar 'TS_original.' 'png']);
% 
% LearningCompare(Matriz_iki,2)
% saveas(gcf,[pathGuardar 'iki_original.' 'fig']);
% saveas(gcf,[pathGuardar 'iki_original.' 'png']);

clear Matriz_iki; clear Matriz_speed; clear std_speed; clear std_iki;
%% --------------------- MICRO GAINS ----------------------------------------
Matriz_MOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_mean;
Matriz_MOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mogs_group_acumulado_mean;

Matriz_MONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_mean;
Matriz_MONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mongs_group_acumulado_mean;

Matriz_TL_acum(1,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_mean;
Matriz_TL_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.TL_group_acumulado_mean;

Matriz_MOGS_std(1,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_std;
Matriz_MOGS_std(2,:)=Group_Results_w_ITI_1s.Group_Results.mogs_group_acumulado_std;

Matriz_MONGS_std(1,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_std;
Matriz_MONGS_std(2,:)=Group_Results_w_ITI_1s.Group_Results.mongs_group_acumulado_std;

Matriz_TL_std(1,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_std;
Matriz_TL_std(2,:)=Group_Results_w_ITI_1s.Group_Results.TL_group_acumulado_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',0,'',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_original.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_original.' 'png']);


% ---------------------------MICRO MICRO GAINS ----------------------------

%% media por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_acum_mean;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_acum_mean;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_mean;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% mediana por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_acum_mean;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_acum_mean;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_mean;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% media por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_acum_median;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_acum_median;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_median;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;


% mediana por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_acum_median;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_acum_median;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_median;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         Primer punto a cero                         %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Primer punto 0\'];
Resultados_1st_to_0_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMONGS_acum_group,0);


Resultados_1st_to_0_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMONGS_acum_group,0);


%% ---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Resultados_1st_to_0_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_0_ITI.iki_visual_mean;
std_iki(1,:)=Resultados_1st_to_0_wo_ITI.iki_visual_std;
std_iki(2,:)=Resultados_1st_to_0_ITI.iki_visual_std;

Matriz_speed(1,:)=Resultados_1st_to_0_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_0_ITI.speed_visual_mean;
std_speed(1,:)=Resultados_1st_to_0_wo_ITI.speed_visual_std;
std_speed(2,:)=Resultados_1st_to_0_ITI.speed_visual_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,0,'0',pathGuardar);

LearningCompare(Matriz_speed,2)
saveas(gcf,[pathGuardar 'TS_1st_0.' 'fig']);
saveas(gcf,[pathGuardar 'TS_1st_0.' 'png']);

LearningCompare(Matriz_iki,2)
saveas(gcf,[pathGuardar 'iki_1st_0.' 'fig']);
saveas(gcf,[pathGuardar 'iki_1st_0.' 'png']);

clear Matriz_iki; clear Matriz_speed; clear std_speed; clear std_iki;
% --------------------- MICRO GAINS ----------------------------------------
Matriz_MOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_0_ITI.TL_acum_mean;

Matriz_MOGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_std;

Matriz_TL_std(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_std;
Matriz_TL_std(2,:)=Resultados_1st_to_0_ITI.TL_acum_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',0,'0',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_1st_0.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_1st_0.' 'png']);


clear Matriz_MOGS_acum; clear Matriz_MONGS_acum; clear Matriz_TL_acum; 
clear Matriz_MOGS_std; clear Matriz_MONGS_std; clear Matriz_TL_std;

% ------------------------------ MICRO GAINS RECALC------------------------
% quedan ambas negativas porque el primer punto es el mas grande y positivo
% entonces al llevarlo a cero resto un delta muy grande a todos los
% valores. 
Matriz_MOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_1st_point_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_1st_point_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_1st_point_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_1st_point_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_1st_point_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_0_ITI.TL_acum_1st_point_mean;

Matriz_MOGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_1st_point_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_1st_point_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_1st_point_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_1st_point_std;

Matriz_TL_std(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_1st_point_std;
Matriz_TL_std(2,:)=Resultados_1st_to_0_ITI.TL_acum_1st_point_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',0,'0',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_1st_0_recalc.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_1st_0_recalc.' 'png']);


clear Matriz_MOGS_acum; clear Matriz_MONGS_acum; clear Matriz_TL_acum; 
clear Matriz_MOGS_std; clear Matriz_MONGS_std; clear Matriz_TL_std;

%% ------------------------ MICRO MICRO GAINS -----------------------------
% media x bloque
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_mean;

Matriz_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_1st_point_mean;
Matriz_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_1st_point_mean;

Matriz_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_1st_point_mean;
Matriz_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_1st_point_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_media_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_media_mean;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_std;

std_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_1st_point_std;
std_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_1st_point_std;

std_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_1st_point_std;
std_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_1st_point_std;

std_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_std;
std_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_media_std;

std_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_std;
std_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_media_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% mediana x bloque - media across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_mean;

Matriz_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_1st_point_mean;
Matriz_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_1st_point_mean;

Matriz_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_1st_point_mean;
Matriz_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_1st_point_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_mediana_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_mediana_mean;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_std;

std_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_1st_point_std;
std_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_1st_point_std;

std_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_1st_point_std;
std_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_1st_point_std;

std_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_std;
std_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_mediana_std;

std_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_std;
std_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_mediana_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_medianaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% media x bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_median;

Matriz_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_1st_point_median;
Matriz_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_1st_point_median;

Matriz_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_1st_point_median;
Matriz_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_1st_point_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_media_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_media_median;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_std;

std_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_media_1st_point_std;
std_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_media_1st_point_std;

std_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_media_1st_point_std;
std_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_media_1st_point_std;

std_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_media_std;
std_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_media_std;

std_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_media_std;
std_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_media_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_mediaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% mediana x bloque y mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_median;

Matriz_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_1st_point_median;
Matriz_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_1st_point_median;

Matriz_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_1st_point_median;
Matriz_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_1st_point_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_mediana_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_mediana_median;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_std;

std_MicroMOGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_acum_mediana_1st_point_std;
std_MicroMOGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_acum_mediana_1st_point_std;

std_MicroMONGS_acum_recalc(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_acum_mediana_1st_point_std;
std_MicroMONGS_acum_recalc(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_acum_mediana_1st_point_std;


std_MicroMOGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MOGS_mediana_std;
std_MicroMOGS(2,:)=Resultados_1st_to_0_ITI.Micro_MOGS_mediana_std;

std_MicroMONGS(1,:)=Resultados_1st_to_0_wo_ITI.Micro_MONGS_mediana_std;
std_MicroMONGS(2,:)=Resultados_1st_to_0_ITI.Micro_MONGS_mediana_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        Primer punto a uno                           %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Primer punto 1\'];
Resultados_1st_to_1_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMONGS_acum_group,1);


Resultados_1st_to_1_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMONGS_acum_group,1);

%% ---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Resultados_1st_to_1_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_1_ITI.iki_visual_mean;
std_iki(1,:)=Resultados_1st_to_1_wo_ITI.iki_visual_std;
std_iki(2,:)=Resultados_1st_to_1_ITI.iki_visual_std;

Matriz_speed(1,:)=Resultados_1st_to_1_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_1_ITI.speed_visual_mean;
std_speed(1,:)=Resultados_1st_to_1_wo_ITI.speed_visual_std;
std_speed(2,:)=Resultados_1st_to_1_ITI.speed_visual_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,0,'1',pathGuardar);

LearningCompare(Matriz_speed,2)
saveas(gcf,[pathGuardar 'TS_1st_1.' 'fig']);
saveas(gcf,[pathGuardar 'TS_1st_1.' 'png']);

LearningCompare(Matriz_iki,2)
saveas(gcf,[pathGuardar 'iki_1st_1.' 'fig']);
saveas(gcf,[pathGuardar 'iki_1st_1.' 'png']);

clear Matriz_iki; clear Matriz_speed; clear std_speed; clear std_iki;
% --------------------- MICRO GAINS ----------------------------------------
Matriz_MOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.MOGS_acum_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_1_ITI.MOGS_acum_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.MONGS_acum_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_1_ITI.MONGS_acum_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_1_wo_ITI.TL_acum_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_1_ITI.TL_acum_mean;

Matriz_MOGS_std(1,:)=Resultados_1st_to_1_wo_ITI.MOGS_acum_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_1_ITI.MOGS_acum_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_1_wo_ITI.MONGS_acum_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_1_ITI.MONGS_acum_std;

Matriz_TL_std(1,:)=Resultados_1st_to_1_wo_ITI.TL_acum_std;
Matriz_TL_std(2,:)=Resultados_1st_to_1_ITI.TL_acum_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',0,'1',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_1st_1.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_1st_1.' 'png']);


clear Matriz_MOGS_acum; clear Matriz_MONGS_acum; clear Matriz_TL_acum; 
clear Matriz_MOGS_std; clear Matriz_MONGS_std; clear Matriz_TL_std;

% ------------------------------ MICRO GAINS RECALC------------------------
% como son todos los valores del no acumulado similares a 1, el acumulado
% va a llegar a 36 aprox y ambos quedan positivos. La unica chance de
% refernnciar al primer punto las ganancias es a cero.

Matriz_MOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.MOGS_acum_1st_point_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_1_ITI.MOGS_acum_1st_point_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.MONGS_acum_1st_point_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_1_ITI.MONGS_acum_1st_point_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_1_wo_ITI.TL_acum_1st_point_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_1_ITI.TL_acum_1st_point_mean;

Matriz_MOGS_std(1,:)=Resultados_1st_to_1_wo_ITI.MOGS_acum_1st_point_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_1_ITI.MOGS_acum_1st_point_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_1_wo_ITI.MONGS_acum_1st_point_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_1_ITI.MONGS_acum_1st_point_std;

Matriz_TL_std(1,:)=Resultados_1st_to_1_wo_ITI.TL_acum_1st_point_std;
Matriz_TL_std(2,:)=Resultados_1st_to_1_ITI.TL_acum_1st_point_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',0,'1',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_1st_1_recalc.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_1st_1_recalc.' 'png']);


clear Matriz_MOGS_acum; clear Matriz_MONGS_acum; clear Matriz_TL_acum; 
clear Matriz_MOGS_std; clear Matriz_MONGS_std; clear Matriz_TL_std;

%% ------------------------ MICRO MICRO GAINS -----------------------------
% media x bloque
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_media_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_media_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_media_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_media_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_media_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_media_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_media_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_media_mean;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_media_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_media_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_media_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_media_std;

std_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_media_std;
std_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_media_std;

std_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_media_std;
std_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_media_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'1')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% mediana x bloque - media across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_mediana_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_mediana_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_mediana_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_mediana_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_mediana_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_mediana_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_mediana_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_mediana_mean;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_mediana_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_mediana_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_mediana_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_mediana_std;

std_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_mediana_std;
std_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_mediana_std;

std_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_mediana_std;
std_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_mediana_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'1')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_medianaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% media x bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_media_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_media_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_media_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_media_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_media_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_media_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_media_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_media_median;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_media_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_media_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_media_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_media_std;

std_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_media_std;
std_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_media_std;

std_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_media_std;
std_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_media_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'1')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_mediaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% mediana x bloque y mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_mediana_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_mediana_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_mediana_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_mediana_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_mediana_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_mediana_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_mediana_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_mediana_median;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_acum_mediana_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_acum_mediana_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_acum_mediana_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_acum_mediana_std;

std_MicroMOGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MOGS_mediana_std;
std_MicroMOGS(2,:)=Resultados_1st_to_1_ITI.Micro_MOGS_mediana_std;

std_MicroMONGS(1,:)=Resultados_1st_to_1_wo_ITI.Micro_MONGS_mediana_std;
std_MicroMONGS(2,:)=Resultados_1st_to_1_ITI.Micro_MONGS_mediana_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'1')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        Primer punto a dos                           %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Primer punto 2\'];
Resultados_1st_to_2_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mediana_MicroMONGS_acum_group,2);


Resultados_1st_to_2_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mediana_MicroMONGS_acum_group,2);

%---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Resultados_1st_to_2_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_2_ITI.iki_visual_mean;
std_iki(1,:)=Resultados_1st_to_2_wo_ITI.iki_visual_std;
std_iki(2,:)=Resultados_1st_to_2_ITI.iki_visual_std;

Matriz_speed(1,:)=Resultados_1st_to_2_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_2_ITI.speed_visual_mean;
std_speed(1,:)=Resultados_1st_to_2_wo_ITI.speed_visual_std;
std_speed(2,:)=Resultados_1st_to_2_ITI.speed_visual_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,0,'2',pathGuardar);

LearningCompare(Matriz_speed,2)
saveas(gcf,[pathGuardar 'TS_1st_2.' 'fig']);
saveas(gcf,[pathGuardar 'TS_1st_2.' 'png']);

LearningCompare(Matriz_iki,2)
saveas(gcf,[pathGuardar 'iki_1st_2.' 'fig']);
saveas(gcf,[pathGuardar 'iki_1st_2.' 'png']);

clear Matriz_iki; clear Matriz_speed; clear std_speed; clear std_iki;
% --------------------- MICRO GAINS ----------------------------------------
Matriz_MOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.MOGS_acum_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_2_ITI.MOGS_acum_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.MONGS_acum_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_2_ITI.MONGS_acum_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_2_wo_ITI.TL_acum_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_2_ITI.TL_acum_mean;

Matriz_MOGS_std(1,:)=Resultados_1st_to_2_wo_ITI.MOGS_acum_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_2_ITI.MOGS_acum_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_2_wo_ITI.MONGS_acum_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_2_ITI.MONGS_acum_std;

Matriz_TL_std(1,:)=Resultados_1st_to_2_wo_ITI.TL_acum_std;
Matriz_TL_std(2,:)=Resultados_1st_to_2_ITI.TL_acum_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',0,'2',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_1st_2.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_1st_2.' 'png']);


clear Matriz_MOGS_acum; clear Matriz_MONGS_acum; clear Matriz_TL_acum; 
clear Matriz_MOGS_std; clear Matriz_MONGS_std; clear Matriz_TL_std;


%% ------------------------ MICRO MICRO GAINS -----------------------------
% media x bloque
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_media_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_media_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_media_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_media_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_media_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_media_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_media_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_media_mean;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_media_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_media_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_media_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_media_std;

std_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_media_std;
std_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_media_std;

std_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_media_std;
std_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_media_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'2')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% mediana x bloque - media across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_mediana_mean;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_mediana_mean;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_mediana_mean;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_mediana_mean;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_mediana_mean;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_mediana_mean;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_mediana_mean;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_mediana_mean;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_mediana_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_mediana_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_mediana_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_mediana_std;

std_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_mediana_std;
std_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_mediana_std;

std_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_mediana_std;
std_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_mediana_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'2')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_medianaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% media x bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_media_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_media_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_media_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_media_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_media_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_media_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_media_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_media_median;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_media_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_media_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_media_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_media_std;

std_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_media_std;
std_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_media_std;

std_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_media_std;
std_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_media_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'2')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_mediaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% mediana x bloque y mediana across
Matriz_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_mediana_median;
Matriz_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_mediana_median;

Matriz_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_mediana_median;
Matriz_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_mediana_median;

Matriz_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_mediana_median;
Matriz_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_mediana_median;

Matriz_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_mediana_median;
Matriz_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_mediana_median;

std_MicroMOGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_acum_mediana_std;
std_MicroMOGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_acum_mediana_std;

std_MicroMONGS_acum(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_acum_mediana_std;
std_MicroMONGS_acum(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_acum_mediana_std;

std_MicroMOGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MOGS_mediana_std;
std_MicroMOGS(2,:)=Resultados_1st_to_2_ITI.Micro_MOGS_mediana_std;

std_MicroMONGS(1,:)=Resultados_1st_to_2_wo_ITI.Micro_MONGS_mediana_std;
std_MicroMONGS(2,:)=Resultados_1st_to_2_ITI.Micro_MONGS_mediana_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'2')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             NORM 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Norm\'];
%---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_corr_mean;
Matriz_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_corr_mean;
std_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_corr_std;
std_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_corr_std;


% NO USO ESTA XQ VALORES MUY GRANDES AL ESTAR CERCA DE CERO 
%orden: iki - norm - speed
% Matriz_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_corr_mean;
% Matriz_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_corr_mean;
% std_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_corr_std;
% std_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_corr_std;

% orden: iki - speed - norm

% w ITI
speed_group=NaN(size(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group));
speed_norm=NaN(size(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group));
for i=1:size(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group,1)
    speed_group(i,:)=1./(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group(i,:));
    speed_norm(i,:)=rescale(speed_group(i,:));
end

speed_norm_mean_wITI=nanmean(speed_norm);
speed_norm_std_wITI=nanstd(speed_norm)./sqrt(16);

% wo ITI
speed_group=NaN(size(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group));
speed_norm=NaN(size(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group));
for i=1:size(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group,1)
    speed_group(i,:)=1./(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group(i,:));
    speed_norm(i,:)=rescale(speed_group(i,:));
end

speed_norm_mean_woITI=nanmean(speed_norm);
speed_norm_std_woITI=nanstd(speed_norm)./sqrt(16);

Matriz_speed(1,:)=speed_norm_mean_woITI;
Matriz_speed(2,:)=speed_norm_mean_wITI;
std_speed(1,:)=speed_norm_std_woITI;
std_speed(2,:)=speed_norm_std_wITI;

Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,0,'Norm',pathGuardar);




