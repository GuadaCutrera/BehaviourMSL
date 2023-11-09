%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                        Transitions_csv:                             %%%
%%% Permite realizar una tabla de la siguiente manera                   %%%
%%%                                                                     %%%
%%%           | Suj ID |  Int 12  | Int 23 | Int 34 | Int 45 |          %%%
%%%           ------------------------------------------------          %%%
%%%           |    1   |    ...   |  ...   |   ...  |   ...  |          %%%
%%%                                                                     %%%
%%%                          GC 10/1/23                                 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                          

function transitions_csv(Sujetos,titulo,norm_flag)

%inicializo la tabla
IntertapInterval=table('Size',[length(Sujetos)*180 5],'VariableTypes',{'double','double','double','double','double'});
IntertapInterval.Properties.VariableNames{1} = 'Sujeto';
IntertapInterval.Properties.VariableNames{2} = 'Intervalo12';
IntertapInterval.Properties.VariableNames{3} = 'Intervalo23';
IntertapInterval.Properties.VariableNames{4} = 'Intervalo34';
IntertapInterval.Properties.VariableNames{5} = 'Intervalo45';

%180: cantidad de trials en toda la tarea, cada transicion tiene 180
%valores

%Inicializo los intervalos en NaN's
interval12=NaN(length(Sujetos)*180,1);
interval23=NaN(length(Sujetos)*180,1);
interval34=NaN(length(Sujetos)*180,1);
interval45=NaN(length(Sujetos)*180,1);

Subj_ID=NaN(length(Sujetos)*180,1);

%Pongo los intervalos en orden vectorial
for i=1:length(Sujetos)
    Subj_ID(((i-1)*180+1):i*180)=ones(180,1)*i;
    interval12(((i-1)*180+1):i*180)=reshape(Sujetos(i).S.seq_results.intervalo_12_filt',1,[]);
    interval23(((i-1)*180+1):i*180)=reshape(Sujetos(i).S.seq_results.intervalo_23_filt',1,[]);
    interval34(((i-1)*180+1):i*180)=reshape(Sujetos(i).S.seq_results.intervalo_34_filt',1,[]);
    interval45(((i-1)*180+1):i*180)=reshape(Sujetos(i).S.seq_results.intervalo_45_filt',1,[]);
end

%Remover los NaN de la tabla para evitar problemas de clasificación. 
% copio el valor del trial anterior para reemplazar el NaN

for i=1:size(Subj_ID,1)
    % Transicion 12
    if ~isnan(interval12(i)) 
        aux12=interval12(i);
    else
        if Subj_ID(i)==Subj_ID(i-1) %me fijo que sea el mismo sujeto
            interval12(i)=aux12;
        else
            interval12(i)=interval12(i+1); %copio el valor siguiente
        end
    end
    
    % Transicion 23
    if ~isnan(interval23(i)) 
        aux23=interval23(i);
    else
        if Subj_ID(i)==Subj_ID(i-1) %me fijo que sea el mismo sujeto
            interval23(i)=aux23;
        else
            interval23(i)=interval23(i+1); %copio el valor siguiente
        end
    end
    
    % Transicion 34
    if ~isnan(interval34(i)) 
        aux34=interval34(i);
    else
        if Subj_ID(i)==Subj_ID(i-1) %me fijo que sea el mismo sujeto
            interval34(i)=aux34;
        else
            interval34(i)=interval34(i+1); %copio el valor siguiente
        end
    end
    
    % Transicion 45
    if ~isnan(interval45(i)) 
        aux45=interval45(i);
    else
        if Subj_ID(i)==Subj_ID(i-1) %me fijo que sea el mismo sujeto
            interval45(i)=aux45;
        else
            interval45(i)=interval45(i+1); %copio el valor siguiente
        end
    end
end

%los copio a la tabla
IntertapInterval{:,1}=Subj_ID;
IntertapInterval{:,2}=interval12;
IntertapInterval{:,3}=interval23;
IntertapInterval{:,4}=interval34;
IntertapInterval{:,5}=interval45;

clear i; clear interval12;  clear interval23;  clear interval34;  clear interval45;  clear Subj_ID; 
%% Guardo la tabla
writetable(IntertapInterval,['IntertapInterval' titulo norm_flag '.csv']);