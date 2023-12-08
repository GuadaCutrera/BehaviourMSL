%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% This function allows a comparison between filtration of the data    %%%
%%% and filtration with normalization of the data.                      %%%
%%% S_filt: seq_results struct of the subject with filtered data        %%%
%%% S_filt_norm: seq_results struct of the subject with filtered and    %%%
%%% normalized data.                                                    %%%
%%% flag: indica si es un analisis individual o grupal                  %%%
%%% Hago una correlación de cada bloque para ver si los patrones de la  %%%
%%% data filtrada y filtrada normalizada son similares.                 %%%
%%% Devuelve struct con los vectroes de correlación para cada bloque, para
%%% los Micro Micro Gains acumulados y sin acumular.                    %%%
%%%                                                                     %%%
%%%                         GC 5/1/23                                   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function corr_S=Compare_Same_Group(S_filt,S_filt_norm,flag)

if strcmp(flag,'individual') %-----------------------------------------------------------------------
    % no acum
    %fuerzo los NaN a 0 porque el corr cuando hay un NaN en la fila no
    %correlaciona nada --> fingir demencia xq esto es medio ilegal :)
    S_filt.seq_results.MicroMOGS_filt(isnan(S_filt.seq_results.MicroMOGS_filt))=0;
    S_filt_norm.seq_results.MicroMOGS_filt(isnan(S_filt_norm.seq_results.MicroMOGS_filt))=0;

    S_filt.seq_results.MicroMONGS_filt(isnan(S_filt.seq_results.MicroMONGS_filt))=0;
    S_filt_norm.seq_results.MicroMONGS_filt(isnan(S_filt_norm.seq_results.MicroMONGS_filt))=0;

    %acum
    S_filt.seq_results.MicroMogs_filt_acum(isnan(S_filt.seq_results.MicroMogs_filt_acum))=0;
    S_filt_norm.seq_results.MicroMogs_filt_acum(isnan(S_filt_norm.seq_results.MicroMogs_filt_acum))=0;

    S_filt.seq_results.MicroMongs_filt_acum(isnan(S_filt.seq_results.MicroMongs_filt_acum))=0;
    S_filt_norm.seq_results.MicroMongs_filt_acum(isnan(S_filt_norm.seq_results.MicroMongs_filt_acum))=0;

    %vectores corr Micro Micro no acum
    corr_MicroMOGS=NaN(size(S_filt.seq_results.MicroMOGS_filt,1),1);
    corr_MicroMONGS=NaN(size(S_filt.seq_results.MicroMONGS_filt,1),1);

    %vectores corr Micro Micro  acum
    corr_MicroMOGS_acum=NaN(size(S_filt.seq_results.MicroMogs_filt_acum,1),1);
    corr_MicroMONGS_acum=NaN(size(S_filt.seq_results.MicroMongs_filt_acum,1),1);

    %hago una correlación por bloque porque sino no se en qué parte de la tarea
    %hay diferencias
    for i=1:size(S_filt.seq_results.MicroMOGS,1)
        aux_filt=S_filt.seq_results.MicroMOGS_filt(i,:)';
        aux_filt_norm=S_filt_norm.seq_results.MicroMOGS_filt(i,:)';
        corr_MicroMOGS(i)=corr(aux_filt,aux_filt_norm);

        aux_filt=S_filt.seq_results.MicroMONGS_filt(i,:)';
        aux_filt_norm=S_filt_norm.seq_results.MicroMONGS_filt(i,:)';
        corr_MicroMONGS(i)=corr(aux_filt,aux_filt_norm);

        aux_filt=S_filt.seq_results.MicroMogs_filt_acum(i,:)';
        aux_filt_norm=S_filt_norm.seq_results.MicroMogs_filt_acum(i,:)';
        corr_MicroMOGS_acum(i)=corr(aux_filt,aux_filt_norm);

        aux_filt=S_filt.seq_results.MicroMongs_filt_acum(i,:)';
        aux_filt_norm=S_filt_norm.seq_results.MicroMongs_filt_acum(i,:)';
        corr_MicroMONGS_acum(i)=corr(aux_filt,aux_filt_norm);
    end

    corr_S.corr_MicroMOGS=corr_MicroMOGS;
    corr_S.corr_MicroMONGS=corr_MicroMONGS;
    corr_S.corr_MicroMOGS_acum=corr_MicroMOGS_acum;
    corr_S.corr_MicroMONGS_acum=corr_MicroMONGS_acum;
    
else % si es grupal -----------------------------------------------------------------------------------
    bloques=15;
    %Quito los valores NaN y los fuerzo a 0 (esto es medio ilegal), pero la
    %función corr, no toma valores NaN. 
    
    % iki
    S_filt.iki_group_filt_mean(isnan(S_filt.iki_group_filt_mean))=0;
    S_filt_norm.iki_group_filt_mean(isnan(S_filt_norm.iki_group_filt_mean))=0;
   
    %Micro Gains acum
    S_filt.mogs_group_acumulado_filt_mean(isnan(S_filt.mogs_group_acumulado_filt_mean))=0;
    S_filt_norm.mogs_group_acumulado_filt_mean(isnan(S_filt_norm.mogs_group_acumulado_filt_mean))=0;
    
    S_filt.mongs_group_acumulado_filt_mean(isnan(S_filt.mongs_group_acumulado_filt_mean))=0;
    S_filt_norm.mongs_group_acumulado_filt_mean(isnan(S_filt_norm.mongs_group_acumulado_filt_mean))=0;

    S_filt.TL_group_acumulado_filt_mean(isnan(S_filt.TL_group_acumulado_filt_mean))=0;
    S_filt_norm.TL_group_acumulado_filt_mean(isnan(S_filt_norm.TL_group_acumulado_filt_mean))=0;
    
    %Micro Micro Gains No acum
    S_filt.micro_mogs_group_mean_filt(isnan(S_filt.micro_mogs_group_mean_filt))=0;
    S_filt_norm.micro_mogs_group_mean_filt(isnan(S_filt_norm.micro_mogs_group_mean_filt))=0;
    
    S_filt.micro_mongs_group_mean_filt(isnan(S_filt.micro_mongs_group_mean_filt))=0;
    S_filt_norm.micro_mongs_group_mean_filt(isnan(S_filt_norm.micro_mongs_group_mean_filt))=0;
    
    %Micro Micro Gains Acum
    S_filt.micro_mogs_acumulado_group_mean_filt(isnan(S_filt.micro_mogs_acumulado_group_mean_filt))=0;
    S_filt_norm.micro_mogs_acumulado_group_mean_filt(isnan(S_filt_norm.micro_mogs_acumulado_group_mean_filt))=0;
    
    S_filt.micro_mongs_acumulado_group_mean_filt(isnan(S_filt.micro_mongs_acumulado_group_mean_filt))=0;
    S_filt_norm.micro_mongs_acumulado_group_mean_filt(isnan(S_filt_norm.micro_mongs_acumulado_group_mean_filt))=0;
    
    %Micro Micro Gains Mediana
    S_filt.mediana_MicroMogs_mean(isnan(S_filt.mediana_MicroMogs_mean))=0;
    S_filt_norm.mediana_MicroMogs_mean(isnan(S_filt_norm.mediana_MicroMogs_mean))=0;
    
    S_filt.mediana_MicroMongs_mean(isnan(S_filt.mediana_MicroMongs_mean))=0;
    S_filt_norm.mediana_MicroMongs_mean(isnan(S_filt_norm.mediana_MicroMongs_mean))=0;
    
    
    % Inicializo los vectores de correlación
    corr_iki=NaN(1,1);
    corr_mogs_acum=NaN(1,1);
    corr_mongs_acum=NaN(1,1);
    corr_TL_acum=NaN(1,1);
    corr_micro_mogs=NaN(bloques,1);
    corr_micro_mongs=NaN(bloques,1);
    corr_micro_mogs_acum=NaN(bloques,1);
    corr_micro_mongs_acum=NaN(bloques,1);
    corr_micro_mogs_mediana=NaN(1,1);
    corr_micro_mongs_mediana=NaN(1,1);
    
   
    %correlaciono
    corr_iki=corr(S_filt.iki_group_filt_mean',S_filt_norm.iki_group_filt_mean');
    corr_mogs_acum=corr(S_filt.mogs_group_acumulado_filt_mean',S_filt_norm.mogs_group_acumulado_filt_mean');
    corr_mongs_acum=corr(S_filt.mongs_group_acumulado_filt_mean',S_filt_norm.mongs_group_acumulado_filt_mean');
    corr_TL_acum=corr(S_filt.TL_group_acumulado_filt_mean',S_filt_norm.TL_group_acumulado_filt_mean');
    corr_micro_mogs_mediana=corr(S_filt.mediana_MicroMogs_mean',S_filt_norm.mediana_MicroMogs_mean');
    corr_micro_mongs_mediana=corr(S_filt.mediana_MicroMongs_mean',S_filt_norm.mediana_MicroMongs_mean');
    corr_micro_mogs=corr(S_filt.micro_mogs_group_mean_filt',S_filt_norm.micro_mogs_group_mean_filt');
    corr_micro_mongs=corr(S_filt.micro_mongs_group_mean_filt',S_filt_norm.micro_mongs_group_mean_filt');

    for i=1:bloques
        
        %no acum
%         aux_filt=S_filt.micro_mogs_group_mean_filt(i,:);
%         aux_filt_norm=S_filt_norm.micro_mogs_group_mean_filt(i,:);
%         corr_micro_mogs=corr(aux_filt,aux_filt_norm);
%         
%         aux_filt=S_filt.micro_mongs_group_mean_filt(i,:);
%         aux_filt_norm=S_filt_norm.micro_mongs_group_mean_filt(i,:);
%         corr_micro_mongs=corr(aux_filt,aux_filt_norm);
        
%         %acum
%         aux_filt=S_filt.micro_mogs_acumulado_group_mean_filt(i,:);
%         aux_filt_norm=S_filt_norm.micro_mogs_acumulado_group_mean_filt(i,:);
%         corr_micro_mogs_acum=corr(aux_filt,aux_filt_norm);
%         
%         aux_filt=S_filt.micro_mongs_acumulado_group_mean_filt(i,:);
%         aux_filt_norm=S_filt_norm.micro_mongs_acumulado_group_mean_filt(i,:);
%         corr_micro_mogs_acum=corr(aux_filt,aux_filt_norm);
        
        
    end
    
    corr_S.corr_iki=corr_iki;
    corr_S.corr_mogs_acum=corr_mogs_acum;
    corr_S.corr_mongs_acum=corr_mongs_acum;
    corr_S.corr_TL_acum=corr_TL_acum;
    corr_S.corr_micro_mogs=corr_micro_mogs;
    corr_S.corr_micro_mongs=corr_micro_mongs;
%     corr_S.corr_micro_mogs_acum=corr_micro_mogs_acum;
%     corr_S.corr_micro_mongs_acum=corr_micro_mongs_acum;
    corr_S.corr_micro_mogs_mediana=corr_micro_mogs_mediana;
    corr_S.corr_micro_mongs_mediana=corr_micro_mongs_mediana;
    
    
end

