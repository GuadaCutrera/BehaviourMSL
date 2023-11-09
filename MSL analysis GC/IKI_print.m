%%% Esta función le pasas una matriz con la curva de learning de todos los
%%% sujetos (un sujeto por fila) y la imprime en distintos colores. Se
%%% grafican todos los sujetos en un mismo plot. Esto sirve pata poder
%%% identificar outliers (o diferencias entre bloques). A esta función se
%%% la llama desde Plot_Interactivo para poder eliminar algun punto que no este bueno.  

function H=IKI_print(iki_visual_group,N)
figure;

durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
durRest=300;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)
color=['m','r','b','m','g','c','y','r','b','m','g','c','y','r','b','m','g','c','y','r','b','m','g','c','y','r','b','m','g','c','y','g'];

%H=[];
for i=1:N
    
    contBlock=0;
    for j=1:durBlock:length(iki_visual_group(i,:))
    H(i,contBlock+1)=plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,iki_visual_group(i,j:j+(durBlock-1)),color(i));
    hold on;
%     if mod(i,5)==0
%         clf
%     end
    contBlock=contBlock+1;
    end
end
%ylim([0 1.5])