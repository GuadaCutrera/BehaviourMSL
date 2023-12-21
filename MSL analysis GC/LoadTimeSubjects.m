%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         GC 31/8/2023                                %%%
%%% Se cargan los path de cada sujeto para poder darles un análisis de  %%% 
%%% forma grupal. Los sujetos deben estar analizados de forma individual%%%
%%% Es unicamente para los sujetos cuyo bloque termina por tiempo       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Piloto Guada With ITI - protocolo tiempo - CON BOTONERA

S_Piloto_time_botonera(1).S='S001_CarolinaGaburro\CarolinaGaburro_S1_Task - con_ITI_1';
S_Piloto_time_botonera(2).S='S002_EvaPerelman\EvaPerelman_S2_Task - con_ITI_1';
S_Piloto_time_botonera(3).S='S003_LisandroDiaz\LisandroDiaz_S3_Task - con_ITI_1';
S_Piloto_time_botonera(4).S='S005_BelenAllegue\BelenAllegue_S5_Task - con_ITI_1';
S_Piloto_time_botonera(5).S='S006_FacundoMogica\FacundoMogica_S6_Task - con_ITI_1';
S_Piloto_time_botonera(6).S='S007_CarlaTaddei\CarlaTaddei_S7_Task - con_ITI_1';
S_Piloto_time_botonera(7).S='S008_JulietaRuggieri\JulietaRuggieri_S8_Task - con_ITI_1';
S_Piloto_time_botonera(8).S='S009_PaulaGomez\PaulaGomez_S9_Task - con_ITI_1';
S_Piloto_time_botonera(9).S='S010_CandelaUrdampilleta\CandelaUrdampilleta_S10_Task - con_ITI_1';
S_Piloto_time_botonera(10).S='S011_JuanFerreyra\JuanFerreyra_S11_Task - con_ITI_1';
S_Piloto_time_botonera(11).S='S012_JulianDiomedi\JulianDiomedi_D12_Task - con_ITI_1';
S_Piloto_time_botonera(12).S='S013_BelanaOliver\BelanaOliver_S13_Task - con_ITI_1';
S_Piloto_time_botonera(13).S='S015_LaraPastuszuk\LaraPastuszuk_S15_Task - con_ITI_1';
S_Piloto_time_botonera(14).S='S016_JuanCavagna\JuanCavagna_S16_Task - con_ITI_1';


%path_Piloto_time_botonera='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Behavior_MSL_Guada_time\Op1\';
path_Piloto_time_botonera='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1,5s\Op2\GrupoTransprevia\';


%Cargo los seq_results de los sujetos
for i=1:length(S_Piloto_time_botonera)
   %Results(i).S=load([path_Guada S_Piloto_Guille(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Piloto_time_botonera S_Piloto_time_botonera(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end


%Analisis Grupal codigo Guada
Resultados_Piloto_time_botonera=ID_RunAnalysisGroup2(Results,[path_Piloto_time_botonera 'Grupo_mediana\'],'tiempo','With ITI');


%% Piloto Guada Without ITI - protocolo tiempo - teclado compu
clear;

S_Piloto_tiempo_wo_ITI(1).S='S002\David_S2_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(2).S='S003\claudia_S3_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(3).S='S005 - sin punto\Camila_S5_Task - sin_ITI_1'; %aumenta bloque 3
%S_Piloto_tiempo_wo_ITI(3).S='S005\Camila_S5_Task - sin_ITI_1'; %original
S_Piloto_tiempo_wo_ITI(4).S='S006\Lucia_S6_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(5).S='S007\Ezequiel_S7_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(6).S='S008\Agatha_S8_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(7).S='S009\Patricio_S9_Task - sin_ITI_1'; 
S_Piloto_tiempo_wo_ITI(8).S='S010\Belen_S10_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(9).S='S011\Cristel_S11_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(10).S='S012\Sabrina_S12_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(11).S='S013\Joaquin_S13_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(12).S='S014\Matias_S14_Task - sin_ITI_1'; %el más rápido.
S_Piloto_tiempo_wo_ITI(13).S='S015\Florencia_S15_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(14).S='S016\Catalina_S16_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(15).S='S017\cristina_s17_Task - sin_ITI_1';
S_Piloto_tiempo_wo_ITI(16).S='S018\Beatriz_S18_Task - sin_ITI_1';

%path_Piloto_tiempo_wo_ITI='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\';
%path_Piloto_tiempo_wo_ITI='C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\output\Piloto MSL time sin ITI\';
path_Piloto_tiempo_wo_ITI='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Mediana\Piloto MSL time sin ITI - simKeyPress\';

%Cargo los seq_results de los sujetos
for i=1:length(S_Piloto_tiempo_wo_ITI)
   %Results(i).S=load([path_Guada S_Piloto_Guille(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Piloto_tiempo_wo_ITI S_Piloto_tiempo_wo_ITI(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end


%Analisis Grupal codigo Guada
Resultados_Piloto_tiempo_wo_ITI=ID_RunAnalysisGroup2(Results,[path_Piloto_tiempo_wo_ITI 'Grupo\'],'tiempo','without ITI');


%% Piloto Guada ITI 1s - protocolo tiempo -- teclado
clear;

S_Piloto_tiempo_ITI_1s(1).S='S002\Diego_S2_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(2).S='S004\Sofia_S4_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(3).S='S005\Gabriela_S5_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(4).S='S006\andrea_S6_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(5).S='S007\agustina_S7_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(6).S='S009\alejandra_S9_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(7).S='S011\ana_S11_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(8).S='S012\violeta_S12_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(9).S='S013\franco bagleone _S13_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(10).S='S014\Gonzalo_S14_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(11).S='S015\Ana_S15_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(12).S='S016\Martina_S16_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(13).S='S018 - sin punto\Stefania_S17_Task - con_ITI_1';
%S_Piloto_tiempo_ITI_1s(13).S='S018\Stefania_S17_Task - con_ITI_1'; %original
S_Piloto_tiempo_ITI_1s(14).S='S019\Sofia_S19_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(15).S='S020\Emiliano_S20_Task - con_ITI_1';
S_Piloto_tiempo_ITI_1s(16).S='S021\Aldana_s21_Task - con_ITI_1';


%path_Piloto_tiempo_ITI_1s='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransPrevia\';
path_Piloto_tiempo_ITI_1s='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm a cero\Media\Piloto MSL time 1s - simKeyPress\';

%Cargo los seq_results de los sujetos
for i=1:length(S_Piloto_tiempo_ITI_1s)
   %Results(i).S=load([path_Piloto_tiempo_ITI_1s S_Piloto_tiempo_ITI_1s(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Piloto_tiempo_ITI_1s S_Piloto_tiempo_ITI_1s(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end

% 
%Analisis Grupal codigo Guada
Resultados_Piloto_tiempo_ITI_1s=ID_RunAnalysisGroup2(Results,[path_Piloto_tiempo_ITI_1s 'Grupo\'],'tiempo','with ITI');

%%  LOAD INTRO CON ITI - TECLADO

%clear;

S_INTRO_ITI_1s(1).S='S002\Diego_S2_Intro - con_ITI_1';
S_INTRO_ITI_1s(2).S='S004\Sofia_S4_Intro - con_ITI_1';
S_INTRO_ITI_1s(3).S='S005\Gabriela_S5_Intro - con_ITI_1';
S_INTRO_ITI_1s(4).S='S006\andrea_S6_Intro - con_ITI_1';
S_INTRO_ITI_1s(5).S='S007\agustina_S7_Intro - con_ITI_1';
S_INTRO_ITI_1s(6).S='S009\alejandra_S9_Intro - con_ITI_1';
S_INTRO_ITI_1s(7).S='S011\ana_S11_Intro - con_ITI_1';
S_INTRO_ITI_1s(8).S='S012\violeta_S12_Intro - con_ITI_1';
S_INTRO_ITI_1s(9).S='S013\franco bagleone _S13_Intro - con_ITI_1';
S_INTRO_ITI_1s(10).S='S014\Gonzalo_S14_Intro - con_ITI_1';
S_INTRO_ITI_1s(11).S='S015\Ana_S15_Intro - con_ITI_1';
S_INTRO_ITI_1s(12).S='S016\Martina_S16_Intro - con_ITI_1';
S_INTRO_ITI_1s(13).S='S018 - sin punto\Stefania_S17_Intro - con_ITI_1';
%S_INTRO_ITI_1s(13).S='S018\Stefania_S17_Intro - con_ITI_1'; %original
S_INTRO_ITI_1s(14).S='S019\Sofia_S19_Intro - con_ITI_2'; %Tiene un Micro MOGS y MONGS enorme en la intro
%S_INTRO_ITI_1s(14).S='S019\Sofia_S19_Intro - con_ITI_1'; %original
S_INTRO_ITI_1s(15).S='S020\Emiliano_S20_Intro - con_ITI_1';
S_INTRO_ITI_1s(16).S='S021\Aldana_s21_Intro - con_ITI_1';

SUJETOS=S_INTRO_ITI_1s;
%Path='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransPrevia\';
Path='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransPrevia\';

[Intro_Group, Intro_Task]=Intro_Analisis_Grupal(Path,SUJETOS,Results,'With ITI');

%% LOAD INTRO SIN ITI TECLADO

S_INTRO_wo_ITI(1).S='S002\David_S2_Intro - sin_ITI_1';
S_INTRO_wo_ITI(2).S='S003\claudia_S3_Intro - sin_ITI_2';  % CLAUDIA ES LA PROBLEMATICA EN LA INTRO
S_INTRO_wo_ITI(3).S='S005 - sin punto\Camila_S5_Intro - sin_ITI_1'; %aumenta bloque 3
%S_INTRO_wo_ITI(3).S='S005\Camila_S5_Intro - sin_ITI_1'; %original
S_INTRO_wo_ITI(4).S='S006\Lucia_S6_Intro - sin_ITI_1';
S_INTRO_wo_ITI(5).S='S007\Ezequiel_S7_Intro - sin_ITI_1';
S_INTRO_wo_ITI(6).S='S008\Agatha_S8_Intro - sin_ITI_1';
S_INTRO_wo_ITI(7).S='S009\Patricio_S9_Intro - sin_ITI_1'; 
S_INTRO_wo_ITI(8).S='S010\Belen_S10_Intro - sin_ITI_1';
S_INTRO_wo_ITI(9).S='S011\Cristel_S11_Intro - sin_ITI_1';
S_INTRO_wo_ITI(10).S='S012\Sabrina_S12_Intro - sin_ITI_1';
S_INTRO_wo_ITI(11).S='S013\Joaquin_S13_Intro - sin_ITI_1';
S_INTRO_wo_ITI(12).S='S014\Matias_S14_Intro - sin_ITI_1'; %el más rápido.
S_INTRO_wo_ITI(13).S='S015\Florencia_S15_Intro - sin_ITI_1';
S_INTRO_wo_ITI(14).S='S016\Catalina_S16_Intro - sin_ITI_1';
S_INTRO_wo_ITI(15).S='S017\cristina_s17_Intro - sin_ITI_1';
S_INTRO_wo_ITI(16).S='S018\Beatriz_S18_Intro - sin_ITI_1';

SUJETOS=S_INTRO_wo_ITI;
%Path='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\';
Path='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\';
[Intro_Group, Intro_Task]=Intro_Analisis_Grupal(Path,SUJETOS,Results,'Without ITI');



%%
% COMPARO ENTRE EL MISMO GRUPO
completo=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo\Group_Results.mat');

sin_1=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin1\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_1.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin1\' 'CompareVsCompleto.' 'fig']);

sin_3=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin3\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_3.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin3\' 'CompareVsCompleto.' 'fig']);

sin_6=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin6\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_6.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin6\' 'CompareVsCompleto.' 'fig']);

sin_7=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin7\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_7.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin7\' 'CompareVsCompleto.' 'fig']);

sin_8=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin8\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_8.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin8\' 'CompareVsCompleto.' 'fig']);

sin_9=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin9\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_9.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin9\' 'CompareVsCompleto.' 'fig']);

sin_11=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin11\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_11.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin11\' 'CompareVsCompleto.' 'fig']);

sin_16=load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin16\Group_Results.mat');
LearningCompare(completo.Group_Results,sin_16.Group_Results)
saveas(gcf,['C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo_sin16\' 'CompareVsCompleto.' 'fig']);


% GRUPOS(1,:)=completo.Group_Results.iki_visual_group_mean;
% GRUPOS(2,:)=sin_1.Group_Results.iki_visual_group_mean;
% GRUPOS(3,:)=sin_3.Group_Results.iki_visual_group_mean;
% GRUPOS(4,:)=sin_6.Group_Results.iki_visual_group_mean;
% GRUPOS(5,:)=sin_7.Group_Results.iki_visual_group_mean;
% GRUPOS(6,:)=sin_8.Group_Results.iki_visual_group_mean;
% GRUPOS(7,:)=sin_9.Group_Results.iki_visual_group_mean;
% GRUPOS(8,:)=sin_11.Group_Results.iki_visual_group_mean;
% GRUPOS(9,:)=sin_16.Group_Results.iki_visual_group_mean;
% 
% CompareAnalisis(GRUPOS);

%% GRUPO COMPLETO CON INTRO - Critero paraquitar puntos
clear

Path_ITI='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time 1s\GrupoTransPrevia\Grupo\Intro + Task\';
Path_wo_ITI='C:\Users\guada\Desktop\LFA FMED\Codigos Guada\Guada_2023\AnalisisGuada\Behaviour - Norm 01\Piloto MSL time sin ITI\GrupoTransPrevia\Grupo\Intro + Task\';

Group_Results_w_ITI_1s=load([Path_ITI 'Group_Results_Intro_Task.mat']);
Group_Results_wo_ITI=load([Path_wo_ITI 'Group_Results_Intro_Task.mat']);

%% calculo los MAD
mad_ITI=mad(Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task.iki_group,1);
mad_wo_ITI=mad(Group_Results_wo_ITI.Intro_Task_Group.Intro_Task.iki_group,1);

%
PlotInteractivo(ones(1,16),Group_Results_w_ITI_1s.Intro_Task_Group.Intro_Task,Group_Results_w_ITI_1s.Intro_Task_Group,9*mad_ITI,'');
saveas(gcf,[Path_ITI 'Interactivo_original_wITI_IKI_9_mad.' 'fig']);
PlotInteractivo(ones(1,16),Group_Results_wo_ITI.Intro_Task_Group.Intro_Task,Group_Results_wo_ITI.Intro_Task_Group,9*mad_wo_ITI,'');
saveas(gcf,[Path_wo_ITI 'Interactivo_original_woITI_IKI_9_mad.' 'fig']);
