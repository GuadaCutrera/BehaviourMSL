function [Nuevo_iki_visual_group_mean,Nuevo_IKI_visual_group]=PlotInteractivo(SUJETOS,Group_Parameters,Group_Results,path)

% Imprimo a los sujetos
%H_Grafico=IKI_print(Group_Parameters.speed_group,length(SUJETOS));
H_Grafico=IKI_print(Group_Parameters.speed_visual,length(SUJETOS));
% Imprimo la media ya calculada
durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
durRest=300;
contBlock=0;

for j=1:durBlock:length(Group_Results.speed_visual_mean)
   %plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,Group_Results.iki_visual_group_mean(j:j+(durBlock-1)),'k')
  plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,Group_Results.speed_visual_mean(j:j+(durBlock-1)),'k')
    hold on;
    contBlock=contBlock+1;
end
%saveas(gcf,[path 'CurvaCompleta.' 'fig']);


contBlock=0;
for i=1:size(H_Grafico,1)
    for j=1:size(H_Grafico,2)
        Nuevo_IKI_visual_group(i,(j-1)*durBlock+1:j*durBlock)=get(H_Grafico(i,j),'YData');
        contBlock=contBlock+1;
    end
end


%calculo media 
Nuevo_iki_visual_group_mean = nanmean(Nuevo_IKI_visual_group,1); 

H_Grafico=IKI_print(Nuevo_IKI_visual_group,length(SUJETOS));

% Imprimo la media ya calculada
durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
durRest=300;
contBlock=0;

for j=1:durBlock:length(Nuevo_iki_visual_group_mean)
    plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,Nuevo_iki_visual_group_mean(j:j+(durBlock-1)),'k')
    hold on;
    contBlock=contBlock+1;
end

%saveas(gcf,[path 'CurvaCompleta_interactivo.' 'fig']);