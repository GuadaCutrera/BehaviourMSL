function [mogs_vector,mongs_vector]=Visualization_MicroMicroGains_Individual(MicroMogs,MicroMongs)

noBlock=size(MicroMogs,1);                                                  % cantidad de filas (bloques)
durBlock=1000;                                                              %la paso de segundos a ms
Block_vector=1:(noBlock*durBlock);                                          %por cada bloque tengo 10.000 puntos (10 seg)

Div_block=NaN(1,noBlock);


%% MICRO MOGS
                                                                            % Desplazo los NaN hacia el final de cada bloque. 
auxMicroMogs=NaN(size(MicroMogs));
for i=1:size(MicroMogs,1)
    cont=1;
    for j=1:size(MicroMogs,2)
        if ~isnan(MicroMogs(i,j))
            auxMicroMogs(i,cont)=MicroMogs(i,j);
            cont=cont+1;
        end
    end
end

% Matriz que guarda la cantidad de puntos que le corresponden a cada mogs
seq_points_mogs=NaN(size(auxMicroMogs));                                    

%Calculo la cantidad de puntos correspondiente a cada mogs 
% Ej: 5 mogs por bloque --- 1000 puntos
%               1 mog   --- x
for i=1:noBlock
    for j=1:size(auxMicroMogs,2)
       if isnan(auxMicroMogs(i,j))==0 %solo de secuencias correctas
            seq_points_mogs(i,j)=abs(round(durBlock/sum(~isnan(auxMicroMogs(i,:)))));
        end
    end
    if sum(seq_points_mogs(i,:),'omitnan')>durBlock %si por el redondeo sobran puntos
        seq_points_mogs(i,1)=seq_points_mogs(i,1)-(sum(seq_points_mogs(i,:),'omitnan')-durBlock);
    end
    if sum(seq_points_mogs(i,:),'omitnan')<durBlock %si por el redondeo faltan puntos
        seq_points_mogs(i,1)=seq_points_mogs(i,1)+(durBlock-sum(seq_points_mogs(i,:),'omitnan'));
    end
    
    
end
clear i; clear j;

%Expando los mogs en mogs_vector
mogs_vector=NaN(noBlock,durBlock);
for i=1:noBlock
    for j=1:sum(~isnan(auxMicroMogs(i,:)))
        % sum(~isnan(auxMicroMogs(i,:)) es la cantidad de mogs en el
        % bloque, no tiene xq ser la misma cant de seq_correctas
        if j==1
            mogs_vector(i,1:seq_points_mogs(i,j))=auxMicroMogs(i,j);
            desde=seq_points_mogs(i,j)+1;
            hasta=desde+seq_points_mogs(i,j+1)-1;
        else
            mogs_vector(i,desde:hasta)=auxMicroMogs(i,j);
            desde=hasta;
            if j+1<=size(seq_points_mogs,2)
                hasta=desde+seq_points_mogs(i,j+1);
            end
            
        end
    end
end

mogs_vector=reshape(mogs_vector',1,[]);


%% MICRO MONGS
                                                                            % Desplazo los NaN hacia el final de cada bloque. 
auxMicroMongs=NaN(size(MicroMongs));
for i=1:size(MicroMongs,1)
    cont=1;
    for j=1:size(MicroMongs,2)
        if ~isnan(MicroMongs(i,j))
            auxMicroMongs(i,cont)=MicroMongs(i,j);
            cont=cont+1;
        end
    end
end

% Matriz que guarda la cantidad de puntos que le corresponden a cada mogs
seq_points_mongs=NaN(size(MicroMongs));

%Calculo la cantidad de puntos correspondiente a cada mogs 
% Ej: 5 mogs por bloque --- 1000 puntos
%               1 mog   --- x
for i=1:noBlock
    for j=1:size(auxMicroMongs,2)
       if isnan(auxMicroMongs(i,j))==0 %solo de secuencias correctas
            seq_points_mongs(i,j)=abs(round(durBlock/sum(~isnan(auxMicroMongs(i,:)))));
        end
    end
    if sum(seq_points_mongs(i,:),'omitnan')>durBlock %si por el redondeo sobran puntos
        seq_points_mongs(i,1)=seq_points_mongs(i,1)-(sum(seq_points_mongs(i,:),'omitnan')-durBlock);
    end
    if sum(seq_points_mongs(i,:),'omitnan')<durBlock %si por el redondeo faltan puntos
        seq_points_mongs(i,1)=seq_points_mongs(i,1)+(durBlock-sum(seq_points_mongs(i,:),'omitnan'));
    end
    
    
end
clear i; clear j;

%Expando los mogs en mogs_vector
mongs_vector=NaN(noBlock,durBlock);
for i=1:noBlock
    for j=1:sum(~isnan(auxMicroMongs(i,:)))
        % sum(~isnan(auxMicroMogs(i,:)) es la cantidad de mogs en el
        % bloque, no tiene xq ser la misma cant de seq_correctas
        if j==1
            mongs_vector(i,1:seq_points_mongs(i,j))=auxMicroMongs(i,j);
            desde=seq_points_mongs(i,j)+1;
            hasta=desde+seq_points_mongs(i,j+1)-1;
        else
            mongs_vector(i,desde:hasta)=auxMicroMongs(i,j);
            desde=hasta+1;
            if j+1<=size(seq_points_mongs,2)
                hasta=desde+seq_points_mongs(i,j+1)-1;
            end
            
        end
    end
end

mongs_vector=reshape(mongs_vector',1,[]);

%% Grafico
figure; set(gcf,'Color','white'); box OFF; hold on; sgtitle('Micro Micro Gains - crudo')


subplot(2,1,1)
plot(Block_vector,mogs_vector,'r')

for i=1:durBlock:length(mogs_vector)
    xline(i); %indicates a new block 
end

xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Micro MOGS','FontName','Arial','FontSize',12);

subplot(2,1,2)
plot(Block_vector,mongs_vector,'b')

for i=1:durBlock:length(mongs_vector)
    xline(i); %indicates a new block 
end

xlabel('Blocks','FontName','Arial','FontSize',12)
ylabel('Micro MONGS','FontName','Arial','FontSize',12);