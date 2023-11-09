                            %% Comparaciones tipo analisis

%% ------------------------------------SIN ITI media -----------------------------
clear all
close all

Grupo_completo=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo\Group_Results.mat');
Grupo_15_sujetos=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_sin3\Group_Results.mat');
Grupo_sin_punto=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Group_Results.mat');

%-------------------------------- SIN ITI mediana  ------------------------
clear all
close all

Grupo_completo=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_mediana\Group_Results.mat');
Grupo_15_sujetos=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_sin3_mediana\Group_Results.mat');
Grupo_sin_punto=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto_mediana\Group_Results.mat');

%% ------------------------------------CON ITI 1S media -----------------------------
clear all
close all

Grupo_completo=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo\Group_Results.mat');
Grupo_15_sujetos=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_sin13\Group_Results.mat');
Grupo_sin_punto=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Group_Results.mat');

%%-------------------------------- CON ITI 1S mediana  ------------------------
clear all
close all

Grupo_completo=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_mediana\Group_Results.mat');
Grupo_15_sujetos=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_sin13_mediana\Group_Results.mat');
Grupo_sin_punto=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto_mediana\Group_Results.mat');


% LEARNING
flag_cantidad=3;
Matriz_Grupos=NaN(flag_cantidad,size(Grupo_completo.Group_Results.iki_visual_group_mean,2));

Matriz_Grupos(1,:)=Grupo_completo.Group_Results.iki_visual_group_mean;
Matriz_Grupos(2,:)=Grupo_15_sujetos.Group_Results.iki_visual_group_mean;
Matriz_Grupos(3,:)=Grupo_sin_punto.Group_Results.iki_visual_group_mean;

LearningCompare(Matriz_Grupos,flag_cantidad);

% MICRO GAINS 
Matriz_MOGS_acum=NaN(3,size(Grupo_completo.Group_Results.mogs_group_acumulado_mean,2));
Matriz_MOGS_acum(1,:)=Grupo_completo.Group_Results.mogs_group_acumulado_mean;
Matriz_MOGS_acum(2,:)=Grupo_15_sujetos.Group_Results.mogs_group_acumulado_mean;
Matriz_MOGS_acum(3,:)=Grupo_sin_punto.Group_Results.mogs_group_acumulado_mean;

Matriz_MONGS_acum=NaN(3,size(Grupo_completo.Group_Results.mongs_group_acumulado_mean,2));
Matriz_MONGS_acum(1,:)=Grupo_completo.Group_Results.mongs_group_acumulado_mean;
Matriz_MONGS_acum(2,:)=Grupo_15_sujetos.Group_Results.mongs_group_acumulado_mean;
Matriz_MONGS_acum(3,:)=Grupo_sin_punto.Group_Results.mongs_group_acumulado_mean;

Matriz_TL_acum=NaN(3,size(Grupo_completo.Group_Results.TL_group_acumulado_mean,2));
Matriz_TL_acum(1,:)=Grupo_completo.Group_Results.TL_group_acumulado_mean;
Matriz_TL_acum(2,:)=Grupo_15_sujetos.Group_Results.TL_group_acumulado_mean;
Matriz_TL_acum(3,:)=Grupo_sin_punto.Group_Results.TL_group_acumulado_mean;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media')




%% TIME media across
clear 

%Group_Results_w_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1,5s\Op2\GrupoTransprevia\Grupo\Group_Results.mat');

% %16 sujetos completo
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo\Group_Results.mat');

% 15 sujetos
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_sin3\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_sin13\Group_Results.mat');

% 16 sujetos sin punto
Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Group_Results.mat');
Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Group_Results.mat');

%la intro y task de 16 sin punto
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto\Group_Results_Intro_Task.mat');
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto\Group_Results_Intro_Task.mat');

% Estadistica MSL
%estadistica_MSL(Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group(:,end), Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group(:,end), Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group(:,end))

Results_ITI = FirstPointToZero(Group_Results_w_ITI_1s.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_w_ITI_1s.Group_Results.Group_Parameters.media_MicroMONGS_acum_group);


Results_wo_ITI = FirstPointToZero(Group_Results_wo_ITI.Group_Results.Group_Parameters.iki_visual_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mogs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.mongs_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.TL_acumulado_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMOGS_acum_group,...
    Group_Results_wo_ITI.Group_Results.Group_Parameters.media_MicroMONGS_acum_group);
%% TIME mediana across
clear 

% %16 sujetos completo
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_mediana\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_mediana\Group_Results.mat');

% % 15 sujetos
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_sin3_mediana\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_sin13_mediana\Group_Results.mat');

% 16 sujetos sin punto
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransprevia\Grupo_punto_mediana\Group_Results.mat');
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransprevia\Grupo_punto_mediana\Group_Results.mat');


%% KEY
clear 

Group_Results_w_ITI=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key 1,5s\Grupo\Group_Results.mat');
Group_Results_wo_ITI=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key sin ITI\Grupo\Group_Results.mat');
Group_Results_w_ITI_1s=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key 1s\Grupo\Group_Results.mat');

%% FLOR y GUILLE
%clear

Group_Results_Flor=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\FJ - MSL raw output data\Grupo3\Group_Results.mat');
%Group_Results_Guille_2022=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Behaviour_MSL_Guille\Grupo2022\Group_Results.mat');
Group_Results_Guille_2021=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Behaviour_MSL_Guille\Grupo2021\Group_Results.mat');
%Group_Results_Guille_40=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Pilot_MSL_Results_With_MOGs\Pilot_MSL_Results\Grupo2\Group_Results.mat');

%% IKI
flag_cantidad=2; %set avriable to cant of groups to compare


if flag_cantidad==4
    %Matriz_Grupos=NaN(flag_cantidad,size(Group_Results_Guille_40.Group_Results.iki_visual_group_mean,2));
    Matriz_Grupos=NaN(flag_cantidad,size(Group_Results_wo_ITI.Group_Results.iki_visual_group_mean,2));

    %Matriz_Grupos(1,:)=Group_Results_Guille_40.Group_Results.iki_visual_group_mean;
    Matriz_Grupos(1,1:size(Group_Results_Guille_2021.Group_Results.iki_visual_group_mean,2))=Group_Results_Guille_2021.Group_Results.iki_visual_group_mean;
    %Matriz_Grupos(3,1:size(Group_Results_Guille_2022.Group_Results.iki_visual_group_mean,2))=Group_Results_Guille_2022.Group_Results.iki_visual_group_mean;
    Matriz_Grupos(2,1:size(Group_Results_Flor.Group_Results.iki_visual_group_mean,2))=Group_Results_Flor.Group_Results.iki_visual_group_mean;
    Matriz_Grupos(3,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_mean;
    Matriz_Grupos(4,1:size(Group_Results_wo_ITI_key.Group_Results.iki_visual_group_mean,2))=Group_Results_wo_ITI_key.Group_Results.iki_visual_group_mean;

 

elseif flag_cantidad==3
    Matriz_Grupos=NaN(flag_cantidad,size(Group_Results_wo_ITI.Group_Results.iki_visual_group_mean,2));
    
    Matriz_Grupos(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_mean;
    Matriz_Grupos(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_mean;
    Matriz_Grupos(3,1:size(Group_Results_w_ITI.Group_Results.iki_visual_group_mean,2))=Group_Results_w_ITI.Group_Results.iki_visual_group_mean;
%     Matriz_Grupos(2,1:size(Group_Results_Guille_2021.Group_Results.iki_visual_group_mean,2))=Group_Results_Guille_2021.Group_Results.iki_visual_group_mean;
%     Matriz_Grupos(3,1:size(Group_Results_Flor.Group_Results.iki_visual_group_mean,2))=Group_Results_Flor.Group_Results.iki_visual_group_mean;


else
    Matriz_Grupos=NaN(flag_cantidad,size(Group_Results_wo_ITI.Group_Results.iki_visual_group_mean,2));
    %Matriz_Grupos=NaN(flag_cantidad,size(Group_Results_wo_ITI.Group_Results.speed_visual_group_mean,2));
    
%     Matriz_Grupos(1,:)=Group_Results_wo_ITI.Group_Results.iki_visual_group_mean;
%     Matriz_Grupos(2,:)=Group_Results_w_ITI_1s.Group_Results.iki_visual_group_mean;
%     Matriz_speed(1,:)=Group_Results_wo_ITI.Group_Results.speed_visual_group_mean;
%     Matriz_speed(2,:)=Group_Results_w_ITI_1s.Group_Results.speed_visual_group_mean;


%     Matriz_Grupos(1,1:size(Group_Results_w_ITI_key.Group_Results.iki_visual_group_mean,2))=Group_Results_w_ITI_key.Group_Results.iki_visual_group_mean;
%     Matriz_Grupos(2,1:size(Group_Results_w_ITI.Group_Results.iki_visual_group_mean,2))=Group_Results_w_ITI.Group_Results.iki_visual_group_mean;

end
LearningCompare(Matriz_Grupos,flag_cantidad)
% Visualization_Learning_Grupal(Results_wo_ITI.speed_visual_mean,Results_wo_ITI.speed_visual_std,'speed',['wo iti - crudo']);
% Visualization_Learning_Grupal(Results_ITI.speed_visual_mean,Results_ITI.speed_visual_std,'speed',['with iti - crudo']);



%% MICRO MICRO - media - media
% Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
% Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean;
% Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_acum_mean;
% %Matriz_MicroMOGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMogs_acum_mean,2))=Group_Results_w_ITI.Group_Results.media_MicroMogs_acum_mean;
% 
% Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
% Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_mean;
% Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_acum_mean;
% %Matriz_MicroMONGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMongs_acum_mean,2))=Group_Results_w_ITI.Group_Results.media_MicroMongs_acum_mean;
% 
% Matriz_MicroMOGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
% Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_mean;
% Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_mean;
% %Matriz_MicroMOGS(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMogs_mean,2))=Group_Results_w_ITI.Group_Results.media_MicroMogs_mean;
% 
% Matriz_MicroMONGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
% Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_mean;
% Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_mean;
% %Matriz_MicroMONGS(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMongs_mean,2))=Group_Results_w_ITI.Group_Results.media_MicroMongs_mean;

Matriz_MicroMOGS_acum=NaN(3,size(Results_ITI.Micro_MOGS_acum_mean,2));
Matriz_MicroMOGS_acum(1,:)=Results_wo_ITI.Micro_MOGS_acum_mean;
Matriz_MicroMOGS_acum(2,:)=Results_ITI.Micro_MOGS_acum_mean;

Matriz_MicroMONGS_acum=NaN(3,size(Results_ITI.Micro_MONGS_acum_mean,2));
Matriz_MicroMONGS_acum(1,:)=Results_wo_ITI.Micro_MONGS_acum_mean;
Matriz_MicroMONGS_acum(2,:)=Results_ITI.Micro_MONGS_acum_mean;

Matriz_MicroMOGS=NaN(3,size(Results_ITI.Micro_MOGS_mean,2));
Matriz_MicroMOGS(1,:)=Results_wo_ITI.Micro_MOGS_mean;
Matriz_MicroMOGS(2,:)=Results_ITI.Micro_MOGS_mean;

Matriz_MicroMONGS=NaN(3,size(Results_ITI.Micro_MONGS_mean,2));
Matriz_MicroMONGS(1,:)=Results_wo_ITI.Micro_MONGS_mean;
Matriz_MicroMONGS(2,:)=Results_ITI.Micro_MONGS_mean;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media')
%clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum

%% %----------------- MICRO MICRO - media - mediana (media del bloque, mediana across subj)
Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_acum_median;
%Matriz_MicroMOGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMogs_acum_median,2))=Group_Results_w_ITI.Group_Results.media_MicroMogs_acum_median;

Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_acum_median;
%Matriz_MicroMONGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMongs_acum_median,2))=Group_Results_w_ITI.Group_Results.media_MicroMongs_acum_median;

Matriz_MicroMOGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMogs_median;
%Matriz_MicroMOGS(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMogs_mean,2))=Group_Results_w_ITI.Group_Results.media_MicroMogs_median;

Matriz_MicroMONGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.media_MicroMongs_median;
%Matriz_MicroMONGS(3,1:size(Group_Results_w_ITI.Group_Results.media_MicroMongs_median,2))=Group_Results_w_ITI.Group_Results.media_MicroMongs_median;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum

% --------- MICRO MICRO - mediana - media (mediana del bloque, media across subj)
Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_acum_mean;
%Matriz_MicroMOGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMogs_acum_mean,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMogs_acum_mean;

Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_acum_mean;
%Matriz_MicroMONGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMongs_acum_mean,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMongs_acum_mean;

Matriz_MicroMOGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_mean;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_mean;
%Matriz_MicroMOGS(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMogs_mean,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMogs_mean;

Matriz_MicroMONGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_mean;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_mean;
%Matriz_MicroMONGS(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMongs_mean,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMongs_mean;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum


% ------------------------------MICRO MICRO - mediana - mediana
Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_acum_median;
%Matriz_MicroMOGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMogs_acum_median,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMogs_acum_median;

Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_acum_median;
%Matriz_MicroMONGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMongs_acum_median,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMongs_acum_median;

Matriz_MicroMOGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_median;
Matriz_MicroMOGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMogs_median;
%Matriz_MicroMOGS(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMogs_median,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMogs_median;

Matriz_MicroMONGS=NaN(3,size(Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS(1,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_median;
Matriz_MicroMONGS(2,:)=Group_Results_w_ITI_1s.Group_Results.mediana_MicroMongs_median;
%Matriz_MicroMONGS(3,1:size(Group_Results_w_ITI.Group_Results.mediana_MicroMongs_median,2))=Group_Results_w_ITI.Group_Results.mediana_MicroMongs_median;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum

%% MICRO GAINS 

% Matriz_MOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_mean,2));
% Matriz_MOGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_mean;
% Matriz_MOGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mogs_group_acumulado_mean;
% %Matriz_MOGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.mogs_group_acumulado_mean,2))=Group_Results_w_ITI.Group_Results.mogs_group_acumulado_mean;
% 
% Matriz_MONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_mean,2));
% Matriz_MONGS_acum(1,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_mean;
% Matriz_MONGS_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.mongs_group_acumulado_mean;
% %Matriz_MONGS_acum(3,1:size(Group_Results_w_ITI.Group_Results.mongs_group_acumulado_mean,2))=Group_Results_w_ITI.Group_Results.mongs_group_acumulado_mean;
% 
% Matriz_TL_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.TL_group_acumulado_mean,2));
% Matriz_TL_acum(1,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_mean;
% Matriz_TL_acum(2,:)=Group_Results_w_ITI_1s.Group_Results.TL_group_acumulado_mean;
% %Matriz_TL_acum(3,1:size(Group_Results_w_ITI.Group_Results.TL_group_acumulado_mean,2))=Group_Results_w_ITI.Group_Results.TL_group_acumulado_mean;

Matriz_MOGS_acum=NaN(3,size(Results_wo_ITI.MOGS_acum_mean,2));
Matriz_MOGS_acum(1,:)=Results_wo_ITI.MOGS_acum_mean;
Matriz_MOGS_acum(2,:)=Results_ITI.MOGS_acum_mean;

Matriz_MONGS_acum=NaN(3,size(Results_wo_ITI.MONGS_acum_mean,2));
Matriz_MONGS_acum(1,:)=Results_wo_ITI.MONGS_acum_mean;
Matriz_MONGS_acum(2,:)=Results_ITI.MONGS_acum_mean;

Matriz_TL_acum=NaN(3,size(Results_wo_ITI.TL_acum_mean,2));
Matriz_TL_acum(1,:)=Results_wo_ITI.TL_acum_mean;
Matriz_TL_acum(2,:)=Results_ITI.TL_acum_mean;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media')
% Struct.flag_norm=0;
% MicroGains_Plot_Grupal(Results_wo_ITI.MOGS_acum_mean,Results_wo_ITI.MOGS_acum_std,...
    %Results_wo_ITI.MONGS_acum_mean,Results_wo_ITI.MONGS_acum_std,Results_wo_ITI.TL_acum_mean,Results_wo_ITI.TL_acum_std,Results_wo_ITI.MOGS_acum,Results_wo_ITI.MONGS_acum,Results_wo_ITI.TL_acum,'WO iti',Struct)

%% FLOR Y GUILLE ----------------------------------------------------------------------------

%% MICRO MICRO - media - media
%Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum=NaN(3,36);
Matriz_MicroMOGS_acum(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_mean;

%Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum=NaN(3,36);
Matriz_MicroMONGS_acum(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_mean;

%Matriz_MicroMOGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS=NaN(3,36);
Matriz_MicroMOGS(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMogs_mean;
Matriz_MicroMOGS(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMogs_mean;
Matriz_MicroMOGS(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_mean;

%Matriz_MicroMONGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS=NaN(3,36);
Matriz_MicroMONGS(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMongs_mean;
Matriz_MicroMONGS(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMongs_mean;
Matriz_MicroMONGS(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_mean;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum

%% MICRO MICRO - media - mediana
%Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum=NaN(3,36);
Matriz_MicroMOGS_acum(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_acum_median;

%Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum=NaN(3,36);
Matriz_MicroMONGS_acum(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_acum_median;

%Matriz_MicroMOGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS=NaN(3,36);
Matriz_MicroMOGS(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMogs_median;
Matriz_MicroMOGS(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMogs_median;
Matriz_MicroMOGS(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMogs_median;

%Matriz_MicroMONGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS=NaN(3,36);
Matriz_MicroMONGS(1,1:15)=Group_Results_Flor.Group_Results.media_MicroMongs_median;
Matriz_MicroMONGS(2,1:15)=Group_Results_Guille_2021.Group_Results.media_MicroMongs_median;
Matriz_MicroMONGS(3,:)=Group_Results_wo_ITI.Group_Results.media_MicroMongs_median;



MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Media')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum

%% MICRO MICRO - mediana - media
%Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum=NaN(3,36);
Matriz_MicroMOGS_acum(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMogs_acum_mean;
Matriz_MicroMOGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_mean;

%Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum=NaN(3,36);
Matriz_MicroMONGS_acum(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMongs_acum_mean;
Matriz_MicroMONGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_mean;

%Matriz_MicroMOGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS=NaN(3,36);
Matriz_MicroMOGS(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMogs_mean;
Matriz_MicroMOGS(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMogs_mean;
Matriz_MicroMOGS(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_mean;

%Matriz_MicroMONGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS=NaN(3,36);
Matriz_MicroMONGS(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMongs_mean;
Matriz_MicroMONGS(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMongs_mean;
Matriz_MicroMONGS(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_mean;

MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum


%% MICRO MICRO - mediana - mediana
%Matriz_MicroMOGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS_acum=NaN(3,36);
Matriz_MicroMOGS_acum(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMogs_acum_median;
Matriz_MicroMOGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_acum_median;

%Matriz_MicroMONGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS_acum=NaN(3,36);
Matriz_MicroMONGS_acum(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMongs_acum_median;
Matriz_MicroMONGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_acum_median;

%Matriz_MicroMOGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMOGS=NaN(3,36);
Matriz_MicroMOGS(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMogs_median;
Matriz_MicroMOGS(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMogs_median;
Matriz_MicroMOGS(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMogs_median;

%Matriz_MicroMONGS=NaN(3,size(Group_Results_Flor.Group_Results.media_MicroMogs_acum_mean,2));
Matriz_MicroMONGS=NaN(3,36);
Matriz_MicroMONGS(1,1:15)=Group_Results_Flor.Group_Results.mediana_MicroMongs_median;
Matriz_MicroMONGS(2,1:15)=Group_Results_Guille_2021.Group_Results.mediana_MicroMongs_median;
Matriz_MicroMONGS(3,:)=Group_Results_wo_ITI.Group_Results.mediana_MicroMongs_median;


MicroMicroCompare(Matriz_MicroMOGS, Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum,'Mediana')
clear Matriz_MicroMOGS; clear Matriz_MicroMONGS; clear Matriz_MicroMOGS_acum; clear Matriz_MicroMONGS_acum

%% MICRO GAINS 

%Matriz_MOGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.mogs_group_acumulado_mean,2));
Matriz_MOGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_mean,2));
Matriz_MOGS_acum(1,1:14)=Group_Results_Flor.Group_Results.mogs_group_acumulado_mean;
Matriz_MOGS_acum(2,1:14)=Group_Results_Guille_2021.Group_Results.mogs_group_acumulado_mean;
Matriz_MOGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.mogs_group_acumulado_mean;


%Matriz_MONGS_acum=NaN(3,size(Group_Results_Flor.Group_Results.mongs_group_acumulado_mean,2));
Matriz_MONGS_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_mean,2));
Matriz_MONGS_acum(1,1:15)=Group_Results_Flor.Group_Results.mongs_group_acumulado_mean;
Matriz_MONGS_acum(2,1:15)=Group_Results_Guille_2021.Group_Results.mongs_group_acumulado_mean;
Matriz_MONGS_acum(3,:)=Group_Results_wo_ITI.Group_Results.mongs_group_acumulado_mean;

%Matriz_TL_acum=NaN(3,size(Group_Results_Flor.Group_Results.TL_group_acumulado_mean,2));
Matriz_TL_acum=NaN(3,size(Group_Results_wo_ITI.Group_Results.TL_group_acumulado_mean,2));
Matriz_TL_acum(1,1:14)=Group_Results_Flor.Group_Results.TL_group_acumulado_mean;
Matriz_TL_acum(2,1:14)=Group_Results_Guille_2021.Group_Results.TL_group_acumulado_mean;
Matriz_TL_acum(3,:)=Group_Results_wo_ITI.Group_Results.TL_group_acumulado_mean;

MicroGainsCompare(Matriz_MOGS_acum,Matriz_MONGS_acum, Matriz_TL_acum,'media')