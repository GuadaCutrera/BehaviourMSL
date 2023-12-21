%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     FirstPointToZero                               %%%
%%% Esta funcion agarra el primer punto de cada sujeto y lo resta al resto
%%% de la tarea. De esta forma todos los sujetos empiezan desde un mismo%%
%%% punto y los dos grupos se vuelven comparables. A toda la tarea la resto
%%% el primer punto. Esto hace que empiece desde cero                   %%%
%%% hay una segunda opcion que es hacerlo empezar desde 1. 
%%% Recibe una matriz por cada variabe  a analizar.                     %%%
%%%    - Filas: Sujeto                                                  %%%
%%%    - Col: cada punto de la variable a lo largo de la tarea          %%%
%%% Devuelve un struct con todas las variables con el primer puntor restado
%%%                       GC 3/10/23                                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function Results = FirstPointToZero(Group_iki_visual,Group_MOGS,Group_MONGS,Group_TL,Group_MOGS_acum,...
    Group_MONGS_acum,Group_TL_acum,Group_MicroMOGS_media,Group_MicroMONGS_media,Group_MicroMOGS_acum_media,...
    Group_MicroMONGS_acum_media,Group_MicroMOGS_mediana,Group_MicroMONGS_mediana,Group_MicroMOGS_acum_mediana,... 
    Group_MicroMONGS_acum_mediana,flag_comienzo)
%flag_comienzo=2; %1= primer punto a 1. 0= primer punto a cero. 2= primer punto a 2.

N=size(Group_iki_visual,1); % cantidad de filas = sujetos
%% VISUAL IKI y speed
Group_iki_visual_aux=NaN(size(Group_iki_visual));         
Group_speed_aux=NaN(size(Group_iki_visual));
Group_speed=NaN(size(Group_iki_visual));

for i=1:size(Group_iki_visual,1)
    
    cont=1;
    while isnan(Group_iki_visual(i,cont))
        cont=cont+1;
    end
    %Group_speed(i,:)=1./Group_iki_visual(i,:);
    if flag_comienzo==0
        Group_speed(i,:)=1./Group_iki_visual(i,:);
        Group_iki_visual_aux(i,:)= Group_iki_visual(i,:)-Group_iki_visual(i,cont);
        Group_speed_aux(i,:)=Group_speed(i,:)-Group_speed(i,cont);
    else
        delta_iki=flag_comienzo-Group_iki_visual(i,cont); %el iki es menor a 1
        %delta_speed= flag_comienzo- Group_speed(i,cont); 
        
        Group_iki_visual_aux(i,:)= Group_iki_visual(i,:)+ delta_iki; %sumo lo que le falta para llegar a 1
        Group_speed(i,:)=1./Group_iki_visual_aux(i,:);
        delta_speed= flag_comienzo- Group_speed(i,cont); 
        Group_speed_aux(i,:)=Group_speed(i,:)+delta_speed;
    end

        
end
%clear i;

Results.iki_visual=Group_iki_visual_aux;
Results.iki_visual_mean=nanmean(Group_iki_visual_aux,1);
Results.iki_visual_std = nanstd(Group_iki_visual_aux,0,1)/sqrt(N);  
Results.speed_visual=Group_speed_aux;
Results.speed_visual_mean=nanmean(Group_speed_aux,1);
Results.speed_visual_std = nanstd(Group_speed_aux,0,1)/sqrt(N);    

%% Ganancias (Acum y no acum)

Group_MOGS_aux=NaN(size(Group_MOGS));
Group_MOGS_acum_aux=NaN(size(Group_MOGS_acum));
Group_MONGS_aux=NaN(size(Group_MONGS));
Group_MONGS_acum_aux=NaN(size(Group_MONGS_acum));
Group_TL_aux=NaN(size(Group_TL));
Group_TL_acum_aux=NaN(size(Group_TL_acum));

for i=1:size(Group_MONGS,1)    %porque es el que tiene un bloque más
    %if i<=size(Group_MONGS,1) 
        cont=1;
        while isnan(Group_MOGS(i,cont))
            cont=cont+1;
        end
        if flag_comienzo==0
            Group_MOGS_aux(i,:)=Group_MOGS(i,:)-Group_MOGS(i,cont);
            Group_MOGS_acum_aux(i,:)=Group_MOGS_acum(i,:)-Group_MOGS_acum(i,cont);
        else
            delta_mog=flag_comienzo-Group_MOGS(i,cont);
            delta_mog_acum=flag_comienzo-Group_MOGS_acum(i,cont);
            
            Group_MOGS_aux(i,:)=Group_MOGS(i,:)+delta_mog;
            Group_MOGS_acum_aux(i,:)=Group_MOGS_acum(i,:)+ delta_mog_acum;
        end
        cont=1;
        while isnan(Group_TL(i,cont))
            cont=cont+1;
        end
        if flag_comienzo==0
            Group_TL_aux(i,:)=Group_TL(i,:)-Group_TL(i,cont);
            Group_TL_acum_aux(i,:)=Group_TL_acum(i,:)-Group_TL_acum(i,cont);
        else
            delta_TL=flag_comienzo-Group_TL(i,cont);
            delta_TL_acum=flag_comienzo-Group_TL_acum(i,cont);
            
            Group_TL_aux(i,:)=Group_TL(i,:)+ delta_TL;
            Group_TL_acum_aux(i,:)=Group_TL_acum(i,:)+delta_TL_acum;
        end
   % end
    
    cont=1;
    while isnan(Group_MONGS(i,cont))
        cont=cont+1;
    end
    
    if flag_comienzo==0
        Group_MONGS_aux(i,:)=Group_MONGS(i,:)-Group_MONGS(i,cont);
        Group_MONGS_acum_aux(i,:)=Group_MONGS_acum(i,:)-Group_MONGS_acum(i,cont);
    else
        delta_mong=flag_comienzo-Group_MONGS(i,cont);
        delta_mong_acum=flag_comienzo-Group_MONGS_acum(i,cont);
        
        Group_MONGS_aux(i,:)=Group_MONGS(i,:)+delta_mong;
        Group_MONGS_acum_aux(i,:)=Group_MONGS_acum(i,:)+ delta_mong_acum;
    end

end

% a partir del original
Results.MOGS=Group_MOGS_aux;
Results.MONGS=Group_MONGS_aux;
Results.TL=Group_TL_aux;
Results.MOGS_acum=Group_MOGS_acum_aux;
Results.MONGS_acum=Group_MONGS_acum_aux;
Results.TL_acum=Group_TL_acum_aux;

Results.MOGS_mean=nanmean(Group_MOGS_aux,1);
Results.MONGS_mean=nanmean(Group_MONGS_aux,1);
Results.TL_mean=nanmean(Group_TL_aux,1);

Results.MOGS_acum_mean=nanmean(Group_MOGS_acum_aux,1);
Results.MONGS_acum_mean=nanmean(Group_MONGS_acum_aux,1);
Results.TL_acum_mean=nanmean(Group_TL_acum_aux,1);

Results.MOGS_acum_std=nanstd(Group_MOGS_acum_aux,0,1)/sqrt(N);
Results.MONGS_acum_std=nanstd(Group_MONGS_acum_aux,0,1)/sqrt(N);
Results.TL_acum_std=nanstd(Group_TL_acum_aux,0,1)/sqrt(N);

% a partir de las ganancias no acumuladas con el primer punto en 0
MOGS_acum_1st_point=cumsum(Group_MOGS_aux,2,'omitnan'); 
MOGS_acum_1st_point(MOGS_acum_1st_point==0)=NaN;
MONGS_acum_1st_point=cumsum(Group_MONGS_aux,2,'omitnan');
MONGS_acum_1st_point(MONGS_acum_1st_point==0)=NaN;
TL_acum_1st_point=cumsum(Group_TL_aux,2,'omitnan');
TL_acum_1st_point(TL_acum_1st_point==0)=NaN;

Results.MOGS_acum_1st_point_mean=nanmean(MOGS_acum_1st_point,1);
Results.MONGS_acum_1st_point_mean=nanmean(MONGS_acum_1st_point,1);
Results.TL_acum_1st_point_mean=nanmean(TL_acum_1st_point,1);
Results.MOGS_acum_1st_point_std=nanstd(MOGS_acum_1st_point,0,1)/sqrt(N);
Results.MONGS_acum_1st_point_std=nanstd(MONGS_acum_1st_point,0,1)/sqrt(N);
Results.TL_acum_1st_point_std=nanstd(TL_acum_1st_point,0,1)/sqrt(N);

%% nuevo calculo de ganancias a partir del nuevo learning de cada sujeto. 
%DAN EL MISMO RESULTADO QUE SIN EL PRIMER PUNTO EN CERO pero el tapping da
%distinto
durBlock=1000;
for j=1:size(Group_speed_aux,1) 
    cont=1;
    for k=1:durBlock:37*durBlock %36 bloques
        primero=Group_speed_aux(j,k);       
        ultimo=Group_speed_aux(j,k+durBlock-1);      
        MONGS(j,cont)=-(primero-ultimo);
       if k+durBlock<37*durBlock
                primero_siguiente_bloque=Group_speed_aux(j,k+durBlock);
                MOGS(j,cont)=-(ultimo-primero_siguiente_bloque);
                TL(j,cont)=-(primero-primero_siguiente_bloque);
            
        cont=cont+1;
        end
       
        
    end
end


Results.MOGS_tapping=MOGS;
Results.MONGS_tapping=MONGS;
Results.TL_tapping=TL;

MOGS_acum_tapping=cumsum(MOGS,2,'omitnan');
MONGS_acum_tapping=cumsum(MONGS,2,'omitnan');
TL_acum_tapping=cumsum(TL,2,'omitnan');

Results.MOGS_acum_tapping_mean=nanmean(MOGS_acum_tapping,1);
Results.MONGS_acum_tapping_mean=nanmean(MONGS_acum_tapping,1);
Results.TL_acum_tapping_mean=nanmean(TL_acum_tapping,1);
Results.MOGS_acum_tapping_std=nanstd(MOGS_acum_tapping,0,1)/sqrt(N);
Results.MONGS_acum_tapping_std=nanstd(MONGS_acum_tapping,0,1)/sqrt(N);
Results.TL_acum_tapping_std=nanstd(TL_acum_tapping,0,1)/sqrt(N);

%% Ganancias (Acum y no acum) del tapping
clear Group_MOGS_acum_aux; clear Group_MONGS_acum_aux; clear Group_TL_acum_aux;

Group_MOGS_acum_aux=NaN(size(MOGS_acum_tapping));
Group_MONGS_acum_aux=NaN(size(MONGS_acum_tapping));
Group_TL_acum_aux=NaN(size(TL_acum_tapping));

for i=1:size(MOGS_acum_tapping,1)    %porque es el que tiene un bloque más
    %if i<size(MOGS_acum_tapping,1) 
        cont=1;
        while isnan(MOGS_acum_tapping(i,cont))
            cont=cont+1;
        end
        Group_MOGS_acum_aux(i,:)=MOGS_acum_tapping(i,:)-MOGS_acum_tapping(i,cont);
       
        cont=1;
        while isnan(TL_acum_tapping(i,cont))
            cont=cont+1;
        end
        Group_TL_acum_aux(i,:)=TL_acum_tapping(i,:)-TL_acum_tapping(i,cont);
       
    %end
    
    cont=1;
    while isnan(MONGS_acum_tapping(i,cont))
        cont=cont+1;
    end
    Group_MONGS_acum_aux(i,:)=MONGS_acum_tapping(i,:)-MONGS_acum_tapping(i,1);
   

end

% a partir del tapping

Results.MOGS_acum=Group_MOGS_acum_aux;
Results.MONGS_acum=Group_MONGS_acum_aux;
Results.TL_acum=Group_TL_acum_aux;

Results.MOGS_acum_tapping_mean_1st=nanmean(Group_MOGS_acum_aux,1);
Results.MONGS_acum_tapping_mean_1st=nanmean(Group_MONGS_acum_aux,1);
Results.TL_acum_tapping_mean_1st=nanmean(Group_TL_acum_aux,1);


%% MICRO MICRO acum y no acum MEDIA POR BLOQUE

Group_micro_MOGS_aux=NaN(size(Group_MicroMOGS_media));         
Group_micro_MONGS_aux=NaN(size(Group_MicroMONGS_media));

Group_micro_MOGS_acum_aux=NaN(size(Group_MicroMOGS_acum_media));         
Group_micro_MONGS_acum_aux=NaN(size(Group_MicroMONGS_acum_media));

for i=1:size(Group_MicroMOGS_media)
    cont=1;
    while isnan(Group_MicroMOGS_media(i,cont))
        cont=cont+1;
    end
    if flag_comienzo==0
        Group_micro_MOGS_aux(i,:)= Group_MicroMOGS_media(i,:)-Group_MicroMOGS_media(i,cont);
        Group_micro_MOGS_acum_aux(i,:)= Group_MicroMOGS_acum_media(i,:)-Group_MicroMOGS_acum_media(i,cont);
    else
        delta_MMog= flag_comienzo- Group_MicroMOGS_media(i,cont);
        delta_MMog_acum=flag_comienzo- Group_MicroMOGS_acum_media(i,cont);
        
        Group_micro_MOGS_aux(i,:)= Group_MicroMOGS_media(i,:)+ delta_MMog;
        Group_micro_MOGS_acum_aux(i,:)= Group_MicroMOGS_acum_media(i,:)+delta_MMog_acum;        
    end
    
    cont=1;
    while isnan(Group_MicroMONGS_media(i,cont))
        cont=cont+1;
    end
    if flag_comienzo==0
        Group_micro_MONGS_aux(i,:)= Group_MicroMONGS_media(i,:)-Group_MicroMONGS_media(i,cont);
        Group_micro_MONGS_acum_aux(i,:)= Group_MicroMONGS_acum_media(i,:)-Group_MicroMONGS_acum_media(i,cont);
    else
        delta_MMong=flag_comienzo- Group_MicroMONGS_media(i,cont);
        delta_MMong_acum=flag_comienzo-Group_MicroMONGS_acum_media(i,cont);
        
        Group_micro_MONGS_aux(i,:)= Group_MicroMONGS_media(i,:)+delta_MMong;
        Group_micro_MONGS_acum_aux(i,:)= Group_MicroMONGS_acum_media(i,:)+delta_MMong_acum;
    end
end

Results.Micro_MOGS_media=Group_micro_MOGS_aux;
Results.Micro_MONGS_media=Group_micro_MONGS_aux;

Results.Micro_MOGS_acum_media=Group_micro_MOGS_acum_aux;
Results.Micro_MONGS_acum_media=Group_micro_MONGS_acum_aux;


%media across sujeto
Results.Micro_MOGS_media_mean=nanmean(Group_micro_MOGS_aux,1);
Results.Micro_MONGS_media_mean=nanmean(Group_micro_MONGS_aux,1);

Results.Micro_MOGS_acum_media_mean=nanmean(Group_micro_MOGS_acum_aux,1);
Results.Micro_MONGS_acum_media_mean=nanmean(Group_micro_MONGS_acum_aux,1);

%mediana across sujeto
Results.Micro_MOGS_media_median=nanmedian(Group_micro_MOGS_aux,1);
Results.Micro_MONGS_media_median=nanmedian(Group_micro_MONGS_aux,1);

Results.Micro_MOGS_acum_media_median=nanmedian(Group_micro_MOGS_acum_aux,1);
Results.Micro_MONGS_acum_media_median=nanmedian(Group_micro_MONGS_acum_aux,1);

%std
Results.Micro_MOGS_media_std=nanstd(Group_micro_MOGS_aux,1)/sqrt(N);
Results.Micro_MONGS_media_std=nanstd(Group_micro_MONGS_aux,1)/sqrt(N);

Results.Micro_MOGS_acum_media_std=nanstd(Group_micro_MOGS_acum_aux,1)/sqrt(N);
Results.Micro_MONGS_acum_media_std=nanstd(Group_micro_MONGS_acum_aux,1)/sqrt(N);

% acumulo los no acum con el primer punto cambiado
Micro_MOGS_acum_1st_point=cumsum(Group_micro_MOGS_aux,2,'omitnan');
Micro_MONGS_acum_1st_point=cumsum(Group_micro_MONGS_aux,2,'omitnan');

%media, mediana y desvio
Results.Micro_MOGS_acum_media_1st_point_mean=nanmean(Micro_MOGS_acum_1st_point,1);
Results.Micro_MONGS_acum_media_1st_point_mean=nanmean(Micro_MONGS_acum_1st_point,1);
Results.Micro_MOGS_acum_media_1st_point_median=nanmedian(Micro_MOGS_acum_1st_point,1);
Results.Micro_MONGS_acum_media_1st_point_median=nanmedian(Micro_MONGS_acum_1st_point,1);
Results.Micro_MOGS_acum_media_1st_point_std=nanstd(Micro_MOGS_acum_1st_point,0,1)/sqrt(N);
Results.Micro_MONGS_acum_media_1st_point_std=nanstd(Micro_MONGS_acum_1st_point,0,1)/sqrt(N);

clear Group_micro_MOGS_aux; clear Group_micro_MONGS_aux; clear Group_micro_MOGS_acum_aux; clear Group_micro_MONGS_acum_aux;
clear Group_micro_MOGS_acum_aux; clear Group_micro_MONGS_acum_aux;

%% MICRO MICRO acum y no acum MEDIANA POR BLOQUE

Group_micro_MOGS_aux=NaN(size(Group_MicroMOGS_mediana));         
Group_micro_MONGS_aux=NaN(size(Group_MicroMONGS_mediana));

Group_micro_MOGS_acum_aux=NaN(size(Group_MicroMOGS_acum_mediana));         
Group_micro_MONGS_acum_aux=NaN(size(Group_MicroMONGS_acum_mediana));

for i=1:size(Group_MicroMOGS_mediana)
    cont=1;
    while isnan(Group_MicroMOGS_mediana(i,cont))
        cont=cont+1;
    end
    if flag_comienzo==0
        Group_micro_MOGS_aux(i,:)= Group_MicroMOGS_mediana(i,:)-Group_MicroMOGS_mediana(i,cont);
        Group_micro_MOGS_acum_aux(i,:)= Group_MicroMOGS_acum_mediana(i,:)-Group_MicroMOGS_acum_mediana(i,cont);
    else
        delta_MMog= flag_comienzo- Group_MicroMOGS_mediana(i,cont);
        delta_MMog_acum=flag_comienzo- Group_MicroMOGS_acum_mediana(i,cont);
        
        Group_micro_MOGS_aux(i,:)= Group_MicroMOGS_mediana(i,:)+ delta_MMog;
        Group_micro_MOGS_acum_aux(i,:)= Group_MicroMOGS_acum_mediana(i,:)+delta_MMog_acum;        
    end
    
    cont=1;
    while isnan(Group_MicroMONGS_mediana(i,cont))
        cont=cont+1;
    end
    if flag_comienzo==0
        Group_micro_MONGS_aux(i,:)= Group_MicroMONGS_mediana(i,:)-Group_MicroMONGS_mediana(i,cont);
        Group_micro_MONGS_acum_aux(i,:)= Group_MicroMONGS_acum_mediana(i,:)-Group_MicroMONGS_acum_mediana(i,cont);
    else
        delta_MMong=flag_comienzo- Group_MicroMONGS_mediana(i,cont);
        delta_MMong_acum=flag_comienzo-Group_MicroMONGS_acum_mediana(i,cont);
        
        Group_micro_MONGS_aux(i,:)= Group_MicroMONGS_mediana(i,:)+delta_MMong;
        Group_micro_MONGS_acum_aux(i,:)= Group_MicroMONGS_acum_mediana(i,:)+delta_MMong_acum;
    end
end

Results.Micro_MOGS_mediana=Group_micro_MOGS_aux;
Results.Micro_MONGS_mediana=Group_micro_MONGS_aux;

Results.Micro_MOGS_acum_mediana=Group_micro_MOGS_acum_aux;
Results.Micro_MONGS_acum_mediana=Group_micro_MONGS_acum_aux;


%media across sujeto
Results.Micro_MOGS_mediana_mean=nanmean(Group_micro_MOGS_aux,1);
Results.Micro_MONGS_mediana_mean=nanmean(Group_micro_MONGS_aux,1);

Results.Micro_MOGS_acum_mediana_mean=nanmean(Group_micro_MOGS_acum_aux,1);
Results.Micro_MONGS_acum_mediana_mean=nanmean(Group_micro_MONGS_acum_aux,1);

%mediana across sujeto
Results.Micro_MOGS_mediana_median=nanmedian(Group_micro_MOGS_aux,1);
Results.Micro_MONGS_mediana_median=nanmedian(Group_micro_MONGS_aux,1);

Results.Micro_MOGS_acum_mediana_median=nanmedian(Group_micro_MOGS_acum_aux,1);
Results.Micro_MONGS_acum_mediana_median=nanmedian(Group_micro_MONGS_acum_aux,1);

%std
Results.Micro_MOGS_mediana_std=nanstd(Group_micro_MOGS_aux,1)/sqrt(N);
Results.Micro_MONGS_mediana_std=nanstd(Group_micro_MONGS_aux,1)/sqrt(N);

Results.Micro_MOGS_acum_mediana_std=nanstd(Group_micro_MOGS_acum_aux,1)/sqrt(N);
Results.Micro_MONGS_acum_mediana_std=nanstd(Group_micro_MONGS_acum_aux,1)/sqrt(N);

% acumulo los no acum con el primer punto cambiado
Micro_MOGS_acum_1st_point=cumsum(Group_micro_MOGS_aux,2,'omitnan');
Micro_MONGS_acum_1st_point=cumsum(Group_micro_MONGS_aux,2,'omitnan');

%media, mediana y desvio
Results.Micro_MOGS_acum_mediana_1st_point_mean=nanmean(Micro_MOGS_acum_1st_point,1);
Results.Micro_MONGS_acum_mediana_1st_point_mean=nanmean(Micro_MONGS_acum_1st_point,1);
Results.Micro_MOGS_acum_mediana_1st_point_median=nanmedian(Micro_MOGS_acum_1st_point,1);
Results.Micro_MONGS_acum_mediana_1st_point_median=nanmedian(Micro_MONGS_acum_1st_point,1);
Results.Micro_MOGS_acum_mediana_1st_point_std=nanstd(Micro_MOGS_acum_1st_point,0,1)/sqrt(N);
Results.Micro_MONGS_acum_mediana_1st_point_std=nanstd(Micro_MONGS_acum_1st_point,0,1)/sqrt(N);
