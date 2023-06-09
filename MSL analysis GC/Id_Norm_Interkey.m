%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         Id_Norm_Interkey                            %%%
%%% Esta funcion permite normalizar la variable IKI_trial (Interkey     %%%
%%% Interval per trial). Con esto queremos aplanar la curva de learning %%%
%%% de cada sujeto, para evitar inducir el fenómeno de anticorrelación  %%%
%%% entre MOGS y MONGS. Además, para el análisis grupal, permite que haya%%
%%% menos variablidad entre sujetos.                                    %%%
%%% Por otro lado, se normalizan a los intervalos de forma individual y %%%   
%%% por bloque con un zscore.                                           %%%
%%%                                                                     %%%
%%% Parámetros:                                                         %%%
%%%   -  IKI_trial: este ya se encuentra filtrado (bloque a bloque) por el% 
%%%   método seleccionado en Id_Filt_Interkey pero no está normalizado  %%%
%%%   - interval_ij: estan filtrados pero no normalizados.              %%%
%%%                                                                     %%%
%%%                             GC 13/1/23                              %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [interval12,interval23,interval34,interval45,IKI_trial_norm] = ...
    Id_Norm_Interkey(interval12,interval23,interval34,interval45,IKI_trial,fname,path,flag_tipo_norm)
%% Normalizacion de los intervalos con zscore por bloque
seq_per_block=size(interval12,2); %columnas
noBlock=size(interval12,1); %filas

for i=1:noBlock

    media12=nanmean(interval12(i,:));
    media23=nanmean(interval23(i,:));
    media34=nanmean(interval34(i,:));
    media45=nanmean(interval45(i,:));

    std12=nanstd(interval12(i,:));
    std23=nanstd(interval23(i,:));
    std34=nanstd(interval34(i,:));
    std45=nanstd(interval45(i,:));

    %no uso la funcion zscore porque no contempla NaN's
    interval12(i,:)=(interval12(i,:)-media12)/std12;
    interval23(i,:)=(interval23(i,:)-media23)/std23;
    interval34(i,:)=(interval34(i,:)-media34)/std34;
    interval45(i,:)=(interval45(i,:)-media45)/std45;  

end

%vectorizo para graficar
interval12=reshape(interval12',1, []);
interval23=reshape(interval23',1, []);
interval34=reshape(interval34',1, []);
interval45=reshape(interval45',1, []);

%plot
figure;
plot(interval12,'b.','MarkerSize',15); hold on;
plot(interval23,'r.','MarkerSize',15); hold on;
plot(interval34,'g.','MarkerSize',15); hold on;
plot(interval45,'m.','MarkerSize',15); hold on;

for i=1:seq_per_block:length(interval12)
    xline(i)
end
%ylim([0 1.5])
title('filt y norm por bloque')
legend('Int-12: "41"','Int-23: "13"','Int-34: "32"','Int-45: "24"');

if ~strcmp(fname,'none')
    saveas(gcf,[path fname(1:end-4) '_Intervalos_filt_norm.' 'fig']);
    saveas(gcf,[path fname(1:end-4) '_Intervalos_filt_norm.' 'png']);
    clf %clear figure
end

% Devuelvo los intervalos a modo matricial
interval12=reshape(interval12, seq_per_block, noBlock)';
interval23=reshape(interval23, seq_per_block, noBlock)';
interval34=reshape(interval34, seq_per_block, noBlock)';
interval45=reshape(interval45, seq_per_block, noBlock)';

%% Normalización IKI_trial
IKI_trial=reshape(IKI_trial',1,[]);
if strcmp(flag_tipo_norm,'Z')
    % Normalización del IKI_trial con zscore (toda la tarea)
    IKI_trial_norm_Z=(IKI_trial-nanmedian(IKI_trial))/nanstd(IKI_trial);
    IKI_trial_norm=reshape(IKI_trial_norm_Z,seq_per_block,noBlock)';
else
    % Normalización del IKI_trial con 0-1 (toda la tarea)
    IKI_trial_norm_01=rescale(IKI_trial);
    IKI_trial_norm=reshape(IKI_trial_norm_01,seq_per_block,noBlock)';
end

