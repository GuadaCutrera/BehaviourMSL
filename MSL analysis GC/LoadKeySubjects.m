%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         GC 31/8/2023                                %%%
%%% Se cargan los path de cada sujeto para poder darles un análisis de  %%% 
%%% forma grupal. Los sujetos deben estar analizados de forma individual%%%
%%% Es unicamente para los suejtos cuyo bloque termina por cant de teclas %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Sujetos Guada with iti 1.5s - protocolo teclas -BOTONERA
clear 
clc
%addpath('C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor');

% me traigo los sujetos de guada
S_Guada(1).S='S002\Antonela_S2_Task - con_ITI_1';
S_Guada(2).S='S003\Agustina_S3_Task - con_ITI_1';
S_Guada(3).S='S004\Florencia_S4_Task - con_ITI_1';
S_Guada(4).S='S005 - corregido\Delfina_S5_Task - con_ITI_1';
%S_Guada(5).S='S006\Yasmin_S6_Task - con_ITI_1_';
S_Guada(5).S='S007\DanielaSabaj_S7_Task - con_ITI_1';
S_Guada(6).S='S008\Veronica_S8_Task - con_ITI_1';
S_Guada(7).S='S010\Gladys_S10_Task - con_ITI_1';
S_Guada(8).S='S011\Santiago_S11_Task - con_ITI_1';
S_Guada(9).S='S012\Pablo_S12_Task - con_ITI_1';
S_Guada(10).S='S013\Melany_S13_Task - con_ITI_1';
S_Guada(11).S='S014\Veronica_S7_Task - con_ITI_1';
S_Guada(12).S='S016 - corregido\Nicolas_S16_Task - con_ITI_1';
S_Guada(13).S='S017\Javier_S17_Task - con_ITI_1';
S_Guada(14).S='S018\Florencia_S17_Task - con_ITI_1';
S_Guada(15).S='S019\Lucia_S19_Task - con_ITI_1';
S_Guada(16).S='S020\Daniela_S20_Task - con_ITI_1';
S_Guada(17).S='S021 - corregido\Jhosmar_S21_Task - con_ITI_1';
%S_Guada(19).S='S022 - corregido\Julieta_S22_Task - con_ITI_1';
S_Guada(18).S='S024\Florencia_S24_Task - con_ITI_1';
S_Guada(19).S='S025\Julian_S25_Task - con_ITI_1';
S_Guada(20).S='S028\Lucia_S28_Task - con_ITI_1';
S_Guada(21).S='S029\Tomas_S29_Task - con_ITI_1';
S_Guada(22).S='S031\Naila_S31_Task - con_ITI_1';
S_Guada(23).S='S032\Melisa_S32_Task - con_ITI_1';
S_Guada(24).S='S035\Kimberly_S35_Task - con_ITI_1';
S_Guada(25).S='S036\Nahuel_S34_Task - con_ITI_1';
S_Guada(26).S='S037\Sofia_S37_Task - con_ITI_1';
S_Guada(27).S='S038 - corregido\Maria_S38_Task - con_ITI_1';
S_Guada(28).S='S039 - corregido\Gessica_S39_Task - con_ITI_1';
S_Guada(29).S='S040 - corregido\Milagros_S40_Task - con_ITI_1';
%S_Guada(30).S='S041\Guillermo_S41_Task - con_ITI_1';
%S_Guada(30).S='S042 - corregido\Juan_S42_Task - con_ITI_1';
S_Guada(30).S='S043\Su_S43_Task - con_ITI_1';
S_Guada(31).S='S044\Belen_S44_Task - con_ITI_1';
S_Guada(32).S='S045 - corregido\Eduardo_S44_Task - con_ITI_1';

% path_Guada='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisFlor\\Piloto MSL key 1,5s\GC - MSL raw output data_CodFJViejo\';
% path_Guada='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisFlor\Piloto MSL key 1,5s\GC - MSL raw output data_CodFJNuevo\';
% path_Guada='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Filt y Norm 01\Piloto MSL key 1,5s\';
%path_Guada='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Filt\Piloto MSL key 1,5s\';
path_Guada='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key 1,5s\';


%Cargo los seq_results de los sujetos
for i=1:length(S_Guada)
   %Results(i).S=load([path_Guada S_Guada(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Guada S_Guada(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end
%Analisis Grupal con código de flor
%Id_RunAnalysisGroup_FJ(Results,[path_Guada 'Grupo\'])
%Analisis Grupal codigo Guada
Resultados_Guada=ID_RunAnalysisGroup2(Results,[path_Guada 'Grupo\'],'teclas','with ITI');


%% Piloto Guada Without ITI - protocolo teclas - BOTONERA
clear Results;
S_Piloto_key_wo_ITI(1).S='S001\Josefina_S1_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(2).S='S002\Alexandra_S2_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(3).S='S003\Ezequiel_S3_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(4).S='S004\Estefi_S43_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(5).S='S005\Juan_S5_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(6).S='S006\Jessica_S6_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(7).S='S007\Lujan_S7_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(8).S='S008\Adam_S8_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(9).S='S009\Agus_S9_Task - Day_One_1';
S_Piloto_key_wo_ITI(10).S='S010\Ramiro_S0_Task - sin_ITI_1';
%S_Piloto_key_wo_ITI(11).S='S011\Alejandro_S11_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(11).S='S012\Florencia_S12_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(12).S='S013\Rocio_S12_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(13).S='S014\Laura_S14_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(14).S='S015\Lourdes_S15_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(15).S='S016\Lucas_S16_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(16).S='S017\Matias_S17_Task - sin_ITI_1';
S_Piloto_key_wo_ITI(17).S='S018\Micaela_S18_Task - sin_ITI_1';

path_Piloto_key_wo_ITI='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key sin ITI\';

%Cargo los seq_results de los sujetos
for i=1:length(S_Piloto_key_wo_ITI)
   %Results(i).S=load([path_Guada S_Piloto_Guille(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Piloto_key_wo_ITI S_Piloto_key_wo_ITI(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end


%Analisis Grupal codigo Guada
Resultados_Piloto_key_wo_ITI=ID_RunAnalysisGroup2(Results,[path_Piloto_key_wo_ITI 'Grupo\'],'teclas','without ITI');

%% Piloto Guada ITI 1s - protocolo teclas -- BOTONERA
clear Results;

S_Piloto_key_ITI_1s(1).S='S001\Santiago_S1_Task - con_ITI_1';
S_Piloto_key_ITI_1s(2).S='S002\Camila_S2_Task - con_ITI_1';
S_Piloto_key_ITI_1s(3).S='S003 - mogs positivos\Camila_S3_Task - con_ITI_1';
S_Piloto_key_ITI_1s(4).S='S005\Andrea_S5_Task - con_ITI_1';
S_Piloto_key_ITI_1s(5).S='S006\Luciana_S6_Task - con_ITI_1';
S_Piloto_key_ITI_1s(6).S='S007 - mogs positivos\Julieta_S7_Task - con_ITI_1';
S_Piloto_key_ITI_1s(7).S='S008\Luis_SA_Task - con_ITI_1';
S_Piloto_key_ITI_1s(8).S='S009\Nicolas_SB_Task - con_ITI_1';
S_Piloto_key_ITI_1s(9).S='S010\Erica_SC_Task - con_ITI_1';
S_Piloto_key_ITI_1s(10).S='S011\Anghie_SD_Task - con_ITI_1';
S_Piloto_key_ITI_1s(11).S='S012\Antonela_SE_Task - con_ITI_1';
S_Piloto_key_ITI_1s(12).S='S013\Lucrecia_SF_Task - con_ITI_1';
S_Piloto_key_ITI_1s(13).S='S014\Milagros_SG_Task - con_ITI_1';
S_Piloto_key_ITI_1s(14).S='S015\Mariano_SH_Task - con_ITI_1';

path_Piloto_key_ITI_1s='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key 1s\';

%Cargo los seq_results de los sujetos
for i=1:length(S_Piloto_key_ITI_1s)
   %Results(i).S=load([path_Piloto_tiempo_ITI_1s S_Piloto_tiempo_ITI_1s(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Piloto_key_ITI_1s S_Piloto_key_ITI_1s(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end


%Analisis Grupal codigo Guada
Resultados_Piloto_key_ITI_1s=ID_RunAnalysisGroup2(Results,[path_Piloto_key_ITI_1s 'Grupo\'],'teclas','with ITI');

%%
% Group_Results_w_ITI_1s= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key 1s\Grupo\Group_Results.mat');
% Group_Results_wo_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key sin ITI\Grupo\Group_Results.mat');
% Group_Results_w_ITI= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Piloto MSL key 1,5s\Grupo\Group_Results.mat');


%LearningCompare(Group_Results_wo_ITI.Group_Results,Group_Results_w_ITI_1s.Group_Results,Group_Results_w_ITI.Group_Results)
LearningCompare(Resultados_Piloto_key_wo_ITI,Resultados_Piloto_key_ITI_1s,Resultados_Guada)
