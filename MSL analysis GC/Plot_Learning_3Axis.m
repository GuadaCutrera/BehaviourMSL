function Plot_Learning_3Axis(Matriz_speed,Matriz_iki,std_speed,std_iki,flagIntro, flag1st,path)%,Matriz_MOGS,Matriz_MONGS,Matriz_TL, ...
    %Matriz_MicroMOGS,Matriz_MicroMONGS,Matriz_MicroMOGS_acum,Matriz_MicroMONGS_acum)

if nargin<5
    std_speed=[];
    std_iki=[];
    flagIntro=''; % si son los bloques de la tarea '0' o con la intro '1'
    flag1st=''; %primer punto original: '', primer punto en '0', '1', '2'. 
end
%% Plot Tapping Speed
figure; sgtitle(['Tapping Speed Comparison'])
set(gcf,'Position',get(0,'ScreenSize'));

% durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
% durRest=300;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)

durBlock=10;                                                              % cantidad de puntos dentro de un bloque
durRest=3;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)

contBlock=0;

ax=gca;
yyaxis left;
for i=1:durBlock:size(Matriz_speed,2)
    
    %std
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[Matriz_speed(1,i:i+(durBlock-1))+std_speed(1,i:i+(durBlock-1)),...
        fliplr(Matriz_speed(1,i:i+(durBlock-1))-std_speed(1,i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [219 123 128]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;

    %mean
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_speed(1,i:i+(durBlock-1)),'r-'); 
    hold on;
    contBlock=contBlock+1;
end
ylabel('Without ITI - time (s)')
ax.YColor = 'r';

switch flag1st
    case '' %no se modifica el primer punto
        ylim([1 4.5]) % task wo intro
    case '0'
        %ylim([-0.2 1.8])
        ylim([-0.5 3])
    case '1'
        if flagIntro==0
            ylim([0.8 2]) %max =2 para cuando sacamos la intro del sujeto conflictivo, sino max=2.9
        else 
            ylim([0.8 2.5])
        end
    case '2'
        ylim([1.9 2.2]) 
    case 'Norm'
        ylim([0 1])
end 
    
contBlock=0;

yyaxis right;
for i=1:durBlock:size(Matriz_speed,2)
    
    %std
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[Matriz_speed(2,i:i+(durBlock-1))+std_speed(2,i:i+(durBlock-1)),...
        fliplr(Matriz_speed(2,i:i+(durBlock-1))-std_speed(2,i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;

    %mean
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_speed(2,i:i+(durBlock-1)),'b-'); 
    hold on;
    contBlock=contBlock+1;
end
ylabel('With ITI - time (s)')
ax.YColor = 'b';
switch flag1st
    case ''
        ylim([1 4.5]) % task wo intro
    case '0'
        %ylim([-0.2 1.8])
        ylim([-0.5 3])
    case '1'
        if flagIntro==0
        ylim([0.8 2]) %max =2 para cuando sacamos la intro del sujeto conflictivo, sino max=2.9
        else 
            ylim([0.8 2.5])
        end
    case '2'
        ylim([1.9 2.2]) 
    case 'Norm'
        ylim([0 1])
end
xlabel('Blocks')
%legend('Without ITI', 'With ITI 1s')
if flagIntro==0
    xticks([500:1300:46500]);
    xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36'})
else
%     xticks([500:1300:47500]);
%     xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
%     '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36'})
    xlim([0 375])
    xticks([5:13:395]);
    xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28'})
end
if flagIntro==0
    titulo=' sin intro ';
else
    titulo=' con intro ';
end
titulo=[titulo flag1st];
saveas(gcf,[path ['TS_3axis' titulo '.'] 'fig']);
saveas(gcf,[path ['TS_3axis' titulo '.'] 'png']);

%% PLOT IKI_TRIAL

figure; sgtitle(['Interkey Interval Comparison'])
set(gcf,'Position',get(0,'ScreenSize'));
contBlock=0;

ax=gca;
yyaxis left;
for i=1:durBlock:size(Matriz_iki,2)

    %std
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[Matriz_iki(1,i:i+(durBlock-1))+std_iki(1,i:i+(durBlock-1)),...
        fliplr(Matriz_iki(1,i:i+(durBlock-1))-std_iki(1,i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [219 123 128]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    
    %mean
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_iki(1,i:i+(durBlock-1)),'r-'); 
    hold on;
    contBlock=contBlock+1;
end
ylabel('Without ITI - time (s)')
ax.YColor = 'r';

switch flag1st
    case '' %no se modifica el primer punto
        if flagIntro==0
            ylim([0.2 0.8]) % task wo intro
        else
            ylim([0.2 1]) % w intro
        end
    case '0'
        %ylim([-0.5 0.1])
        ylim([-0.3 0.5])
    case '1'
        if flagIntro==0
            ylim([0.5 1.1]) 
        else 
            ylim([0.5 1.1])
        end
    case '2'
        ylim([1.5 2.2]) 
    case 'Norm'
        ylim([0 1])
end 

contBlock=0;

yyaxis right;
for i=1:durBlock:size(Matriz_iki,2)

     %std
    x_vector = [i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest, fliplr(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest)];
    x_vector2=[Matriz_iki(2,i:i+(durBlock-1))+std_iki(2,i:i+(durBlock-1)),...
        fliplr(Matriz_iki(2,i:i+(durBlock-1))-std_iki(2,i:i+(durBlock-1)))];
    patch = fill(x_vector, x_vector2, [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    
    %mean
    plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,Matriz_iki(2,i:i+(durBlock-1)),'b-'); 
    hold on;
    contBlock=contBlock+1;
end
ylabel('With ITI - time (s)')
ax.YColor = 'b';
switch flag1st
    case '' %no se modifica el primer punto
        if flagIntro==0
            ylim([0.2 0.8]) % task wo intro
        else
            ylim([0.2 1]) % w intro
        end
    case '0'
        %ylim([-0.5 0.1])
        ylim([-0.3 0.5])
    case '1'
        if flagIntro==0
            ylim([0.5 1.1]) 
        else 
            ylim([0.5 1.1])
        end
    case '2'
        ylim([1.5 2.2]) 
    case 'Norm'
        ylim([0 1])
end

xlabel('Blocks')
if flagIntro==0
    xticks([500:1300:46500]);
    xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36'})
else
%     xticks([500:1300:47500]);
%     xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
%     '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36'})
    xlim([0 375])
    xticks([5:13:395]);
    xticklabels({'Intro','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28'})
end
hold on;
saveas(gcf,[path ['IKI_3axis' titulo '.'] 'fig']);
saveas(gcf,[path ['IKI_3axis' titulo '.'] 'png']);


% Invierto la curva de IKI para ver si se reproduce la de tapping speed
sgtitle(['Interkey Interval Inverted Comparison'])
ax.YDir = 'reverse';
yyaxis left;
ax.YDir = 'reverse';
saveas(gcf,[path ['IKI_inverted_3axis' titulo '.'] 'fig']);
saveas(gcf,[path ['IKI_inverted_3axis' titulo '.'] 'png']);

 %% PLOT MICRO GAINS
% figure; sgtitle(['Micro Gains Comparison'])
% set(gcf,'Position',get(0,'ScreenSize'));
% 
% % MOGS
% subplot(1,3,1)
% title('MOGS - acum')
% ax=gca;
% yyaxis left;
% plot(Matriz_MOGS(1,:),'r.')
% ax.YColor = 'r';
% ylabel('Without ITI')
% ylim([-1 1])
% yline(0)
% 
% yyaxis right;
% plot(Matriz_MOGS(2,:),'b.')
% ax.YColor = 'b';
% ylabel('With ITI')
% ylim([-1 1])
% yline(0)
% 
% %MONGS
% subplot(1,3,2)
% title('MONGS - acum')
% ax=gca;
% yyaxis left;
% plot(Matriz_MONGS(1,:),'r.')
% ax.YColor = 'r';
% ylabel('Without ITI')
% ylim([-1 1])
% yline(0)
% 
% yyaxis right;
% plot(Matriz_MONGS(2,:),'b.')
% ax.YColor = 'b';
% ylabel('With ITI')
% ylim([-1 1])
% yline(0)
% 
% %TL
% subplot(1,3,3)
% title('Total Learning - acum')
% ax=gca;
% yyaxis left;
% plot(Matriz_TL(1,:),'r.')
% ax.YColor = 'r';
% ylabel('Without ITI')
% ylim([-1 1])
% yline(0)
% 
% yyaxis right;
% plot(Matriz_TL(2,:),'b.')
% ax.YColor = 'b';
% ylabel('With ITI')
% ylim([-1 1])
% yline(0)
% 
% 
% %% PLOT MICRO MICRO GAINS
% figure; sgtitle(['Micro Micro Gains Comparison'])
% set(gcf,'Position',get(0,'ScreenSize'));
% 
% %MICRO MOGS ---------------------------------------------------------
% subplot(2,2,1)
% title('Micro MOGS')
% ax=gca;
% yyaxis left
% plot(Matriz_MicroMOGS(1,:),'r'); %wo ITI
% ax.YColor = 'r';
% ylabel('Without ITI')
% yline(0)
% ylim([-0.2 0.2])
% 
% yyaxis right
% plot(Matriz_MicroMOGS(2,:),'b'); %w ITI 1s
% ax.YColor='b';
% ylabel('With ITI')
% 
% xlabel('Blocks')
% yline(0)
% ylim([-0.2 0.2])
% 
% 
% %MICRO MONGS --------------------------------------------------------
% subplot(2,2,2)
% title('Micro MONGS')
% ax=gca;
% yyaxis left
% plot(Matriz_MicroMONGS(1,:),'r'); %wo ITI
% ax.YColor = 'r';
% ylabel('Without ITI')
% yline(0)
% ylim([-0.2 0.2])
% 
% yyaxis right
% plot(Matriz_MicroMONGS(2,:),'b'); %w ITI 1s
% ax.YColor = 'b';
% ylabel('With ITI')
% 
% xlabel('Blocks')
% yline(0)
% ylim([-0.2 0.2])
% 
% 
% %MICRO MOGS ACUM ---------------------------------------------------------
% subplot(2,2,3)
% title('Micro MOGS - acum')
% ax=gca;
% yyaxis left
% plot(Matriz_MicroMOGS_acum(1,:),'r.'); %wo ITI
% ax.YColor = 'r';
% ylabel('Without ITI')
% yline(0)
% ylim([-1 1])
% 
% yyaxis right
% plot(Matriz_MicroMOGS_acum(2,:),'b.'); %w ITI 1s
% ax.YColor = 'b';
% ylabel('With ITI')
% 
% xlabel('Blocks')
% yline(0)
% ylim([-1 1])
% 
% 
% %MICRO MONGS ACUM --------------------------------------------------------
% subplot(2,2,4)
% title('Micro MONGS - acum')
% ax=gca;
% yyaxis left
% plot(Matriz_MicroMONGS_acum(1,:),'r.'); %wo ITI
% ax.YColor = 'r';
% ylabel('Without ITI')
% yline(0)
% ylim([-1 1])
% 
% yyaxis right
% plot(Matriz_MicroMONGS_acum(2,:),'b.'); %w ITI 1s
% ax.YColor = 'b';
% ylabel('With ITI')
% xlabel('Blocks')
% yline(0)
% ylim([-1 1])
