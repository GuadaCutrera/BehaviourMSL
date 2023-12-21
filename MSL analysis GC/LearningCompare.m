function LearningCompare(Matriz_Grupos,Matriz_std,flag_cantidad)

% durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
% durRest=300;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)
durBlock=10;                                                              % cantidad de puntos dentro de un bloque
durRest=3;     
contBlock=0;

figure; sgtitle('Compare Learning Curve')
set(gcf,'Position',get(0,'ScreenSize'));

for i=1:durBlock:size(Matriz_Grupos,2)
    %error estandar
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    patch = fill(x_vector, [Matriz_Grupos(1,i:i+(durBlock-1)) + Matriz_std(1,i:i+(durBlock-1)) , fliplr(Matriz_Grupos(1,i:i+(durBlock-1)) - Matriz_std(1,i:i+(durBlock-1)))], [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_Grupos(1,i:i+(durBlock-1)),'b'); 
    hold on;
    %error estandar
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    patch = fill(x_vector, [Matriz_Grupos(2,i:i+(durBlock-1)) + Matriz_std(2,i:i+(durBlock-1)) , fliplr(Matriz_Grupos(2,i:i+(durBlock-1)) - Matriz_std(2,i:i+(durBlock-1)))], [243 169 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_Grupos(2,i:i+(durBlock-1)),'r');
    hold on;
    if flag_cantidad>2
         %error estandar
        x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
        patch = fill(x_vector, [Matriz_Grupos(3,i:i+(durBlock-1)) + Matriz_std(3,i:i+(durBlock-1)) , fliplr(Matriz_Grupos(3,i:i+(durBlock-1)) - Matriz_std(3,i:i+(durBlock-1)))], [169 243 114]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 0.3);
        hold on;
        %media
        plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_Grupos(3,i:i+(durBlock-1)),'g');
    end
    if flag_cantidad==4
        %error estandar
        x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
        patch = fill(x_vector, [Matriz_Grupos(4,i:i+(durBlock-1)) + Matriz_std(4,i:i+(durBlock-1)) , fliplr(Matriz_Grupos(4,i:i+(durBlock-1)) - Matriz_std(4,i:i+(durBlock-1)))], [[219 123 128]]./255);
        set(patch, 'edgecolor', 'none');
        set(patch, 'FaceAlpha', 0.3);
        hold on;
        %media
        plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_Grupos(4,i:i+(durBlock-1)),'m');
    end
    contBlock=contBlock+1;
end

%ylim([0.25 0.75])

if flag_cantidad==3
    %legend('Without ITI', 'With ITI 1s', 'With ITI 1.5s');
    %legend('Guille 2021', 'Flor','Guada time', 'Guada key')
    legend('Grupo Completo', '15 Sujetos' , 'Completo sin punto')
elseif flag_cantidad==4
    %legend('guille40','guille2021','guille2022','flor')
    %legend('Guille 2021', 'Flor','Guada time', 'Guada key')
    legend('','Int12','', 'Int23','','Int34','', 'Int45')
else
    %legend('With ITI 1.5s Key', 'With ITI 1.5s Time')
    legend('Without ITI', 'With ITI 1s')
    %legend('completo', 'sin sujeto')
end
xlim([0 375])
%xticks([5:13:475]);
xticks([5:13:395]); %hasta bloque 28
xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36'})


