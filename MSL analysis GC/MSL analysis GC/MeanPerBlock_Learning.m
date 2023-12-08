%Learning Group es una matriz donde cada fila es un sujeto y a lo largo de
%las columnas se encuentra el elarning. 
%Learning_Group_Mean es la media across sujeto de la data original
% Cada 1000 puntos es un bloque.
% GC 13/11/23

function Resultado=MeanPerBlock_Learning(Learning_Group, Learning_Group_Mean)
N=size(Learning_Group,1);
durBlock=1000;
media_por_bloque=NaN(1,29);
mediana_por_bloque=NaN(1,29);;
for i=1:N
    cont=1;
    for j=1:durBlock:size(Learning_Group,2)
        % calculo la media por bloque de cada sujeto
        media_por_bloque(i,cont)=nanmean(Learning_Group(i,j:j+durBlock-1));
        %calculo la mediana por bloque de cada sujeto
        mediana_por_bloque(i,cont)=nanmedian(Learning_Group(i,j:j+durBlock-1));
        cont=cont+1;
    end
end
clear i; clear j; clear cont;

%matrices con las medias/medianas de cada sujeto
Resultado.media_por_bloque=media_por_bloque;
Resultado.mediana_por_bloque=mediana_por_bloque;

% calculo la media por bloque y hago la media across
Resultado.Media_Bloque_Media_Sujeto=nanmean(media_por_bloque,1);
% calculo la media por bloque y hago la mediana across
Resultado.Media_Bloque_Mediana_Sujeto=nanmedian(media_por_bloque,1);
% calculo la mediana por bloque y hago la media across
Resultado.Mediana_Bloque_Media_Sujeto=nanmean(mediana_por_bloque,1);
% calculo la mediana por bloque y hago la mediana across
Resultado.Mediana_Bloque_Mediana_Sujeto=nanmedian(mediana_por_bloque,1);
% calculo la media por bloque STD
Resultado.Media_Bloque_std=nanstd(media_por_bloque,1)/sqrt(N);
% calculo la mediana por bloque STD
Resultado.Mediana_Bloque_std=nanstd(mediana_por_bloque,1)/sqrt(N);



cont=1;
for i=1:durBlock:size(Learning_Group_Mean,2)
    %calculo la media de la media across
    Resultado.Media_de_la_media(cont)=nanmean(Learning_Group_Mean(i:i+durBlock-1));
    %calculo la mediana de la media across
    Resultado.Mediana_de_la_media(cont)=nanmedian(Learning_Group_Mean(i:i+durBlock-1));

    %calculo el std de la media across
    Resultado.std_de_la_media(cont)=nanstd(Learning_Group_Mean(i:i+durBlock-1))/sqrt(N);

    cont=cont+1;
end

%figure;
cont=1;
for k=500:1300:39500
    if cont<= 29
    plot(k,Resultado.Media_Bloque_Media_Sujeto(cont),'r.','Markersize',15)
    hold on;
    plot(k,Resultado.Media_Bloque_Mediana_Sujeto(cont),'b.','Markersize',15)
    hold on;
    plot(k,Resultado.Mediana_Bloque_Media_Sujeto(cont),'m.','Markersize',15)
    hold on;
    plot(k,Resultado.Mediana_Bloque_Mediana_Sujeto(cont),'g.','Markersize',15)
    hold on;
    end
    plot(k,Resultado.Media_de_la_media(cont),'k.','Markersize',15);
    hold on;
    plot(k,Resultado.Mediana_de_la_media(cont),'c.','Markersize',15);
    cont=cont+1;
end
