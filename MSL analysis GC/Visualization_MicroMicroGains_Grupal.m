function Visualization_MicroMicroGains_Grupal(MicroMOGS_mean,MicroMONGS_mean,MicroMOGS_std,MicroMONGS_std,titulo)

durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
durRest=300;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)

figure; set(gcf,'Color','white'); box OFF; hold on; 

%% MICRO MOGS

subplot(2,1,1)
contBlock=0;
for i=1:durBlock:length(MicroMOGS_mean)
    %error estandar
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[MicroMOGS_mean(i:i+(durBlock-1))+MicroMOGS_std(i:i+(durBlock-1)),...
        fliplr(MicroMOGS_mean(i:i+(durBlock-1))-MicroMOGS_std(i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;

    %media
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,MicroMOGS_mean(i:i+(durBlock-1)),'k','LineWidth',0.5);
    hold on;
    contBlock=contBlock+1;

end
xlabel('Blocks');
ylabel('MicroMOGS');
yline(0);


%% MICRO MONGS

subplot(2,1,2)
contBlock=0;
for i=1:durBlock:length(MicroMONGS_mean)
    %error estandar
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[MicroMONGS_mean(i:i+(durBlock-1))+MicroMONGS_std(i:i+(durBlock-1)),...
        fliplr(MicroMONGS_mean(i:i+(durBlock-1))-MicroMONGS_std(i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 1);
    hold on;

    %media
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,MicroMONGS_mean(i:i+(durBlock-1)),'k','LineWidth',0.5);
    hold on;
    contBlock=contBlock+1;

end
xlabel('Blocks');
ylabel('MicroMONGS');
yline(0);
sgtitle(titulo);