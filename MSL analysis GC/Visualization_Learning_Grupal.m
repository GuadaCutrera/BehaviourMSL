%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                         FIGURE                                      %%%
%%% Learning Curve and Tapping Speed, visualization by bonstrup         %%%
%%%                                                                     %%%
%%%                     GC 23/6/2023                                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Visualization_Learning_Grupal(iki_mean,iki_std,variable,titulo)
durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
durRest=300;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)

figure; set(gcf,'Color','white'); box OFF; hold on; 

%barra=max(iki_mean(:)+0.1);
contBlock=0;
for i=1:durBlock:length(iki_mean)
    %error estandar
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[iki_mean(i:i+(durBlock-1))+iki_std(i:i+(durBlock-1)),...
        fliplr(iki_mean(i:i+(durBlock-1))-iki_std(i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;

    %media
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,iki_mean(i:i+(durBlock-1)),'k','LineWidth',0.5);
    hold on;
    contBlock=contBlock+1;

    %barras de rest
    %bar(i+(durBlock-1)+0.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    %hold on;
end
xlabel('Blocks');
%ylim([0 2.2])
if strcmp(variable,'speed')
    ylabel('Tapping Speed (keypresses/s)')
else 
    ylabel('Interkey Interval (s)')
end
sgtitle(titulo);
%xticks(1:36);