%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This function allows a within subjects analysis. The dependent      %%%
%%% variables of each subject are concatenated in a matrix which is     %%%
%%% the used to calculate mean value and standar error.                 %%%
%%%                                                                     %%%    
%%% Some of the variables require a reshape because tehy are in a matrix%%%
%%% form and we need them in a vector form.                             %%%
%%%                                                                     %%%
%%% In this scipt is also considered the "time paradigm" in wich the    %%%
%%% subjects not always excute the same amount of sequences in each block%%
%%% In this case, the variables need completion with NaN values, so that%%%
%%% the blocks have the same number of columns and/or rows.             %%%
%%%                                                                     %%%
%%% Parameters:                                                         %%%
%%%   - SUJETOS: array of structs. Each struct has loaded the archive   %%%
%%%   results.mat that comes from Analisis_Seq_Individual or Id_runAnalysis
%%%   which can be _key_paradigm or _time_paradigm. The first option is %%%
%%%   the one i'm taking the data from. On the other two options, problems%
%%%   were detected in sections 4 and 5.                                %%%
%%%                                                                     %%%
%%%   - Path: where to store the figures and results                    %%%
%%%                                                                     %%%
%%%   - paradigm_flag: indicates if the analysis is on time or key paradigm
%%%                                                                     %%%
%%%   - titulo: indicates if the paradigm has or not an ITI             %%%
%%%                                                                     %%%
%%%                       GC 16/12/2022                                 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function Group_Results=ID_RunAnalysisGroup2(SUJETOS,path,paradigm_flag,titulo)
%% Inicialización de variables

% CorrectSeq_Dur
duration_group=[]; seq_group=[]; 
seq_group_num=[];key_group=[];

%Interkey Interval raw and filtered
iki_group=[]; iki_group_filt=[];

%Micro Gains Raw
mogs_group=[]; mogs_acumulado_group=[];
mongs_group=[]; mongs_acumulado_group=[];
TL_acumulado_group=[]; TL_group=[];

% Micro Gains Filtered
mogs_group_filt=[]; mogs_acumulado_group_filt=[];
mongs_group_filt=[]; mongs_acumulado_group_filt=[];
TL_acumulado_group_filt=[]; TL_group_filt=[];

% Micro Micro Gains Raw
micro_mogs_group=[]; micro_mogs_acumulado_group=[];
micro_mongs_group=[]; micro_mongs_acumulado_group=[];

% Micro Micro Gains Filtered
micro_mogs_group_filt=[]; micro_mogs_acumulado_group_filt=[];
micro_mongs_group_filt=[]; micro_mongs_acumulado_group_filt=[];

% Interkey_Matrix - Learning curve per trial
interkey_mat=[]; interkey_mat_filt=[];

%GC 6/1/23
%Micro Gains Median --> todos estan filtrados
mediana_MicroMOGS_group=[]; mediana_MicroMONGS_group=[];
%Los acumulativos solo son para los filtrados, si además estan normalizados
%dará solo NaNs
mediana_MicroMOGS_acum_group=[]; mediana_MicroMONGS_acum_group=[];

%% reorganización de matrices

% PARADIGMA GUADA POR TIEMPO
if strcmp(paradigm_flag,'tiempo')==1
    %si el bloque corta por tiempo debo reorganizar el vector IKI_TRIAL para llevarlo a IKI_GROUP
    
    % PARA LA DATA CRUDA
    %Busco el sujeto que màs secuencias haya hecho midiendo la cantidad de columnas de la matriz IKI_TRIAL_MATRIX
    max_seq=12;
    for i=1:length(SUJETOS)
        if size(SUJETOS(i).S.seq_results.IKI_trial_matrix,2)>max_seq
            %si encuentra un sujeto que haya hecho màs secuencias
            max_seq=size(SUJETOS(i).S.seq_results.IKI_trial_matrix,2);
        end
    end
    
    %completo a las matrices de los otros sujetos con columnas de NaN asì
    %todos tienen la mismas cantidad de columnas, sabiendo que el bloque
    %termina en max_seq
    
    for i=1:length(SUJETOS)
        %filas= cantidad de bloques
        %columnas= la diferencia entre el màximo y el actual
        columnas_nan=nan(18,max_seq-size(SUJETOS(i).S.seq_results.IKI_trial_matrix,2));
        SUJETOS(i).S.seq_results.IKI_trial_matrix=[SUJETOS(i).S.seq_results.IKI_trial_matrix columnas_nan];
    end
    
    %Pongo todas las matrices en 1 fila para poder hacer la comparaciòn
    %entre sujetos, sabiendo que el bloque termina en max_seq. Ahora en el
    %medio van a quedar los NaN's. No va a ser un gràfico continuo
    for i=1:length(SUJETOS)
        SUJETOS(i).S.seq_results.IKI_trial=reshape(SUJETOS(i).S.seq_results.IKI_trial_matrix',1, []);
    end
    
    clear max_seq; clear columnas_nan;
    %PARA LA DATA FILTRADA
    
    %Busco el sujeto que màs secuencias haya hecho midiendo la cantidad de columnas de la matriz IKI_TRIAL_MATRIX
    max_seq=12;
    for i=1:length(SUJETOS)
        if size(SUJETOS(i).S.seq_results.IKI_trial_matrix_filt,2)>max_seq
            %si encuentra un sujeto que haya hecho màs secuencias
            max_seq=size(SUJETOS(i).S.seq_results.IKI_trial_matrix_filt,2);
        end
    end
    
    %completo a las matrices de los otros sujetos con columnas de NaN asì
    %todos tienen la mismas cantidad de columnas, sabiendo que el bloque
    %termina en max_seq
    
    for i=1:length(SUJETOS)
        %filas= cantidad de bloques
        %columnas= la diferencia entre el màximo y el actual
        columnas_nan=nan(18,max_seq-size(SUJETOS(i).S.seq_results.IKI_trial_matrix_filt,2));
        SUJETOS(i).S.seq_results.IKI_trial_matrix_filt=[SUJETOS(i).S.seq_results.IKI_trial_matrix_filt columnas_nan];
    end
    
    %Pongo todas las matrices en 1 fila para poder hacer la comparaciòn
    %entre sujetos, sabiendo que el bloque termina en max_seq. Ahora en el
    %medio van a quedar los NaN's. No va a ser un gràfico continuo
    for i=1:length(SUJETOS)
        SUJETOS(i).S.seq_results.IKI_trial_filt=reshape(SUJETOS(i).S.seq_results.IKI_trial_matrix_filt',1, []);
    end
end

% Matriz IKI_per_trial y a los micro micro - la pongo en una fila para poder graficarla. Los vector es de noBlock x noSeq
for i=1:length(SUJETOS)
    SUJETOS(i).S.seq_results.IKI_per_trial_filt=reshape(SUJETOS(i).S.seq_results.IKI_per_trial_filt',1,[]);
    SUJETOS(i).S.seq_results.IKI_per_trial=reshape(SUJETOS(i).S.seq_results.IKI_per_trial',1,[]);
    
    SUJETOS(i).S.seq_results.MicroMOGS=reshape(SUJETOS(i).S.seq_results.MicroMOGS',1,[]);
    SUJETOS(i).S.seq_results.MicroMONGS=reshape(SUJETOS(i).S.seq_results.MicroMONGS',1,[]);
    
    SUJETOS(i).S.seq_results.MicroMogs_acum=reshape(SUJETOS(i).S.seq_results.MicroMogs_acum',1,[]);
    SUJETOS(i).S.seq_results.MicroMongs_acum=reshape(SUJETOS(i).S.seq_results.MicroMongs_acum',1,[]);
    
    SUJETOS(i).S.seq_results.MicroMOGS_filt=reshape(SUJETOS(i).S.seq_results.MicroMOGS_filt',1,[]);
    SUJETOS(i).S.seq_results.MicroMONGS_filt=reshape(SUJETOS(i).S.seq_results.MicroMONGS_filt',1,[]);
    
    SUJETOS(i).S.seq_results.MicroMogs_filt_acum=reshape(SUJETOS(i).S.seq_results.MicroMogs_filt_acum',1,[]);
    SUJETOS(i).S.seq_results.MicroMongs_filt_acum=reshape(SUJETOS(i).S.seq_results.MicroMongs_filt_acum',1,[]);
end

%% Sin Normalizar
 for i=1:length(SUJETOS)
    duration_group=[duration_group;SUJETOS(i).S.seq_results.GOduration];
    seq_group=[seq_group;SUJETOS(i).S.seq_results.SEQduration];
    seq_group_num=[seq_group_num;SUJETOS(i).S.seq_results.correct];
    key_group=[key_group;SUJETOS(i).S.seq_results.Intervalmean];
    
    iki_group=[iki_group;SUJETOS(i).S.seq_results.IKI_per_trial];
    iki_group_filt=[iki_group_filt;SUJETOS(i).S.seq_results.IKI_per_trial_filt];
    
    mogs_group=[mogs_group;SUJETOS(i).S.seq_results.MOGS'];
    mogs_acumulado_group=[mogs_acumulado_group;SUJETOS(i).S.seq_results.MOGS_acumulativo'];
    mongs_group=[mongs_group;SUJETOS(i).S.seq_results.MONGS];
    mongs_acumulado_group=[mongs_acumulado_group;SUJETOS(i).S.seq_results.MONGS_acumulativo];
    TL_group=[TL_group;SUJETOS(i).S.seq_results.Total_Learning];
    TL_acumulado_group=[TL_acumulado_group;SUJETOS(i).S.seq_results.Total_Learning_acumulativo];
    
    mogs_group_filt=[mogs_group_filt;SUJETOS(i).S.seq_results.MOGS_filt'];
    mogs_acumulado_group_filt=[mogs_acumulado_group_filt;SUJETOS(i).S.seq_results.MOGS_acumulativo_filt'];
    mongs_group_filt=[mongs_group_filt;SUJETOS(i).S.seq_results.MONGS_filt];
    mongs_acumulado_group_filt=[mongs_acumulado_group_filt;SUJETOS(i).S.seq_results.MONGS_acumulativo_filt];
    TL_group_filt=[TL_group_filt;SUJETOS(i).S.seq_results.Total_Learning_filt];
    TL_acumulado_group_filt=[TL_acumulado_group_filt;SUJETOS(i).S.seq_results.Total_Learning_acumulativo_filt];
    
    micro_mogs_group=[micro_mogs_group;SUJETOS(i).S.seq_results.MicroMOGS];
    micro_mongs_group=[micro_mongs_group;SUJETOS(i).S.seq_results.MicroMONGS];
    micro_mogs_acumulado_group=[micro_mogs_acumulado_group;SUJETOS(i).S.seq_results.MicroMogs_acum];
    micro_mongs_acumulado_group=[micro_mongs_acumulado_group;SUJETOS(i).S.seq_results.MicroMongs_acum];

    micro_mogs_group_filt=[micro_mogs_group_filt;SUJETOS(i).S.seq_results.MicroMOGS_filt];
    micro_mongs_group_filt=[micro_mongs_group_filt;SUJETOS(i).S.seq_results.MicroMONGS_filt];
    micro_mogs_acumulado_group_filt=[micro_mogs_acumulado_group_filt;SUJETOS(i).S.seq_results.MicroMogs_filt_acum];
    micro_mongs_acumulado_group_filt=[micro_mongs_acumulado_group_filt;SUJETOS(i).S.seq_results.MicroMongs_filt_acum];

    interkey_mat=[interkey_mat;SUJETOS(i).S.seq_results.interkey_matrix];
    interkey_mat_filt=[interkey_mat_filt;SUJETOS(i).S.seq_results.interkey_matrix_filt];
    
    %GC 6/1/23
    mediana_MicroMOGS_group=[mediana_MicroMOGS_group;SUJETOS(i).S.seq_results.mediana_MicroMogs];
    mediana_MicroMONGS_group=[mediana_MicroMONGS_group;SUJETOS(i).S.seq_results.mediana_MicroMongs];
    mediana_MicroMOGS_acum_group=[mediana_MicroMOGS_acum_group;SUJETOS(i).S.seq_results.mediana_MicroMogs_acum];
    mediana_MicroMONGS_acum_group=[mediana_MicroMONGS_acum_group;SUJETOS(i).S.seq_results.mediana_MicroMongs_acum];


 end

 %% Pongo los parámetros en un struct
Group_Parameters.duration_group=duration_group;
Group_Parameters.seq_group=seq_group;
Group_Parameters.seq_group_num=seq_group_num;
Group_Parameters.key_group=key_group;

Group_Parameters.iki_group=iki_group;
Group_Parameters.iki_group_filt=iki_group_filt;

Group_Parameters.mogs_group=mogs_group;
Group_Parameters.mogs_acumulado_group=mogs_acumulado_group;
Group_Parameters.mongs_group=mongs_group;
Group_Parameters.mongs_acumulado_group=mongs_acumulado_group;
Group_Parameters.TL_group=TL_group;
Group_Parameters.TL_acumulado_group=TL_acumulado_group;

Group_Parameters.mogs_group_filt=mogs_group_filt;
Group_Parameters.mogs_acumulado_group_filt=mogs_acumulado_group_filt;
Group_Parameters.mongs_group_filt=mongs_group_filt;
Group_Parameters.mongs_acumulado_group_filt=mongs_acumulado_group_filt;
Group_Parameters.TL_group_filt=TL_group_filt;
Group_Parameters.TL_acumulado_group_filt=TL_acumulado_group_filt;

Group_Parameters.micro_mogs_group=micro_mogs_group;
Group_Parameters.micro_mogs_acumulado_group=micro_mogs_acumulado_group;
Group_Parameters.micro_mongs_group=micro_mongs_group;
Group_Parameters.micro_mongs_acumulado_group=micro_mongs_acumulado_group;

Group_Parameters.micro_mogs_group_filt=micro_mogs_group_filt;
Group_Parameters.micro_mogs_acumulado_group_filt=micro_mogs_acumulado_group_filt;
Group_Parameters.micro_mongs_group_filt=micro_mongs_group_filt;
Group_Parameters.micro_mongs_acumulado_group_filt=micro_mongs_acumulado_group_filt;
 
Group_Parameters.interkey_mat=interkey_mat;
Group_Parameters.interkey_mat_filt=interkey_mat_filt;

%GC 6/1/23
Group_Parameters.mediana_MicroMOGS_group=mediana_MicroMOGS_group;
Group_Parameters.mediana_MicroMONGS_group=mediana_MicroMONGS_group;
Group_Parameters.mediana_MicroMOGS_acum_group=mediana_MicroMOGS_acum_group;
Group_Parameters.mediana_MicroMONGS_acum_group=mediana_MicroMONGS_acum_group;

%GC 18/1/23
if SUJETOS(1).S.seq_results.flag_norm==0 %grupo solo filtrado
    Group_Parameters.flag_norm=0;
else %grupo filtrado y normalizado
    Group_Parameters.flag_norm=1;
    Group_Parameters.flag_tipo_norm=SUJETOS(1).S.seq_results.flag_tipo_norm;
end

%% clear workspace
clear duration_group; clear seq_group; clear key_group; clear seq_group_num;
clear iki_group; clear iki_group_filt;

clear mogs_group; clear mogs_acumulado_group; clear mongs_acumulado_group; clear mongs_group;
clear TL_group; clear TL_acumulado_group;

clear mogs_group_filt; clear mogs_acumulado_group_filt; clear mongs_acumulado_group_filt; clear mongs_group_filt;
clear TL_group_filt; clear TL_acumulado_group_filt;

clear micro_mogs_group; clear micro_mogs_acumulado_group; clear micro_mongs_acumulado_group; clear micro_mongs_group;

clear micro_mogs_group_filt; clear micro_mogs_acumulado_group_filt; clear micro_mongs_acumulado_group_filt; clear micro_mongs_group_filt;

%GC 6/1/23
clear mediana_MicroMOGS_group; clear mediana_MicroMONGS_group; clear mediana_MicroMOGS_acum_group; clear mediana_MicroMONGS_acum_group; 
%% Plot figures
%IKI_print(Group_Parameters,length(SUJETOS));
Group_Results = Plot_Grupal_Figures(Group_Parameters,path,titulo,paradigm_flag,length(SUJETOS));

%% Guardo los datos en resultados

if strcmp(paradigm_flag,'tiempo')==1
    Group_Results.max_seq=max_seq;
end

%GC 18/1/23
Group_Results.flag_norm=Group_Parameters.flag_norm;

save([path 'Group_Results.mat'],'Group_Results');