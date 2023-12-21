function [Nuevo_iki_visual_group_mean,Nuevo_IKI_visual_group]=PlotInteractivo(iki_visual_group,iki_visual_group_mean,mad_group,path)

if nargin < 4
    flag_mad=0;
else
    flag_mad=1;
end

% Imprimo a los sujetos
H_Grafico=IKI_print(iki_visual_group,size(iki_visual_group,1));
set(gcf,'Position',get(0,'ScreenSize'));
% Imprimo la media ya calculada
% durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
% durRest=300;

durBlock=10;                                                              % cantidad de puntos dentro de un bloque
durRest=3;
contBlock=0;

for j=1:durBlock:length(iki_visual_group_mean)
   plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,iki_visual_group_mean(j:j+(durBlock-1)),'k','Markersize',50)
    hold on;
    if flag_mad==1
            x_vector = [j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,...
                fliplr(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest)];
            x_vector2=[iki_visual_group_mean(1,j:j+(durBlock-1))+mad_group(1,j:j+(durBlock-1)),...
                fliplr(iki_visual_group_mean(1,j:j+(durBlock-1))-mad_group(1,j:j+(durBlock-1)))];
            patch = fill(x_vector, x_vector2, [100 100 100]./255);
            set(patch, 'edgecolor', 'none');
            set(patch, 'FaceAlpha', 0.3);
            hold on;
    end    
    contBlock=contBlock+1;
end
%saveas(gcf,[path 'CurvaCompleta.' 'fig']);

%     xlim([0 37500])
%     xticks([500:1300:39500]);
%     xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
%     '21','22','23','24','25','26','27','28'})

    xlim([0 375])
    xticks([5:13:395]);
    ylim([0 3])
    xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28'})

% contBlock=0;
% for i=1:size(H_Grafico,1)
%     for j=1:size(H_Grafico,2)
%         Nuevo_IKI_visual_group(i,(j-1)*durBlock+1:j*durBlock)=get(H_Grafico(i,j),'YData');
%         contBlock=contBlock+1;
%     end
% end
% 
% 
% %calculo media 
% Nuevo_iki_visual_group_mean = nanmean(Nuevo_IKI_visual_group,1); 
% 
% H_Grafico=IKI_print(Nuevo_IKI_visual_group,length(SUJETOS));
% 
% % Imprimo la media ya calculada
% durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
% durRest=300;
% contBlock=0;
% 
% for j=1:durBlock:length(Nuevo_iki_visual_group_mean)
%     plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,Nuevo_iki_visual_group_mean(j:j+(durBlock-1)),'k')
%     hold on;
%     contBlock=contBlock+1;
% end

%saveas(gcf,[path 'CurvaCompleta_interactivo.' 'fig']);