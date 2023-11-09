function MicroGainsCompare(MOGS,MONGS, TL,titulo,flagIntro,flag1st,MOGS_std,MONGS_std, TL_std)

figure, sgtitle(['Compare Micro Gains - ' titulo])
set(gcf,'Position',get(0,'ScreenSize'));
if flagIntro==0
    x_lim=[0 36];
else
    x_lim=[0 37];
end
switch flag1st
    case ''
        y_lim=[-1 1];
        line=0;
    case '0'
        
        y_lim=[-1 1];
        %y_lim=[-2.1 0.1];
        line=0;
    case '1'
        y_lim=[0 2];
        line=1;
    case '2'
        y_lim=[1 3];
        line=2;
end

%% MOGS
subplot(1,3,1)

x_vector = [1:length(MOGS(1,:)), fliplr(1:length(MOGS(1,:)))];
patch = fill(x_vector, [MOGS(1,:) + MOGS_std(1,:) , fliplr(MOGS(1,:) - MOGS_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MOGS(1,:),'r'); %wo ITI
hold on;

patch = fill(x_vector, [MOGS(2,:) + MOGS_std(2,:) , fliplr(MOGS(2,:) - MOGS_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MOGS(2,:),'b'); %w ITI 1s
hold on;
if size(MOGS,1)>2
    plot(MOGS(3,:),'k'); %w ITI 1.5s
end
yline(line)
ylim(y_lim)
xlim(x_lim)
ylabel('MOGS - acum')
xlabel('Blocks')

%% MONGS

subplot(1,3,2)

x_vector = [1:length(MONGS(1,:)), fliplr(1:length(MONGS(1,:)))];
patch = fill(x_vector, [MONGS(1,:) + MONGS_std(1,:) , fliplr(MONGS(1,:) - MONGS_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MONGS(1,:),'r'); %wo ITI
hold on;

patch = fill(x_vector, [MONGS(2,:) + MONGS_std(2,:) , fliplr(MONGS(2,:) - MONGS_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MONGS(2,:),'b'); %w ITI 1s
hold on;
if size(MONGS,1)>2
    plot(MONGS(3,:),'k'); %w ITI 1.5s
end
yline(line)
ylim(y_lim)
xlim(x_lim)
ylabel('MONGS - acum')
xlabel('Blocks')

%% TOTAL LEARNING

subplot(1,3,3)

x_vector = [1:length(TL(1,:)), fliplr(1:length(TL(1,:)))];
patch = fill(x_vector, [TL(1,:) + TL_std(1,:) , fliplr(TL(1,:) - TL_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(TL(1,:),'r'); %wo ITI
hold on;

patch = fill(x_vector, [TL(2,:) + TL_std(2,:) , fliplr(TL(2,:) - TL_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
plot(TL(2,:),'b'); %w ITI 1s
hold on;
if size(TL,1)>2
    plot(TL(3,:),'k'); %w ITI 1.5s
end
yline(line)
ylim(y_lim)
xlim(x_lim)

legend('Without ITI','','ITI 1s','')
%legend('Flor', 'Guille','Guada Time')
%legend('Media','Mediana')
%legend('Grupo Completo', '15 Sujetos' , 'Completo sin punto')
ylabel('Total Learning - acum')
xlabel('Blocks')