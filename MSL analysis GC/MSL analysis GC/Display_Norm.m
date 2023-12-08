% la intro y task de 16 % sin el punto del wo ITI NORMALIZADO A CERO
clc
clear

% SIMKEYPRESS
Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Mediana\Piloto MSL time sin ITI - simKeyPress\Grupo\Group_Results.mat');
Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Mediana\Piloto MSL time 1s - simKeyPress\Grupo\Group_Results.mat');
pathGuardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Normalizado a cero\Mediana - SimKeyPress\';

% SIN ESA CONDICION
% Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Mediana\Piloto MSL time sin ITI\Grupo\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Mediana\Piloto MSL time 1s\Grupo\Group_Results.mat');
% pathGuardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Normalizado a cero\Mediana - original\';

%% -------------------------- IKI y SPEED -----------------------------------

Matriz_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_mean;
Matriz_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_mean;
std_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_std;
std_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_std;

Matriz_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_mean;
Matriz_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_mean;
std_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_std;
std_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'',pathGuardar);

%% -------------------------- IKI y SPEED corr -----------------------------------

Matriz_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_corr_mean;
Matriz_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_corr_mean;
std_iki(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_corr_std;
std_iki(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_corr_std;

Matriz_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_corr_mean;
Matriz_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_corr_mean;
std_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_corr_std;
std_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_corr_std;


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'',pathGuardar);

%% ------------------------ MICRO GAINS ------------------------------------

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

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_original.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_original.' 'png']);

%% ------------------------ MICRO GAINS corr------------------------------------

Matriz_MOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_corr_mean;
Matriz_MOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mogs_group_acumulado_corr_mean;

Matriz_MONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_corr_mean;
Matriz_MONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mongs_group_acumulado_corr_mean;

Matriz_TL_acum(1,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_corr_mean;
Matriz_TL_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.TL_group_acumulado_corr_mean;

Matriz_MOGS_std(1,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_corr_std;
Matriz_MOGS_std(2,:)=Group_Results_w_ITI_1s.Group_Results.mogs_group_acumulado_corr_std;

Matriz_MONGS_std(1,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_corr_std;
Matriz_MONGS_std(2,:)=Group_Results_w_ITI_1s.Group_Results.mongs_group_acumulado_corr_std;

Matriz_TL_std(1,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_corr_std;
Matriz_TL_std(2,:)=Group_Results_w_ITI_1s.Group_Results.TL_group_acumulado_corr_std;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media',1,'',Matriz_MOGS_std,Matriz_MONGS_std,Matriz_TL_std)
saveas(gcf,[pathGuardar 'MicroGains_corr.' 'fig']);
saveas(gcf,[pathGuardar 'MicroGains_corr.' 'png']);

%% -------------------- MICRO MICRO GAINS ---------------------------------
%%media por bloque - media across
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

%% -------------------- MICRO MICRO GAINS  CORR---------------------------------
%%media por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_acum_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_acum_mean;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_acum_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_acum_mean;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_mean;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,0,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;
