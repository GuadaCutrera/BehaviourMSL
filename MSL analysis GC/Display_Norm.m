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

%%-------------------------------------------------------------------------

%SIMKEYPRESS
% Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Media\Piloto MSL time sin ITI - simKeyPress\Grupo\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Media\Piloto MSL time 1s - simKeyPress\Grupo\Group_Results.mat');
% pathGuardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Normalizado a cero\Media - SimKeyPress\';

% SIN ESA CONDICION
% Group_Results_wo_ITI= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Media\Piloto MSL time sin ITI\Grupo\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Media\Piloto MSL time 1s\Grupo\Group_Results.mat');
% pathGuardar='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\ComparePlots\Normalizado a cero\Media - original\';

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


Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,1,'0',pathGuardar);

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


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%mediana por bloque - media across
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


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%media por bloque - mediana across
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


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_mediaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%mediana por bloque - mediana across
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


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_original_medianaB_medianaS.' 'png']);

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

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_mediaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_mediaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%mediana por bloque - media across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_acum_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_acum_mean;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_acum_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_acum_mean;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_mean;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_mean;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_medianaB_mediaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_medianaB_mediaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%media por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_acum_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_acum_median;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_acum_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_acum_median;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_median;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_corr_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_corr_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_corr_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_corr_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_mediaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_mediaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%%mediana por bloque - mediana across
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_acum_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_acum_median;

Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_acum_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_acum_median;

Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_median;

Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_median;

std_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_acum_std;
std_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_acum_std;

std_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_acum_std;
std_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_acum_std;

std_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_corr_std;
std_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_corr_std;

std_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_corr_std;
std_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_corr_std;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana',std_MicroMOGS,std_MicroMONGS,std_MicroMOGS_acum,std_MicroMONGS_acum,1,'')
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_medianaB_medianaS.' 'fig']);
saveas(gcf,[pathGuardar 'MicroMicroGains_corr_medianaB_medianaS.' 'png']);

clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum;
clear std_MicroMOGS; clear std_MicroMONGS; clear std_MicroMOGS_acum; clear std_MicroMONGS_acum;

%% PLOT INTERACTIVO

%--------------------------- IKI ------------------------------------------
%pasar de original a corr: cambiar el nombre de la figura en el save y
%dentro del plot interactivo agregar _corr
PlotInteractivo(ones(16),Group_Results_w_ITI_1s.Group_Results.Group_Parameters,Group_Results_w_ITI_1s.Group_Results,'')
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_ITI.' 'fig']);
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_ITI.' 'png']);
PlotInteractivo(ones(16),Group_Results_wo_ITI.Group_Results.Group_Parameters,Group_Results_wo_ITI.Group_Results,'')
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_wo_ITI.' 'fig']);
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_wo_ITI.' 'png']);


%% -------------------------- SPEED -----------------------------------------
PlotInteractivo(ones(16),Group_Results_w_ITI_1s.Group_Results.Group_Parameters,Group_Results_w_ITI_1s.Group_Results,'')
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_ITI_speed.' 'fig']);
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_ITI_speed.' 'png']);
PlotInteractivo(ones(16),Group_Results_wo_ITI.Group_Results.Group_Parameters,Group_Results_wo_ITI.Group_Results,'')
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_wo_ITI_speed.' 'fig']);
saveas(gcf,[pathGuardar 'Plot_Interactivo_original_wo_ITI_speed.' 'png']);

%% --------------------- ESTADISTICA --------------------------------------
MOGS(:,1)=Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group(:,29)';
MOGS(:,2)=Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_acumulado_group(:,29)';

MONGS(:,1)=Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group(:,29)';
MONGS(:,2)=Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_acumulado_group(:,29)';

TL(:,1)=Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group(:,29)';
TL(:,2)=Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_acumulado_group(:,29)';

GainsIKI=estadistica_MSL(MOGS, MONGS, TL);

%%
MOGS_corr(:,1)=Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group_corr(:,29)';
MOGS_corr(:,2)=Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_acumulado_group_corr(:,29)';

MONGS_corr(:,1)=Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group_corr(:,29)';
MONGS_corr(:,2)=Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_acumulado_group_corr(:,29)';

TL_corr(:,1)=Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group_corr(:,29)';
TL_corr(:,2)=Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_acumulado_group_corr(:,29)';

GainsIKI_corr=estadistica_MSL(MOGS_corr, MONGS_corr, TL_corr);