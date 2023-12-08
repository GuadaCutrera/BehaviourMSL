%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Visualization_LearningCurve                     %%%
%%% Performance curve: The within-trials time-resolved representation of %%
%%% tapping speed for illustration of the performance curve was derived as%
%%% follows: For each participant, the tapping speed at each of the     %%%
%%% 10,000 ms constituting one practice period was defined as the average%%
%%% inter-tap interval of the sequence the participant was executing at %%%
%%% that moment. The duration of the execution of each sequence was defined
%%% as the time between the first key press of that sequence (or the    %%%
%%% beginning of the practice period) and the first key press of the next %
%%% (or the end of the practice period).                                %%%
%%%                                                                     %%%
%%%                         GC 17/6/2023                                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function IKI_vector=Visualization_LearningCurve(IKI_trial,seqduration,seq_results)

noBlock=size(IKI_trial,1);                                                  % cantidad de filas (bloques)
%durBlock=1000;                                                               %la paso de segundos a ms
durBlock=10;                                                              %porque es el maximo de seq en cada grupo
Block_vector=1:(noBlock*durBlock);                                          %por cada bloque tengo 10.000 puntos (10 seg)

Div_block=NaN(1,noBlock);


seq_points=NaN(size(seqduration));
for i=1:noBlock
    for j=1:size(seqduration,2)
        %seq_points=cantidad de puntos que le corresponden "ocupar" a cada secuencia dependiendo de su 
        ... duraci�n y en relaci�n a la cantidad de puntos por bloque.
            if isnan(seqduration(i,j))==0 %solo de secuencias correctas
                seq_points(i,j)=round(durBlock*seqduration(i,j)/sum(seqduration(i,:),'omitnan'));
            end
    end
    if sum(seq_points(i,:),'omitnan')>durBlock %si por el redondeo sobran puntos
        seq_points(i,1)=seq_points(i,1)-(sum(seq_points(i,:),'omitnan')-durBlock);
    end
    if sum(seq_points(i,:),'omitnan')<durBlock %si por el redondeo faltan puntos
        seq_points(i,1)=seq_points(i,1)+(durBlock-sum(seq_points(i,:),'omitnan'));
    end
    
    
end
clear i; clear j;

%Expando IKI_trial en IKI_vector
IKI_vector=NaN(noBlock,durBlock);
for i=1:noBlock
    for j=1:seq_results(1,1).correct(i)
        if j==1
            IKI_vector(i,1:seq_points(i,j))=IKI_trial(i,j);
            desde=seq_points(i,j)+1;
            hasta=desde+seq_points(i,j+1)-1;
        else
            IKI_vector(i,desde:hasta)=IKI_trial(i,j);
            desde=hasta;
            if j+1<=size(seq_points,2)
                hasta=desde+seq_points(i,j+1);
            end
            
        end
    end
end

IKI_vector=reshape(IKI_vector',1,[]);

figure; set(gcf,'Color','white'); box OFF; hold on;
plot(Block_vector,IKI_vector)

for i=1:durBlock:length(IKI_vector)
    xline(i); %indicates a new block 
end
%xticks([500:durBlock:36500]);
xticks([5:durBlock:365]);
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',...
    '21','22','23','24','25','26','27','28','29','30','31','32','33','34','35','36'})
xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Interkeys interval','FontName','Arial','FontSize',12);














