%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         MICRO MICRO GAINS                           %%%
%%% This function allows cuantification of gains in between trials      %%%
%%% In "Wiht ITI" protocol it helps understand where the true gain is.  %%%
%%%                                                                     %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [MicroMOGS,MicroMONGS] = Micro_Micro_gains_key(interval12,interval45,flag_continuous_seq)
%[MicroMOGS,MicroMONGS,MicroMOGS_filt,MicroMONGS_filt,cant_puntos_total] = Micro_Micro_gains_key(interval12,interval45,flag_continuous_seq,flag_norm)

noBlock=size(interval12,1);
noSeq=size(interval12,2);
MicroMOGS=NaN(noBlock,noSeq-1); %hay máximo 11 posibles offline gains por bloque
MicroMONGS=NaN(noBlock,noSeq); %hay máximo 12 posibles online gains por blouqe

for i=1:noBlock
    for j=1:noSeq %empieza desde la segunda porque la primera no tiene una secuencia previa y vale NaN siempre
        if  j>1 && flag_continuous_seq(i,j)== 1 
            MicroMOGS(i,j-1)=interval45(i,j-1)- interval12(i,j);
        end %END IF
        MicroMONGS(i,j)=interval12(i,j)-interval45(i,j);
    end %END FOR J
end %END FOR I


%% FILTRO
% interval23=nan(size(interval12));
% interval34=nan(size(interval12));
% [interval12_filt,interval23_filt,interval34_filt,interval45_filt,cant_puntos_total]= Id_Filt_Interkey(interval12,interval23,interval34,interval45,'none','none',flag_norm);
%  
% MicroMOGS_filt=NaN(noBlock,noSeq-1); %hay máximo 11 posibles offline gains por bloque
% MicroMONGS_filt=NaN(noBlock,noSeq); %hay máximo 12 posibles online gains por blouqe
% 
% for i=1:noBlock
%     for j=1:noSeq %empieza desde la segunda porque la primera no tiene una secuencia previa y vale NaN siempre
%         if  j>1 && flag_continuous_seq(i,j)== 1 
%             MicroMOGS_filt(i,j-1)=interval45_filt(i,j-1)- interval12_filt(i,j);
%         end %END IF
%         MicroMONGS_filt(i,j)=interval12_filt(i,j)-interval45_filt(i,j);
%     end %END FOR J
% end %END FOR I
% 
