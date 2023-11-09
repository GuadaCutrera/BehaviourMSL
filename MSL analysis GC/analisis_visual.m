%%% Esta función utiliza la curva de learning conla visualización de
%%% Bonstrup. Recibe IKI_sujetos como una matriz donde cada fila representa
%%% cada sujeto y a lo largo de la misma se encuentra un vector con su
%%% curva de learning (1000 puntos por bloque). Devuelve una matriz más
%%% pequeña de la curva de learning donde se puede ver cada representado el
%%% bloque elegido (en este caso es el bloque 6 porque va desde 5001 a
%%% 6000) pero compactado. 

function aux=analisis_visual(iki_sujetos)

aux=[];
cont=1;
for i=5001:6000 %size(iki_sujetos,2) %analizo cada columna
    if i==5001
        aux(:,cont)=iki_sujetos(:,i);
        cont=cont+1;
    else
        if sum(iki_sujetos(:,i)~= aux(:,cont-1))>0
            aux(:,cont)=iki_sujetos(:,i);
            cont=cont+1;
        end
    end
end