function plot_intervalos(int12,int23,int34,int45,int12_mean,int23_mean,int34_mean,int45_mean,...
    int12_std,int23_std,int34_std,int45_std,titulo)

figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)
set(gcf,'Position',get(0,'ScreenSize'));

for i=1:size(int12,1) %sujetos
    subplot(2,2,1)
    plot(int12(i,:),'b.','MarkerSize', 15); hold on;
    subplot(2,2,2)
    plot(int23(i,:),'r.','MarkerSize', 15); hold on;
    subplot(2,2,3)
    plot(int34(i,:),'g.','MarkerSize', 15); hold on;
    subplot(2,2,4)
    plot(int45(i,:),'m.','MarkerSize', 15); hold on;
end

subplot(2,2,1)
plot(int12_mean,'k.','MarkerSize', 15)
title('Int 12 - "41"')
subplot(2,2,2)
plot(int23_mean,'k.','MarkerSize', 15)
title('Int 23 - "13"')
subplot(2,2,3)
plot(int34_mean,'k.','MarkerSize', 15)
title('Int 34 - "32"')
subplot(2,2,4)
plot(int45_mean,'k.','MarkerSize', 15)
title('Int 45 - "24"')

figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle(titulo)
set(gcf,'Position',get(0,'ScreenSize'));

% TRANSICION 12
    %error estandar
    x_vector = [1:length(int12_mean), fliplr(1:length(int12_mean))];
    patch = fill(x_vector, [int12_mean + int12_std , fliplr(int12_mean - int12_std)], [128 193 219]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(int12_mean,'b','LineWidth',0.5);
    
% TRANSICION 23
    %error estandar
    x_vector = [1:length(int23_mean), fliplr(1:length(int23_mean))];
    patch = fill(x_vector, [int23_mean + int23_std , fliplr(int23_mean - int23_std)], [243 169 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(int23_mean,'r','LineWidth',0.5);
    
% TRANSICION 34
    %error estandar
    x_vector = [1:length(int34_mean), fliplr(1:length(int34_mean))];
    patch = fill(x_vector, [int34_mean + int34_std , fliplr(int34_mean - int34_std)], [169 243 114]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(int34_mean,'g','LineWidth',0.5);
    
% TRANSICION 45
    %error estandar
    x_vector = [1:length(int45_mean), fliplr(1:length(int45_mean))];
    patch = fill(x_vector, [int45_mean + int45_std , fliplr(int45_mean - int45_std)], [[219 123 128]]./255);
    set(patch, 'edgecolor', 'none');
    set(patch, 'FaceAlpha', 0.3);
    hold on;
    %media
    plot(int45_mean,'m','LineWidth',0.5);
  
 xlabel('Blocks')
 ylabel('Trans (s)')
 legend('','Int12','','Int23','','Int34','','Int45')