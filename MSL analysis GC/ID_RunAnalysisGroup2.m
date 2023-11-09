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
iki_group=[]; iki_group_corr=[];
%Interkey Interval visualization raw and filtered
iki_visual_group=[]; iki_visual_group_corr=[];

%Micro Gains Raw
mogs_group=[]; mogs_acumulado_group=[];
mongs_group=[]; mongs_acumulado_group=[];
TL_acumulado_group=[]; TL_group=[];

% Micro Gains Filtered
mogs_group_corr=[]; mogs_acumulado_group_corr=[];
mongs_group_corr=[]; mongs_acumulado_group_corr=[];
TL_acumulado_group_corr=[]; TL_group_corr=[];

% Micro Micro Gains Raw
micro_mogs_group=[]; micro_mogs_acumulado_group=[];
micro_mongs_group=[]; micro_mongs_acumulado_group=[];

% Micro Micro Gains Filtered
% micro_mogs_group_corr=[]; micro_mogs_acumulado_group_corr=[];
% micro_mongs_group_corr=[]; micro_mongs_acumulado_group_corr=[];

% Interkey_Matrix - Learning curve per trial
interkey_mat=[]; interkey_mat_corr=[];

%GC 6/1/23
%Micro Gains Median --> todos estan filtrados
media_MicroMOGS_group=[]; media_MicroMONGS_group=[];
media_MicroMOGS_acum_group=[]; media_MicroMONGS_acum_group=[];
mediana_MicroMOGS_group=[]; mediana_MicroMONGS_group=[];
mediana_MicroMOGS_acum_group=[]; mediana_MicroMONGS_acum_group=[];

%GC 7/8/23
%MicroMOGS_visual_group=[]; MicroMONGS_visual_group=[]; 


%% reorganización de matrices

% PARADIGMA POR TIEMPO
if strcmp(paradigm_flag,'tiempo')==1
    
    %GC 11/6/2023
    %Si el paradigma corta por tiempo debo obtener el sujeto con más cantidad de secuencias realizadas para poder analizar todos los
    %bloques de los sujetos por igual. Esto es porque cada bloque de cada sujeto tiene una cantidad diferente de secuencias. 
    max_seq=0;
    for i=1:length(SUJETOS)
        if max(SUJETOS(i).S.seq_results.correct)>max_seq
            max_seq=max(SUJETOS(i).S.seq_results.correct);
        end
    end
    
    % Sabiendo que el bloque "general" termina en max_seq, completo los bloques con menos secuencias con NaN. Esto permite que todos los
    % sujetos (en todos sus bloques) tengan la "misma cantidad de secuencias". 
    
    for i=1:length(SUJETOS)
        %filas= cantidad de bloques
        %columnas= la diferencia entre el màximo y el actual
        columnas_nan=nan(size(SUJETOS(i).S.seq_results.IKI_per_trial,1),max_seq-size(SUJETOS(i).S.seq_results.IKI_per_trial,2));
        
        % IKI_trial
        SUJETOS(i).S.seq_results.IKI_per_trial=[SUJETOS(i).S.seq_results.IKI_per_trial columnas_nan];
        
        %MICRO MICRO OFFLINE
        SUJETOS(i).S.seq_results.MicroMOGS=[SUJETOS(i).S.seq_results.MicroMOGS columnas_nan];
        SUJETOS(i).S.seq_results.MicroMogs_acum=[SUJETOS(i).S.seq_results.MicroMogs_acum columnas_nan];
        
        
        %MICRO MICRO ONLINE
        SUJETOS(i).S.seq_results.MicroMONGS=[SUJETOS(i).S.seq_results.MicroMONGS columnas_nan]; 
        SUJETOS(i).S.seq_results.MicroMongs_acum=[SUJETOS(i).S.seq_results.MicroMongs_acum columnas_nan];
        
        
        if SUJETOS(i).S.seq_results.flag_norm==1 || SUJETOS(i).S.seq_results.flag_filt==1
            
            SUJETOS(i).S.seq_results.IKI_per_trial_corr=[SUJETOS(i).S.seq_results.IKI_per_trial_corr columnas_nan];
            
            %SUJETOS(i).S.seq_results.MicroMOGS_corr=[SUJETOS(i).S.seq_results.MicroMOGS_corr columnas_nan];
%            SUJETOS(i).S.seq_results.MicroMogs_corr_acum=[SUJETOS(i).S.seq_results.MicroMogs_corr_acum columnas_nan];
            
            %SUJETOS(i).S.seq_results.MicroMONGS_corr=[SUJETOS(i).S.seq_results.MicroMONGS_corr columnas_nan];
 %           SUJETOS(i).S.seq_results.MicroMongs_corr_acum=[SUJETOS(i).S.seq_results.MicroMongs_corr_acum columnas_nan];  

        end
        
    end
    
    
    
%     %si el bloque corta por tiempo debo reorganizar el vector IKI_TRIAL para llevarlo a IKI_GROUP
%     
%     % PARA LA DATA CRUDA
%     %Busco el sujeto que màs secuencias haya hecho midiendo la cantidad de columnas de la matriz IKI_TRIAL_MATRIX
%     max_seq=12;
%     for i=1:length(SUJETOS)
%         if size(SUJETOS(i).S.seq_results.IKI_per_trial,2)>max_seq
%             %si encuentra un sujeto que haya hecho màs secuencias
%             max_seq=size(SUJETOS(i).S.seq_results.IKI_per_trial,2);
%         end
%     end
%     
%     %completo a las matrices de los otros sujetos con columnas de NaN asì
%     %todos tienen la mismas cantidad de columnas, sabiendo que el bloque
%     %termina en max_seq
%     
%     for i=1:length(SUJETOS)
%         %filas= cantidad de bloques
%         %columnas= la diferencia entre el màximo y el actual
%         columnas_nan=nan(size(SUJETOS(i).S.seq_results.IKI_per_trial,1),max_seq-size(SUJETOS(i).S.seq_results.IKI_per_trial,2));
%         SUJETOS(i).S.seq_results.IKI_per_trial=[SUJETOS(i).S.seq_results.IKI_per_trial columnas_nan];
%     end
%     
%     %Pongo todas las matrices en 1 fila para poder hacer la comparaciòn
%     %entre sujetos, sabiendo que el bloque termina en max_seq. Ahora en el
%     %medio van a quedar los NaN's. No va a ser un gràfico continuo
% %     for i=1:length(SUJETOS)
% %         SUJETOS(i).S.seq_results.IKI_per_trial=reshape(SUJETOS(i).S.seq_results.IKI_per_trial',1, []);
% %     end
%     
%     clear max_seq; clear columnas_nan;
%     %PARA LA DATA FILTRADA
%     
%     %Busco el sujeto que màs secuencias haya hecho midiendo la cantidad de columnas de la matriz IKI_TRIAL_MATRIX
%     max_seq=12;
%     for i=1:length(SUJETOS)
%         if size(SUJETOS(i).S.seq_results.IKI_per_trial_corr,2)>max_seq
%             %si encuentra un sujeto que haya hecho màs secuencias
%             max_seq=size(SUJETOS(i).S.seq_results.IKI_per_trial_corr,2);
%         end
%     end
%     
%     %completo a las matrices de los otros sujetos con columnas de NaN asì
%     %todos tienen la mismas cantidad de columnas, sabiendo que el bloque
%     %termina en max_seq
%     
%     for i=1:length(SUJETOS)
%         %filas= cantidad de bloques
%         %columnas= la diferencia entre el màximo y el actual
%         columnas_nan=nan(size(SUJETOS(i).S.seq_results.IKI_per_trial_corr,1),max_seq-size(SUJETOS(i).S.seq_results.IKI_per_trial_corr,2));
%         SUJETOS(i).S.seq_results.IKI_per_trial_corr=[SUJETOS(i).S.seq_results.IKI_per_trial_corr columnas_nan];
%     end
%     
%     %Pongo todas las matrices en 1 fila para poder hacer la comparaciòn
%     %entre sujetos, sabiendo que el bloque termina en max_seq. Ahora en el
%     %medio van a quedar los NaN's. No va a ser un gràfico continuo
% %     for i=1:length(SUJETOS)
% %         SUJETOS(i).S.seq_results.IKI_per_trial_corr=reshape(SUJETOS(i).S.seq_results.IKI_per_trial_corr',1, []);
% %     end
end

% Matriz IKI_per_trial y a los micro micro - la pongo en una fila para poder graficarla. Los vector es de noBlock x noSeq
for i=1:length(SUJETOS)
    SUJETOS(i).S.seq_results.IKI_per_trial=reshape(SUJETOS(i).S.seq_results.IKI_per_trial',1,[]);
    
    SUJETOS(i).S.seq_results.MicroMOGS=reshape(SUJETOS(i).S.seq_results.MicroMOGS',1,[]);
    SUJETOS(i).S.seq_results.MicroMONGS=reshape(SUJETOS(i).S.seq_results.MicroMONGS',1,[]);
    
    SUJETOS(i).S.seq_results.MicroMogs_acum=reshape(SUJETOS(i).S.seq_results.MicroMogs_acum',1,[]);
    SUJETOS(i).S.seq_results.MicroMongs_acum=reshape(SUJETOS(i).S.seq_results.MicroMongs_acum',1,[]);
    
    %GC 11/6/2203
    if SUJETOS(i).S.seq_results.flag_norm==1 || SUJETOS(i).S.seq_results.flag_filt==1
       
        SUJETOS(i).S.seq_results.IKI_per_trial_corr=reshape(SUJETOS(i).S.seq_results.IKI_per_trial_corr',1,[]);
        
%         SUJETOS(i).S.seq_results.MicroMOGS_corr=reshape(SUJETOS(i).S.seq_results.MicroMOGS_corr',1,[]);
%         SUJETOS(i).S.seq_results.MicroMONGS_corr=reshape(SUJETOS(i).S.seq_results.MicroMONGS_corr',1,[]);
% 
%         SUJETOS(i).S.seq_results.MicroMogs_corr_acum=reshape(SUJETOS(i).S.seq_results.MicroMogs_corr_acum',1,[]);
%         SUJETOS(i).S.seq_results.MicroMongs_corr_acum=reshape(SUJETOS(i).S.seq_results.MicroMongs_corr_acum',1,[]);
        
    end

    
end

%% Sin Normalizar
 for i=1:length(SUJETOS)
    duration_group=[duration_group;SUJETOS(i).S.seq_results.GOduration];
    seq_group=[seq_group;SUJETOS(i).S.seq_results.SEQduration];
    seq_group_num=[seq_group_num;SUJETOS(i).S.seq_results.correct];
    key_group=[key_group;SUJETOS(i).S.seq_results.Intervalmean];
    
    iki_group=[iki_group;SUJETOS(i).S.seq_results.IKI_per_trial];
    iki_visual_group=[iki_visual_group;SUJETOS(i).S.seq_results.IKI_visual];
    
    mogs_group=[mogs_group;SUJETOS(i).S.seq_results.MOGS'];
    mogs_acumulado_group=[mogs_acumulado_group;SUJETOS(i).S.seq_results.MOGS_acumulativo'];
    mongs_group=[mongs_group;SUJETOS(i).S.seq_results.MONGS];
    mongs_acumulado_group=[mongs_acumulado_group;SUJETOS(i).S.seq_results.MONGS_acumulativo];
    TL_group=[TL_group;SUJETOS(i).S.seq_results.Total_Learning];
    TL_acumulado_group=[TL_acumulado_group;SUJETOS(i).S.seq_results.Total_Learning_acumulativo];
    
    
    micro_mogs_group=[micro_mogs_group;SUJETOS(i).S.seq_results.MicroMOGS];
    micro_mongs_group=[micro_mongs_group;SUJETOS(i).S.seq_results.MicroMONGS];
    micro_mogs_acumulado_group=[micro_mogs_acumulado_group;SUJETOS(i).S.seq_results.MicroMogs_acum];
    micro_mongs_acumulado_group=[micro_mongs_acumulado_group;SUJETOS(i).S.seq_results.MicroMongs_acum];

%     interkey_mat=[interkey_mat;SUJETOS(i).S.seq_results.interkey_matrix];
% 
%     if SUJETOS(i).S.seq_results.flag_filt==1
%         interkey_mat_corr=[interkey_mat_corr;SUJETOS(i).S.seq_results.interkey_matrix_corr];
%     end
    
    %GC 6/1/23
    media_MicroMOGS_group=[media_MicroMOGS_group;SUJETOS(i).S.seq_results.media_MicroMogs];
    media_MicroMONGS_group=[media_MicroMONGS_group;SUJETOS(i).S.seq_results.media_MicroMongs];
    media_MicroMOGS_acum_group=[media_MicroMOGS_acum_group;SUJETOS(i).S.seq_results.media_MicroMogs_acum];
    media_MicroMONGS_acum_group=[media_MicroMONGS_acum_group;SUJETOS(i).S.seq_results.media_MicroMongs_acum];
    
    mediana_MicroMOGS_group=[mediana_MicroMOGS_group;SUJETOS(i).S.seq_results.mediana_MicroMogs];
    mediana_MicroMONGS_group=[mediana_MicroMONGS_group;SUJETOS(i).S.seq_results.mediana_MicroMongs];
    mediana_MicroMOGS_acum_group=[mediana_MicroMOGS_acum_group;SUJETOS(i).S.seq_results.mediana_MicroMogs_acum];
    mediana_MicroMONGS_acum_group=[mediana_MicroMONGS_acum_group;SUJETOS(i).S.seq_results.mediana_MicroMongs_acum];
 
     % GC 7/8/23
%      MicroMOGS_visual_group=[MicroMOGS_visual_group;SUJETOS(i).S.seq_results.MicroMOGS_visual];
%      MicroMONGS_visual_group=[MicroMONGS_visual_group;SUJETOS(i).S.seq_results.MicroMONGS_visual];
    
    if SUJETOS(i).S.seq_results.flag_norm==1 || SUJETOS(i).S.seq_results.flag_filt==1
        %GC 11/6/2023
        iki_group_corr=[iki_group_corr;SUJETOS(i).S.seq_results.IKI_per_trial_corr];
        iki_visual_group_corr=[iki_visual_group_corr;SUJETOS(i).S.seq_results.IKI_visual_corr];
            
        mogs_group_corr=[mogs_group_corr;SUJETOS(i).S.seq_results.MOGS_corr'];
        mogs_acumulado_group_corr=[mogs_acumulado_group_corr;SUJETOS(i).S.seq_results.MOGS_acumulativo_corr'];
        mongs_group_corr=[mongs_group_corr;SUJETOS(i).S.seq_results.MONGS_corr];
        mongs_acumulado_group_corr=[mongs_acumulado_group_corr;SUJETOS(i).S.seq_results.MONGS_acumulativo_corr];
        TL_group_corr=[TL_group_corr;SUJETOS(i).S.seq_results.Total_Learning_corr];
        TL_acumulado_group_corr=[TL_acumulado_group_corr;SUJETOS(i).S.seq_results.Total_Learning_acumulativo_corr];
    
%         micro_mogs_group_corr=[micro_mogs_group_corr;SUJETOS(i).S.seq_results.MicroMOGS_corr];
%         micro_mongs_group_corr=[micro_mongs_group_corr;SUJETOS(i).S.seq_results.MicroMONGS_corr];
%         micro_mogs_acumulado_group_corr=[micro_mogs_acumulado_group_corr;SUJETOS(i).S.seq_results.MicroMogs_corr_acum];
%         micro_mongs_acumulado_group_corr=[micro_mongs_acumulado_group_corr;SUJETOS(i).S.seq_results.MicroMongs_corr_acum];
        
    end


 end

 %% Pongo los parámetros en un struct
Group_Parameters.duration_group=duration_group;
Group_Parameters.seq_group=seq_group;
Group_Parameters.seq_group_num=seq_group_num;
Group_Parameters.key_group=key_group;

Group_Parameters.iki_group=iki_group;
Group_Parameters.iki_visual_group=iki_visual_group;

Group_Parameters.mogs_group=mogs_group;
Group_Parameters.mogs_acumulado_group=mogs_acumulado_group;
Group_Parameters.mongs_group=mongs_group;
Group_Parameters.mongs_acumulado_group=mongs_acumulado_group;
Group_Parameters.TL_group=TL_group;
Group_Parameters.TL_acumulado_group=TL_acumulado_group;


Group_Parameters.micro_mogs_group=micro_mogs_group;
Group_Parameters.micro_mogs_acumulado_group=micro_mogs_acumulado_group;
Group_Parameters.micro_mongs_group=micro_mongs_group;
Group_Parameters.micro_mongs_acumulado_group=micro_mongs_acumulado_group;

% Group_Parameters.MicroMOGS_visual_group=MicroMOGS_visual_group;
% Group_Parameters.MicroMONGS_visual_group=MicroMONGS_visual_group;

%GC 11/6/2023
if SUJETOS(i).S.seq_results.flag_norm==1 || SUJETOS(i).S.seq_results.flag_filt==1
    
    Group_Parameters.iki_group_corr=iki_group_corr;
    Group_Parameters.iki_visual_group_corr=iki_visual_group_corr;

    Group_Parameters.mogs_group_corr=mogs_group_corr;
    Group_Parameters.mogs_acumulado_group_corr=mogs_acumulado_group_corr;
    Group_Parameters.mongs_group_corr=mongs_group_corr;
    Group_Parameters.mongs_acumulado_group_corr=mongs_acumulado_group_corr;
    Group_Parameters.TL_group_corr=TL_group_corr;
    Group_Parameters.TL_acumulado_group_corr=TL_acumulado_group_corr;

%     Group_Parameters.micro_mogs_group_corr=micro_mogs_group_corr;
%     Group_Parameters.micro_mogs_acumulado_group_corr=micro_mogs_acumulado_group_corr;
%     Group_Parameters.micro_mongs_group_corr=micro_mongs_group_corr;
%     Group_Parameters.micro_mongs_acumulado_group_corr=micro_mongs_acumulado_group_corr;
end

 
Group_Parameters.interkey_mat=interkey_mat;
if SUJETOS(1).S.seq_results.flag_filt==1
    Group_Parameters.interkey_mat_corr=interkey_mat_corr;
end

%GC 6/1/23
Group_Parameters.media_MicroMOGS_group=media_MicroMOGS_group;
Group_Parameters.media_MicroMONGS_group=media_MicroMONGS_group;

media_MicroMOGS_acum_group(media_MicroMOGS_acum_group==0)=NaN;
media_MicroMONGS_acum_group(media_MicroMONGS_acum_group==0)=NaN;
Group_Parameters.media_MicroMOGS_acum_group=media_MicroMOGS_acum_group;
Group_Parameters.media_MicroMONGS_acum_group=media_MicroMONGS_acum_group;

Group_Parameters.mediana_MicroMOGS_group=mediana_MicroMOGS_group;
Group_Parameters.mediana_MicroMONGS_group=mediana_MicroMONGS_group;

mediana_MicroMOGS_acum_group(mediana_MicroMOGS_acum_group==0)=NaN;
mediana_MicroMONGS_acum_group(mediana_MicroMONGS_acum_group==0)=NaN;
Group_Parameters.mediana_MicroMOGS_acum_group=mediana_MicroMOGS_acum_group;
Group_Parameters.mediana_MicroMONGS_acum_group=mediana_MicroMONGS_acum_group;

%GC 18/1/23
if SUJETOS(1).S.seq_results.flag_norm==0 %grupo no normalizado
    Group_Parameters.flag_norm=0;
    Group_Parameters.titulo_norm='sin norm';
else %grupo normalizado
    Group_Parameters.flag_norm=1;
    Group_Parameters.flag_tipo_norm=SUJETOS(1).S.seq_results.flag_tipo_norm;
    Group_Parameters.titulo_norm=SUJETOS(1).S.seq_results.flag_tipo_norm;
end
%GC 20/5/2023
if SUJETOS(1).S.seq_results.flag_filt==0 %grupo no filtrado
    Group_Parameters.flag_filt=0;
    Group_Parameters.titulo_filt='sin filt';
else %grupo filtrado
    Group_Parameters.flag_filt=1;
    Group_Parameters.titulo_filt='filt';
end
Group_Parameters.titulo_analisis=[Group_Parameters.titulo_filt ' - ' Group_Parameters.titulo_norm];

if strcmp(paradigm_flag,'tiempo')==1
    %11/6/2023
    Group_Parameters.cant_SeqBlock=max_seq;
else
    Group_Parameters.cant_SeqBlock=SUJETOS(1).S.seq_results.cant_SeqBlock;
end



%% clear workspace
clear duration_group; clear seq_group; clear key_group; clear seq_group_num;
clear iki_group; clear iki_group_corr;

clear mogs_group; clear mogs_acumulado_group; clear mongs_acumulado_group; clear mongs_group;
clear TL_group; clear TL_acumulado_group;

clear mogs_group_corr; clear mogs_acumulado_group_corr; clear mongs_acumulado_group_corr; clear mongs_group_corr;
clear TL_group_corr; clear TL_acumulado_group_corr;

clear micro_mogs_group; clear micro_mogs_acumulado_group; clear micro_mongs_acumulado_group; clear micro_mongs_group;

%clear micro_mogs_group_corr; clear micro_mogs_acumulado_group_corr; clear micro_mongs_acumulado_group_corr; clear micro_mongs_group_corr;

%GC 6/1/23
clear media_MicroMOGS_group; clear media_MicroMONGS_group; clear mediana_MicroMOGS_acum_group; clear mediana_MicroMONGS_acum_group; 
%% Plot figures
%IKI_print(Group_Parameters,length(SUJETOS));
%iki=analisis_visual(Group_Parameters.iki_visual_group);
Group_Results = Plot_Grupal_Figures(Group_Parameters,path,titulo,paradigm_flag,length(SUJETOS));
%Group_Results.Group_Parameters = Group_Parameters;

addpath('C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\experiments\Funciones para analisis MSL\')
[Group_Results.iki_interactivo_mean,Group_Parameters.iki_interactivo_group]=PlotInteractivo(SUJETOS,Group_Parameters,Group_Results,path);

Group_Results.Group_Parameters = Group_Parameters;
%% Guardo los datos en resultados

if strcmp(paradigm_flag,'tiempo')==1
    Group_Results.max_seq=max_seq;
end

%GC 18/1/23
Group_Results.flag_norm=Group_Parameters.flag_norm;
Group_Results.flag_filt=Group_Parameters.flag_filt;

save([path 'Group_Results.mat'],'Group_Results');