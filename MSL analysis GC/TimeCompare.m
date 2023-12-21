%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             PLOTS con INTRO
clear
clc
%close all

% la intro y task de 16 % sin el punto del wo ITI
% Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Intro + Task\Group_Results_Intro_Task.mat');
% Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Intro + Task\Group_Results_Intro_Task2.mat');
% path_para_Guardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Con Intro\';

%con el punto del wo ITI - completo
% Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Intro + Task\Group_Results_Intro_Task2.mat');
% Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Intro + Task\Group_Results_Intro_Task.mat');
% path_para_Guardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Con Intro - completo\';



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Original                                        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Original\'];

% PlotInteractivo(ones(1,16),Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task,Group_Results_w_ITI_1s.Intro_Task_Group,'');
% saveas(gcf,[pathGuardar 'Interactivo_original_wITI_speed.' 'fig']);
% PlotInteractivo(ones(1,16),Group_Results_wo_ITI.Intro_Task_Group.Intro_Task,Group_Results_wo_ITI.Intro_Task_Group,'');
% saveas(gcf,[pathGuardar 'Interactivo_original_woITI_speed.' 'fig']);

%% -------------------------- IKI y SPEED -----------------------------------

Matriz_iki(1,:)=Group_Results_wo_ITI.Intro_Task_Group.iki_visual_group_mean;
Matriz_iki(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.iki_visual_group_mean;
std_iki(1,:)=Group_Results_wo_ITI.Intro_Task_Group.iki_visual_group_std;
std_iki(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.iki_visual_group_std;

Matriz_speed(1,:)=Group_Results_wo_ITI.Intro_Task_Group.speed_visual_group_mean;
Matriz_speed(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.speed_visual_group_mean;
std_speed(1,:)=Group_Results_wo_ITI.Intro_Task_Group.speed_visual_group_std;
std_speed(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.speed_visual_group_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'',pathGuardar);

% LearningCompare(Matriz_speed,2)
% saveas(gcf,[pathGuardar 'TS_original.' 'fig']);
% saveas(gcf,[pathGuardar 'TS_original.' 'png']);
% 
% LearningCompare(Matriz_iki,2)
% saveas(gcf,[pathGuardar 'iki_original.' 'fig']);
% saveas(gcf,[pathGuardar 'iki_original.' 'png']);

clear Matriz_iki; clear Matriz_speed; clear std_speed; clear std_iki;

%% ------------------------ MICRO GAINS ------------------------------------

Matriz_MOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MOGS_acum_group_mean;
Matriz_MOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MOGS_acum_group_mean;

Matriz_MONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MONGS_acum_group_mean;
Matriz_MONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MONGS_acum_group_mean;

Matriz_TL_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.TL_acum_group_mean;
Matriz_TL_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.TL_acum_group_mean;

Matriz_MOGS_std(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MOGS_acum_group_std;
Matriz_MOGS_std(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MOGS_acum_group_std;

Matriz_MONGS_std(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MONGS_acum_group_std;
Matriz_MONGS_std(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MONGS_acum_group_std;

Matriz_TL_std(1,:)=Group_Results_wo_ITI.Intro_Task_Group.TL_acum_group_std;
Matriz_TL_std(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.TL_acum_group_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_original.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_original.' 'png']);

% ---------------------------MICRO MICRO GAINS ----------------------------

%% media por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_mean;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_mean;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_mean;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% mediana por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_mean;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_mean;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_mean;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% media por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_median;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_median;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_median;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_media_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_media_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_media_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_media_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_media_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_media_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_media_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_media_group_std;



MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;


% mediana por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_median;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_median;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_median;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_acum_mediana_group_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_acum_mediana_group_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMOGS_mediana_group_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMOGS_mediana_group_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Intro_Task_Group.MicroMONGS_mediana_group_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Intro_Task_Group.MicroMONGS_mediana_group_std;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'png']);
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Primer punto a cero                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Primer punto 0\'];

Resultados_1st_to_0_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_mediana_group,0);

Resultados_1st_to_0_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_mediana_group,0);

% PlotInteractivo(ones(1,16),Resultados_1st_to_0_wo_ITI,Resultados_1st_to_0_wo_ITI,'')
% saveas(gcf,[pathGuardar 'Interactivo_1st_to_0_woITI_speed.' 'fig']);
% PlotInteractivo(ones(1,16),Resultados_1st_to_0_ITI,Resultados_1st_to_0_ITI,'')
% saveas(gcf,[pathGuardar 'Interactivo_1st_to_0_wITI_speed.' 'fig']);

%% ---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Resultados_1st_to_0_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_0_ITI.iki_visual_mean;
std_iki(1,:)=Resultados_1st_to_0_wo_ITI.iki_visual_std;
std_iki(2,:)=Resultados_1st_to_0_ITI.iki_visual_std;

Matriz_speed(1,:)=Resultados_1st_to_0_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_0_ITI.speed_visual_mean;
std_speed(1,:)=Resultados_1st_to_0_wo_ITI.speed_visual_std;
std_speed(2,:)=Resultados_1st_to_0_ITI.speed_visual_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'0',pathGuardar);

LearningCompare(Matriz_speed,2)
saveas(gcf,[pathGuardar 'TS_1st_0.' 'fig']);
saveas(gcf,[pathGuardar 'TS_1st_0.' 'png']);

LearningCompare(Matriz_iki,2)
saveas(gcf,[pathGuardar 'iki_1st_0.' 'fig']);
saveas(gcf,[pathGuardar 'iki_1st_0.' 'png']);

clear Matriz_iki; clear Matriz_speed; clear std_speed; clear std_iki;
%% --------------------- MICRO GAINS  tapping----------------------------------------
% para los del iki cambiar el nombre: borrar el tapping y en la funcion de
% plot los lim entre -1 y 1
Matriz_MOGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_tapping_mean;
Matriz_MOGS_acum(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_tapping_mean;

Matriz_MONGS_acum(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_tapping_mean;
Matriz_MONGS_acum(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_tapping_mean;

Matriz_TL_acum(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_tapping_mean;
Matriz_TL_acum(2,:)=Resultados_1st_to_0_ITI.TL_acum_tapping_mean;

Matriz_MOGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MOGS_acum_tapping_std;
Matriz_MOGS_std(2,:)=Resultados_1st_to_0_ITI.MOGS_acum_tapping_std;

Matriz_MONGS_std(1,:)=Resultados_1st_to_0_wo_ITI.MONGS_acum_tapping_std;
Matriz_MONGS_std(2,:)=Resultados_1st_to_0_ITI.MONGS_acum_tapping_std;

Matriz_TL_std(1,:)=Resultados_1st_to_0_wo_ITI.TL_acum_tapping_std;
Matriz_TL_std(2,:)=Resultados_1st_to_0_ITI.TL_acum_tapping_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'0',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_1st_0.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_1st_0.' 'png']);


clear Matriz_MOGS_acum; clear Matriz_MONGS_acum; clear Matriz_TL_acum; 
clear Matriz_MOGS_std; clear Matriz_MONGS_std; clear Matriz_TL_std;

%% ------------------------------ MICRO GAINS RECALC------------------------
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

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'0',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'0',Matriz_MicroMOGS_acum_recalc,Matriz_MicroMONGS_acum_recalc,std_MicroMOGS_acum_recalc,std_MicroMONGS_acum_recalc)
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_0_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Primer punto a uno                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Primer punto 1\'];

Resultados_1st_to_1_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_mediana_group,1);


Resultados_1st_to_1_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_mediana_group,1);

% PlotInteractivo(ones(1,16),Resultados_1st_to_1_wo_ITI,Resultados_1st_to_1_wo_ITI,'')
% saveas(gcf,[pathGuardar 'Interactivo_1st_to_1_woITI.' 'fig']);
% PlotInteractivo(ones(1,16),Resultados_1st_to_1_ITI,Resultados_1st_to_1_ITI,'')
% saveas(gcf,[pathGuardar 'Interactivo_1st_to_1_wITI.' 'fig']);

%% ---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Resultados_1st_to_1_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_1_ITI.iki_visual_mean;
std_iki(1,:)=Resultados_1st_to_1_wo_ITI.iki_visual_std;
std_iki(2,:)=Resultados_1st_to_1_ITI.iki_visual_std;

Matriz_speed(1,:)=Resultados_1st_to_1_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_1_ITI.speed_visual_mean;
std_speed(1,:)=Resultados_1st_to_1_wo_ITI.speed_visual_std;
std_speed(2,:)=Resultados_1st_to_1_ITI.speed_visual_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'1',pathGuardar);

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

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'1',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
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

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'1',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'1')
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'1')
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'1')
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'1')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_1_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;



%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Primer punto a dos                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Primer punto 2\'];

Resultados_1st_to_2_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MOGS_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MONGS_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.TL_acum_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group, ...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMOGS_acum_mediana_group,...
    Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.MicroMONGS_acum_mediana_group,2);


Resultados_1st_to_2_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MOGS_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MONGS_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.TL_acum_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_media_group,...
    Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMOGS_acum_mediana_group,...
   Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.MicroMONGS_acum_mediana_group,2);

% PlotInteractivo(ones(1,16),Resultados_1st_to_2_wo_ITI,Resultados_1st_to_2_wo_ITI,'')
% saveas(gcf,[pathGuardar 'Interactivo_1st_to_2_woITI.' 'fig']);
% PlotInteractivo(ones(1,16),Resultados_1st_to_2_ITI,Resultados_1st_to_2_ITI,'')
% saveas(gcf,[pathGuardar 'Interactivo_1st_to_2_wITI.' 'fig']);

%% ---------------------------- IKI - SPEED ---------------------------------
Matriz_iki(1,:)=Resultados_1st_to_2_wo_ITI.iki_visual_mean;
Matriz_iki(2,:)=Resultados_1st_to_2_ITI.iki_visual_mean;
std_iki(1,:)=Resultados_1st_to_2_wo_ITI.iki_visual_std;
std_iki(2,:)=Resultados_1st_to_2_ITI.iki_visual_std;

Matriz_speed(1,:)=Resultados_1st_to_2_wo_ITI.speed_visual_mean;
Matriz_speed(2,:)=Resultados_1st_to_2_ITI.speed_visual_mean;
std_speed(1,:)=Resultados_1st_to_2_wo_ITI.speed_visual_std;
std_speed(2,:)=Resultados_1st_to_2_ITI.speed_visual_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'2',pathGuardar);

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

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'2',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'2')
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'2')
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'2')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_mediaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

% mediana x bloque y mediana across
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

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'2')
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_1st_2_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;




% 
% 
% %% Micro
% %DATA CRUDA TASK
% 
% Matriz_MOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_mean,2));
% Matriz_MOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_corr_mean;
% Matriz_MOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mogs_group_acumulado_corr_mean;
% 
% Matriz_MONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_mean,2));
% Matriz_MONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_corr_mean;
% Matriz_MONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mongs_group_acumulado_corr_mean;
% 
% Matriz_TL_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.TL_group_acumulado_mean,2));
% Matriz_TL_acum(1,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_corr_mean;
% Matriz_TL_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.TL_group_acumulado_corr_mean;
% 
% MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media corr')
% 

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                             NORM 01
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
pathGuardar=[path_para_Guardar 'Norm\'];

% w ITI
speed_group=NaN(size(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group));
speed_norm=NaN(size(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group));
iki_norm=NaN(size(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group));

for i=1:size(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group,1)
    speed_group(i,:)=1./(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group(i,:));
    iki_norm(i,:)=rescale(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group(i,:));
    speed_norm(i,:)=rescale(speed_group(i,:));
end

iki_norm_mean_wITI=nanmean(iki_norm);
iki_norm_std_wITI=nanstd(iki_norm)./sqrt(16);
speed_norm_mean_wITI=nanmean(speed_norm);
speed_norm_std_wITI=nanstd(speed_norm)./sqrt(16);

% wo ITI
speed_group=NaN(size(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group));
speed_norm=NaN(size(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group));
iki_norm=NaN(size(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group));

for i=1:size(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group,1)
    speed_group(i,:)=1./(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group(i,:));
    iki_norm(i,:)=rescale(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group(i,:));
    speed_norm(i,:)=rescale(speed_group(i,:));
end

iki_norm_mean_woITI=nanmean(iki_norm);
iki_norm_std_woITI=nanstd(iki_norm)./sqrt(16);
speed_norm_mean_woITI=nanmean(speed_norm);
speed_norm_std_woITI=nanstd(speed_norm)./sqrt(16);

Matriz_speed(1,:)=speed_norm_mean_woITI;
Matriz_speed(2,:)=speed_norm_mean_wITI;
std_speed(1,:)=speed_norm_std_woITI;
std_speed(2,:)=speed_norm_std_wITI;

Matriz_iki(1,:)=iki_norm_mean_woITI;
Matriz_iki(2,:)=iki_norm_mean_wITI;
std_iki(1,:)=iki_norm_std_woITI;
std_iki(2,:)=iki_norm_std_wITI;

Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'Norm',pathGuardar);





