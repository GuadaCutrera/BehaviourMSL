function tapping_speed(speed_mean,speed_std,Group_Parameters,paradigm_flag,titulo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Tapping Speed: IKI_trial/1000.                                      %%%
%%% Is the average of the time intervals (in ms) between adjacent keypresses
%%% within correct sequences divided by 1000 (keypresses/s).            %%%
%%%                     GC 11/6/2023                                    %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo);


% speed_mean=iki_trial_mean/1000;
% speed_std=iki_trial_std/1000;

% speed_mean=1./iki_trial_mean;
% speed_std=iki_trial_std;

barra=max(speed_mean(:)+0.1);

for i=1:Group_Parameters.cant_SeqBlock:length(speed_mean)
    %error estandar
    x_vector = [i:i+(Group_Parameters.cant_SeqBlock-1), fliplr(i:i+(Group_Parameters.cant_SeqBlock-1))];
    x_vector2=[speed_mean(i:i+(Group_Parameters.cant_SeqBlock-1))+speed_std(i:i+(Group_Parameters.cant_SeqBlock-1)),fliplr(speed_mean(i:i+(Group_Parameters.cant_SeqBlock-1))-speed_std(i:i+(Group_Parameters.cant_SeqBlock-1)))];
   
    if  strcmp(paradigm_flag,'tiempo')==1
        %este contador me va a permitir no graficar los errores de los NaNs y poder cerrar los patch para rellenarlos
        cont=1;
        while cont<=length(x_vector2) && ~isnan(x_vector2(cont)) 
            cont=cont+1; 
        end
        cont=cont-1;
        x_vector2(isnan(x_vector2))=[];
        if cont >= Group_Parameters.cant_SeqBlock
            cont=cont/2;
        end
        x_vector=[x_vector(1:cont) x_vector((end-cont+1):end)];
    end
    
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;

    %media
    plot(i:i+(Group_Parameters.cant_SeqBlock-1),speed_mean(i:i+(Group_Parameters.cant_SeqBlock-1)),'k','LineWidth',0.5);
    hold on;

    %barras de rest
    bar(i+(Group_Parameters.cant_SeqBlock-1)+0.5,barra,1,'FaceColor',[.7 .7 .7],'EdgeColor',[.7 .7 .7]);
    hold on;
end

    xlabel('Blocks','FontName','Arial','FontSize',12)
    ylabel('Tapping Speed','FontName','Arial','FontSize',12);
    
     %GC 18/1/23
%     if Group_Parameters.flag_norm==0
%         %misma escala q crudo
%         ylim([min(speed_mean-0.1) max(speed_mean+0.1)])
%     else
%         if strcmp(Group_Parameters.flag_tipo_norm,'Z')
%             ylim([-3 3])
%         else %norm 01
%             ylim([0 1])
%         end
%     end
%     xlim([0 length(speed_mean)+1]);

end