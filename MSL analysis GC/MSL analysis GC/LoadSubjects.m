%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         GC 14/4/2023                                %%%
%%% Este código reemplaza el de Load path porque quedó desprolijo       %%%
%%% Se cargan los path de cada sujeto para poder darles un análisis de  %%% 
%%% forma grupal. Los sujetos deben estar analizados de forma individual%%%
%%% Aca solo se ve la data de flor y guille.                            %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% addpath('C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor');
% addpath('C:\Users\physi\Documents\Guada_2022\Behavior MSL\Funciones Analisis')
%% Sujetos Flor
clear
clc

% Traigo los nombres de los sujetos
S_Flor(1).S= 'Subject_1_RA\AR_09_01_154_Task - Day_One_1';
S_Flor(2).S='Subject_2_BD\BD_16_01_17_Task - Day_One_1';
S_Flor(3).S='Subject_3_JGS\JGS_23_01_17_Task - Day_One_1';
S_Flor(4).S='Subject_4_FM\FM_24_01_17_Task - Day_One_1';
S_Flor(5).S='Subject_6_VT\VT_10_01_17_Task - Day_One_1';
S_Flor(6).S='Subject_7_GG\GG_25_01_17_Task - Day_One_1';
S_Flor(7).S='Subject_8_EM\EM_18_01_17_Task - Day_One_1';
S_Flor(8).S='Subject_9_FA\FA_12_01_17_Task - Day_One_1';
S_Flor(9).S='Subject_10_VG\VG_26_01_17_Task - Day_One_1';
S_Flor(10).S='Subject_11_CR\CR_30_01_17_Task - Day_One_1';
S_Flor(11).S='Subject_13_JSB\JSB_13_02_17_Task - Day_One_1';
S_Flor(12).S='Subject_14_CN\CN_14_02_17_Task - Day_One_1';
S_Flor(13).S='Subject_15_RN\RN_07_02_17_Task - Day_One_1';
S_Flor(14).S='Subject_17_CRom\CRom_08_02_17_Task - Day_One_1';
S_Flor(13).S='Subject_18_ILC\ILC_08_02_17_Task - Day_One_1';
S_Flor(14).S='Subject_19_NB\NB_02_02_17_Task - Day_One_1';
S_Flor(15).S='Subject_20_YD\YD_16_02_17_Task - Day_One_1';
S_Flor(16).S='Subject_21_AC\AC_17_04_17_Task - Day_One_1';
S_Flor(17).S='Subject_24_SC\SC_18_04_17_Task - Day_One_1';

%path_Flor='C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor_CodFJViejo\MSL raw output data\';
%path_Flor='C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor_CodFJNuevo\MSL raw output data\';
path_Flor='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\FJ - MSL raw output data\';
%path_Flor='C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\output\Behaviour - Filt\FJ - MSL raw output data\';

%Cargo los seq_results de los sujetos
for i=1:length(S_Flor)
   %Results(i).S=load([path_Flor S_Flor(i).S '_results_flor.mat']);
   Results(i).S=load([path_Flor S_Flor(i).S '_results.mat']);
end
%Analisis Grupal
%Id_RunAnalysisGroup_FJ(Results,[path_Flor 'Grupo\']) %CODIGO FLOR
Resultados_Flor=ID_RunAnalysisGroup2(Results,[path_Flor 'Grupo_4\'],'teclas','without ITI');

%% Sujetos Guille
clear 
clc
%addpath('C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor');
clear Results;

% me traigo los sujetos de guille
% El código de  flor no tolera al sujeto MSL007 y MSL036
S_Guille(1).S='MSL003\Day_1\MSL003_KG_Task - Day_One_1';
S_Guille(2).S='MSL004\Day 1\MSL004_ZL_Task - Day_One_1';
S_Guille(3).S='MSL009\Day 1\MSL009_OS_Task - Day_One_1';
S_Guille(4).S='MSL010\Day 1\MSL010_CC_Task - Day_One_1';
S_Guille(5).S='MSL011\Day 1\MSL011_AL_Task - Day_One_1';
S_Guille(6).S='MSL012\Day 1\MSL012_KS_Task - Day_One_1';
S_Guille(7).S='MSL013\Day 1\MSL013_LV_Task - Day_One_1';
S_Guille(8).S='MSL014\Day 1\MSL014_GR_Task - Day_One_1';
S_Guille(9).S='MSL015\Day 1\MSL015_LR_Task - Day_One_1';
S_Guille(10).S='MSL016\Day 1\MSL016_WA_Task - Day_One_1';
S_Guille(11).S='MSL017\Day 1\MSL017_MD_Task - Day_One_1';
S_Guille(12).S='MSL018\Day 1\MSL018_RS_Task - Day_One_1';
S_Guille(13).S='MSL019\Day 1\MSL019_KE_Task - Day_One_1';
S_Guille(14).S='MSL021\Day 1\MSL021_TB_Task - Day_One_3';
S_Guille(15).S='MSL022\Day 1\MSL022_RE_Task - Day_One_1';
S_Guille(16).S='MSL025\Vladimir_MSL025\MSL025_Vladimir_Task - Day_One_1';
S_Guille(17).S='MSL026\James_MSL026\MSL026_James_Task - Day_One_1';
S_Guille(18).S='MSL027\Natalia_MSL027\MSL027_Natalia_Task - Day_One_1';
S_Guille(19).S='MSL028\Alice_MSL028\MSL028_Alice_Task - Day_One_1';
S_Guille(20).S='MSL029\Lily_MSL029\MSL029_Lily_Task - Day_One_1';
S_Guille(21).S='MSL030\Nikkita_MSL030\MSL030_Nikkita_Task - Day_One_1';
S_Guille(22).S='MSL031\Emil_MSL031\Emil_MSL031_Task - Day_One_1';
S_Guille(23).S='MSL032\Katherine_MSL032\MSL032_Katherine_Task - Day_One_1';
S_Guille(24).S='MSL033\Tessa_MSL033\MSL033_Tassa_Task - Day_One_1';
S_Guille(25).S='MSL034\Alison_MSL034\MSL034_Alison_Task - Day_One_1';
S_Guille(26).S='MSL035\Britton_MSL035\MSL035_Britton_Task - Day_One_1';
%S_Guille(27).S='MSL036\Jillian_MSL036\MSL036_Jillian_Task - Day_One_1';

%USAR ESTE INDICE PARA ANALIZAR SOLO A LOS SUJETOS 2022
% S_Guille(1).S='MSL025\Vladimir_MSL025\MSL025_Vladimir_Task - Day_One_1';
% S_Guille(2).S='MSL026\James_MSL026\MSL026_James_Task - Day_One_1';
% S_Guille(3).S='MSL027\Natalia_MSL027\MSL027_Natalia_Task - Day_One_1';
% S_Guille(4).S='MSL028\Alice_MSL028\MSL028_Alice_Task - Day_One_1';
% S_Guille(5).S='MSL029\Lily_MSL029\MSL029_Lily_Task - Day_One_1';
% S_Guille(6).S='MSL030\Nikkita_MSL030\MSL030_Nikkita_Task - Day_One_1';
% S_Guille(7).S='MSL031\Emil_MSL031\Emil_MSL031_Task - Day_One_1';
% S_Guille(8).S='MSL032\Katherine_MSL032\MSL032_Katherine_Task - Day_One_1';
% S_Guille(9).S='MSL033\Tessa_MSL033\MSL033_Tassa_Task - Day_One_1';
% S_Guille(10).S='MSL034\Alison_MSL034\MSL034_Alison_Task - Day_One_1';
% S_Guille(11).S='MSL035\Britton_MSL035\MSL035_Britton_Task - Day_One_1';

%path_Guille='C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Guille_CodFJViejo\';
%path_Guille='C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Guille_CodFJNuevo\';
path_Guille='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Behaviour_MSL_Guille\';
%path_Guille='C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\output\Behaviour - Filt\Behavior_MSL_Guille\';


%Cargo los seq_results de los sujetos
for i=1:length(S_Guille)
   %Results(i).S=load([path_Guille S_Guille(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Guille S_Guille(i).S '_results.mat']); 
   %_results_guada indica el Analisis_Seq_Individual
end
%Analisis Grupal con código de flor
%Id_RunAnalysisGroup_FJ(Results,[path_Guille 'Grupo\'])
Resultados_Guille=ID_RunAnalysisGroup2(Results,[path_Guille 'Grupo\'],'teclas','without ITI');



%% PILOTO GUILLE MSL sin ITI 40 teclas x 22 bloques 
clear Results

S_Piloto_Guille(1).S='S001\Agus-Task - Day_One_1';
S_Piloto_Guille(2).S='S002\Alva-Task - Day_One_1';
S_Piloto_Guille(3).S='S003\Azul_Task - Day_One_1';
S_Piloto_Guille(4).S='S004\Bram-Task - Day_One_1';
S_Piloto_Guille(5).S='S005\Ceci_Task - Day_One_1';
S_Piloto_Guille(6).S='S006\Daniela_Task - Day_One_1';
S_Piloto_Guille(7).S='S007\German_Task - Day_One_1';
S_Piloto_Guille(8).S='S008\Jesu_Task - Day_One_1';
S_Piloto_Guille(9).S='S009\Lujan_Task - Day_One_1';
S_Piloto_Guille(10).S='S010\Nacho-Task - Day_One_1';
S_Piloto_Guille(11).S='S011\Nati_Task - Day_One_1';
S_Piloto_Guille(12).S='S012\Vale_Task - Day_One_1';

path_Piloto_Guille='C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Pilot_MSL_Results_With_MOGs\Pilot_MSL_Results\';

%Cargo los seq_results de los sujetos
for i=1:length(S_Piloto_Guille)
   %Results(i).S=load([path_Guada S_Piloto_Guille(i).S '_results_flor.mat']); 
   %_results_flor indica que se usa el id_runAnalysis_FJ
   Results(i).S=load([path_Piloto_Guille S_Piloto_Guille(i).S '_results.mat']);
   %_results_guada indica el Analisis_Seq_Individual
end

%Analisis Grupal codigo Guada
Resultados_PilotoGuille=ID_RunAnalysisGroup2(Results,[path_Piloto_Guille 'Grupo\'],'teclas','without ITI');





%% Esta comparacion me indica que pude reproducir exactamente lo de flor
TablaG=readtable('C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor\DataFlor_CodigoGuada.csv');
TablaF=readtable('C:\Users\physi\Documents\Guada_2022\Behavior MSL\Behavior_MSL_Flor\DataFlor_CodigoFlor_intertaps_correct.csv');

Comp=setdiff(TablaG, TablaF);
%%
for i=1:length(S_filt)
    S_filt(i).S.corr_sujeto=Compare_Same_Group(S_filt(i).S,S_filt_norm(i).S,'individual');
end
%%
Correlacion_grupal=Compare_Same_Group(Results_filt,Results_filt_norm,'grupal');

%%
Group_Results_Flor = load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\FJ - MSL raw output data\Grupo\Group_Results.mat');
Group_Results_Guille_2021= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Behaviour_MSL_Guille\Grupo2021\Group_Results.mat');
Group_Results_Guille_2022= load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Behaviour_MSL_Guille\Grupo2022\Group_Results.mat');
Group_Results_Guille_40 = load('C:\Users\physi\Documents\Guada_2022\Behavior MSL\AnalisisGuada\Behaviour - Norm 01\Pilot_MSL_Results_With_MOGs\Pilot_MSL_Results\Grupo2\Group_Results.mat');

LearningCompare(Group_Results_Flor.Group_Results,Group_Results_Guille_2021.Group_Results,Group_Results_Guille_2022.Group_Results,Group_Results_Guille_40.Group_Results)

