function Results=MicroGains_speed(speed_group,nroBlock)
% a esta funcion le llega una matriz, cada fila es el speed de un sujeto y
% las columas representan los bloques (solo para cuando ya esta en formato 
%de visualizacion de bonstrup donde el bloque son 1000 puntos) devuelve un
%struct con las ganancias de cada sujeto, la media across sujeto y su error
%estandar.
N=size(speed_group,1); %cant sujetos

durBlock=1000;
for j=1:size(speed_group,1) 
    cont=1;
    for k=1:durBlock:nroBlock*durBlock %36 bloques
        primero=speed_group(j,k);       
        ultimo=speed_group(j,k+durBlock-1);      
        MONGS(j,cont)=-(primero-ultimo);
       if k+durBlock<nroBlock*durBlock
                primero_siguiente_bloque=speed_group(j,k+durBlock);
                MOGS(j,cont)=-(ultimo-primero_siguiente_bloque);
                TL(j,cont)=-(primero-primero_siguiente_bloque);
            
        cont=cont+1;
        end
       
        
    end
end


Results.MOGS_tapping=MOGS;
Results.MONGS_tapping=MONGS;
Results.TL_tapping=TL;

Results.MOGS_acum_tapping=cumsum(MOGS,2,'omitnan');
Results.MONGS_acum_tapping=cumsum(MONGS,2,'omitnan');
Results.TL_acum_tapping=cumsum(TL,2,'omitnan');

Results.MOGS_acum_tapping_mean=nanmean(Results.MOGS_acum_tapping,1);
Results.MONGS_acum_tapping_mean=nanmean(Results.MONGS_acum_tapping,1);
Results.TL_acum_tapping_mean=nanmean(Results.TL_acum_tapping,1);
Results.MOGS_acum_tapping_std=nanstd(Results.MOGS_acum_tapping,0,1)/sqrt(N);
Results.MONGS_acum_tapping_std=nanstd(Results.MONGS_acum_tapping,0,1)/sqrt(N);
Results.TL_acum_tapping_std=nanstd(Results.TL_acum_tapping,0,1)/sqrt(N);