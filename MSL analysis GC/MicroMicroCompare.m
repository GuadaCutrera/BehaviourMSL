function MicroMicroCompare(MicroMOGS_grupos, MicroMONGS_grupos,MicroMOGS_acum_grupos,MicroMONGS_acum_grupos,titulo, ...
    MicroMOGS_std,MicroMONGS_std,MicroMOGS_acum_std,MicroMONGS_acum_std,flagIntro,flag1st,MicroMOGS_acum_grupos_recalc,...
    MicroMONGS_acum_grupos_recalc,MicroMOGS_acum_std_recalc,MicroMONGS_acum_std_recalc)

figure, sgtitle(['Compare Micro Micro - ' titulo])
set(gcf,'Position',get(0,'ScreenSize'));


if flagIntro==0
    x_lim=[0 36];
else
    %x_lim=[0 37];
    x_lim=[0 29];
end
switch flag1st
    case ''
        %y_lim_acum=[-1.5 1.5];
        y_lim_acum=[-3 3];
        %y_lim_no_acum=[-0.2 0.2];
        y_lim_no_acum=[-0.5 0.5]; 
        line=0;
    case '0'
        if nargin ~=11
           y_lim_acum_recalc=[-7 7]; 
        end
        y_lim_acum=[-3 3];
        y_lim_no_acum=[-0.5 0.5];        
        line=0;
        
    case '1'
        y_lim_acum=[-1 2.5];
        y_lim_no_acum=[0.7 1.3];  
        line=1;
    case '2'
        y_lim_acum=[0 3.5];
        y_lim_no_acum=[1.5 2.5];  
        line=2;
end

%MICRO MOGS ---------------------------------------------------------
if nargin ~=11
    subplot(3,2,1)
else
    subplot(2,2,1)
end
x_vector = [1:length(MicroMOGS_grupos(1,:)), fliplr(1:length(MicroMOGS_grupos(1,:)))];
patch = fill(x_vector, [MicroMOGS_grupos(1,:) + MicroMOGS_std(1,:) , fliplr(MicroMOGS_grupos(1,:) - MicroMOGS_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMOGS_grupos(1,:),'r'); %wo ITI
hold on;


patch = fill(x_vector, [MicroMOGS_grupos(2,:) + MicroMOGS_std(2,:) , fliplr(MicroMOGS_grupos(2,:) - MicroMOGS_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMOGS_grupos(2,:),'b'); %w ITI 1s
hold on;

%plot(MicroMOGS_grupos(3,:),'m'); %w ITI 1.5s
ylabel('MicroMOGS')
xlabel('Blocks')
yline(line)
ylim(y_lim_no_acum)
xlim(x_lim)

%MICRO MONGS --------------------------------------------------------
if nargin ~=11
    subplot(3,2,2)
else
    subplot(2,2,2)
end
x_vector = [1:length(MicroMONGS_grupos(1,:)), fliplr(1:length(MicroMONGS_grupos(1,:)))];
patch = fill(x_vector, [MicroMONGS_grupos(1,:) + MicroMONGS_std(1,:) , fliplr(MicroMONGS_grupos(1,:) - MicroMONGS_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMONGS_grupos(1,:),'r'); %wo ITI
hold on;

patch = fill(x_vector, [MicroMONGS_grupos(2,:) + MicroMONGS_std(2,:) , fliplr(MicroMONGS_grupos(2,:) - MicroMONGS_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
plot(MicroMONGS_grupos(2,:),'b'); %w ITI 1s
hold on;

%plot(MicroMONGS_grupos(3,:),'m'); %w ITI 1.5s
ylabel('MicroMONGS')
xlabel('Blocks')
yline(line)
ylim(y_lim_no_acum)
xlim(x_lim)
legend('Without ITI','','ITI 1s','')
%legend('Flor','Guille2021','Guada Time')

%MICRO MOGS ACUM ---------------------------------------------------------
if nargin ~=11
    subplot(3,2,3)
else
    subplot(2,2,3)
end
x_vector = [1:length(MicroMOGS_acum_grupos(1,:)), fliplr(1:length(MicroMOGS_acum_grupos(1,:)))];
patch = fill(x_vector, [MicroMOGS_acum_grupos(1,:) + MicroMOGS_acum_std(1,:) , fliplr(MicroMOGS_acum_grupos(1,:) - MicroMOGS_acum_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMOGS_acum_grupos(1,:),'r.'); %wo ITI
hold on;

patch = fill(x_vector, [MicroMOGS_acum_grupos(2,:) + MicroMOGS_acum_std(2,:) , fliplr(MicroMOGS_acum_grupos(2,:) - MicroMOGS_acum_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMOGS_acum_grupos(2,:),'b.'); %w ITI 1s
hold on;

%plot(MicroMOGS_acum_grupos(3,:),'m.'); %w ITI 1.5s
 ylabel('MicroMOGS - acum')
xlabel('Blocks')
yline(line)
ylim(y_lim_acum)
xlim(x_lim)

%MICRO MONGS ACUM --------------------------------------------------------
if nargin ~=11
    subplot(3,2,4)
else
    subplot(2,2,4)
end
x_vector = [1:length(MicroMONGS_acum_grupos(1,:)), fliplr(1:length(MicroMONGS_acum_grupos(1,:)))];
patch = fill(x_vector, [MicroMONGS_acum_grupos(1,:) + MicroMONGS_acum_std(1,:) , fliplr(MicroMONGS_acum_grupos(1,:) - MicroMONGS_acum_std(1,:))], [219 123 128]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMONGS_acum_grupos(1,:),'r.'); %wo ITI
hold on;


patch = fill(x_vector, [MicroMONGS_acum_grupos(2,:) + MicroMONGS_acum_std(2,:) , fliplr(MicroMONGS_acum_grupos(2,:) - MicroMONGS_acum_std(2,:))], [128 193 219]./255);
set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
hold on;
plot(MicroMONGS_acum_grupos(2,:),'b.'); %w ITI 1s
hold on;
%plot(MicroMONGS_acum_grupos(3,:),'m.'); %w ITI 1.5s
ylabel('MicroMONGS - acum')
xlabel('Blocks')
yline(line)
ylim(y_lim_acum)
xlim(x_lim)

%MICRO MOGS ACUM RECALC ---------------------------------------------------------
if nargin ~=11
    subplot(3,2,5)

    x_vector = [1:length(MicroMOGS_acum_grupos_recalc(1,:)), fliplr(1:length(MicroMOGS_acum_grupos_recalc(1,:)))];
    patch = fill(x_vector, [MicroMOGS_acum_grupos_recalc(1,:) + MicroMOGS_acum_std_recalc(1,:) , fliplr(MicroMOGS_acum_grupos_recalc(1,:) - MicroMOGS_acum_std_recalc(1,:))], [219 123 128]./255);
    set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
    hold on;
    plot(MicroMOGS_acum_grupos_recalc(1,:),'r.'); %wo ITI
    hold on;

    patch = fill(x_vector, [MicroMOGS_acum_grupos_recalc(2,:) + MicroMOGS_acum_std_recalc(2,:) , fliplr(MicroMOGS_acum_grupos_recalc(2,:) - MicroMOGS_acum_std_recalc(2,:))], [128 193 219]./255);
    set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
    hold on;
    plot(MicroMOGS_acum_grupos_recalc(2,:),'b.'); %w ITI 1s
    hold on;

    ylabel('MicroMOGS - acum - recalc')
    xlabel('Blocks')
    yline(line)
    ylim(y_lim_acum_recalc)
    xlim(x_lim)

%MICRO MONGS ACUM RECALC --------------------------------------------------------

    subplot(3,2,6)

    x_vector = [1:length(MicroMONGS_acum_grupos_recalc(1,:)), fliplr(1:length(MicroMONGS_acum_grupos_recalc(1,:)))];
    patch = fill(x_vector, [MicroMONGS_acum_grupos_recalc(1,:) + MicroMONGS_acum_std_recalc(1,:) , fliplr(MicroMONGS_acum_grupos_recalc(1,:) - MicroMONGS_acum_std_recalc(1,:))], [219 123 128]./255);
    set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
    hold on;
    plot(MicroMONGS_acum_grupos_recalc(1,:),'r.'); %wo ITI
    hold on;


    patch = fill(x_vector, [MicroMONGS_acum_grupos_recalc(2,:) + MicroMONGS_acum_std_recalc(2,:) , fliplr(MicroMONGS_acum_grupos_recalc(2,:) - MicroMONGS_acum_std_recalc(2,:))], [128 193 219]./255);
    set(patch, 'edgecolor', 'none'); set(patch, 'FaceAlpha', 0.3);
    hold on;
    plot(MicroMONGS_acum_grupos_recalc(2,:),'b.'); %w ITI 1s
    hold on;
    ylabel('MicroMONGS - acum -recalc')
    xlabel('Blocks')
    yline(line)
    ylim(y_lim_acum_recalc)
    xlim(x_lim)
end