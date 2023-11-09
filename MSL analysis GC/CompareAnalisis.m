%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Esta funcion va a comparar al mismo grupo pero sacando o dejando
%%% sujetos.
%%% GRUPO ES UNA MATRIZ DE LAS MEDIAS DE CADA ANALISIS. CADA FILA UN GRUPO
%%% DIFERENTE. 

function CompareAnalisis(GRUPOS)

%color=[0 0 0;1 0 0; 0 1 0; 0 0 1; 0 1 1; 1 0 1;0 0.4470 0.7410;0.8500 0.3250 0.0980;0.9290 0.6940 0.1250;0.4940 0.1840 0.5560];
color=['k','r','b','m','g','c','y','r','b','m','g','c','y'];



figure;
for i=1:size(GRUPOS,1)
    durBlock=1000;                                                              % cantidad de puntos dentro de un bloque
    durRest=300;                                                                 %separacion visual entre bloques (cantidad de puntos a intercalar)
    contBlock=0;
    
    for j=1:durBlock:size(GRUPOS,2)
        plot(j+contBlock*durRest:j+(durBlock-1)+contBlock*durRest,GRUPOS(i,j:j+(durBlock-1)),color(i)); 
        hold on;
        contBlock=contBlock+1;
    end
   
       
end

%time sin ITI
legend('completo', 'sin 1', 'sin 3', 'sin 6', 'sin 7', 'sin 8', 'sin 9', 'sin 11', 'sin 16');

legend()
