%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                     Analisis de transiciones: 
%%% Este script va a permitir ver qué aproach es mejor para el
%%% procesamiento de la data de MSL. A partir de los resultados que se
%%% obtengan, se modificará la función "Id_Analisis_Interkey"  y permitirá
%%% entender cómo deben analizarse las ganancias Micro Micro. Esta funcion
%%% genera las figuras de las carpetas ITI 1,5s, Sin ITI sujetos guille,
%%% y las mismas pero filtradas.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Transiciones(SUJETOS,paradigma,filtrar)
path='C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\experiments\Funciones para analisis MSL\Sin ITI sujetos guille filt\';
%% Extraccion de Data

for i=1:length(SUJETOS)
    SUJETOS(i).S.results = DataExtraction(SUJETOS(i).S,paradigma,filtrar);
end

%% Analisis Within group
for i=1:length(SUJETOS)
    SUJETOS(i).S.results.intervalo_12=reshape(SUJETOS(i).S.results.intervalo_12',1, []);
    SUJETOS(i).S.results.intervalo_23=reshape(SUJETOS(i).S.results.intervalo_23',1, []);
    SUJETOS(i).S.results.intervalo_34=reshape(SUJETOS(i).S.results.intervalo_34',1, []);
    SUJETOS(i).S.results.intervalo_45=reshape(SUJETOS(i).S.results.intervalo_45',1, []);
end

%% plot 2D
% figure;sgtitle('CRUDO 2D')
% 
% subplot(2,2,1)
% for i=1:length(SUJETOS)
%     plot(SUJETOS(i).S.results.intervalo_12,'r.','MarkerSize',15)
%     hold on
% end
% title('transicion 12')
% ylabel('tiempo [s]')
% ylim([0 2.5])
% for i=1:12:180 %180=12 seq x 15 bloq
%     xline(i)
% end
% 
% 
% subplot(2,2,2)
% for i=1:length(SUJETOS)
%     plot(SUJETOS(i).S.results.intervalo_23,'b.','MarkerSize',15)
%     hold on
% end
% title('transicion 23')
% ylabel('tiempo [s]')
% ylim([0 2.5])
% for i=1:12:180 %180=12 seq x 15 bloq
%     xline(i)
% end
% 
% subplot(2,2,3)
% for i=1:length(SUJETOS)
%     plot(SUJETOS(i).S.results.intervalo_34,'k.','MarkerSize',15)
%     hold on
% end
% title('transicion 34')
% ylabel('tiempo [s]')
% ylim([0 2.5])
% for i=1:12:180 %180=12 seq x 15 bloq
%     xline(i)
% end
% 
% subplot(2,2,4)
% for i=1:length(SUJETOS)
%     plot(SUJETOS(i).S.results.intervalo_45,'g.','MarkerSize',15)
%     hold on
% end
% title('transicion 45')
% ylabel('tiempo [s]')
% ylim([0 2.5])
% for i=1:12:180 %180=12 seq x 15 bloq
%     xline(i)
% end

%% Plot 3D
% figure;sgtitle('CRUDO 3D')
% 
% subplot(2,2,1)
% for i=1:length(SUJETOS)
%     aux=ones(length(SUJETOS(i).S.results.intervalo_12))*i;
%     plot3(aux,1:length(SUJETOS(i).S.results.intervalo_12),SUJETOS(i).S.results.intervalo_12,'r.','MarkerSize',10)
%     hold on
%    
% end
% title('transicion 12')
% zlabel('tiempo [s]')
% xlabel('sujetos')
% ylabel('trials')
% zlim([0 2.5])
% 
% subplot(2,2,2)
% for i=1:length(SUJETOS)
%     aux=ones(length(SUJETOS(i).S.results.intervalo_23))*i;
%     plot3(aux,1:length(SUJETOS(i).S.results.intervalo_23),SUJETOS(i).S.results.intervalo_23,'b.','MarkerSize',10)
%     hold on
%    
% end
% title('transicion 23')
% zlabel('tiempo [s]')
% xlabel('sujetos')
% ylabel('trials')
% zlim([0 2.5])
% 
% subplot(2,2,3)
% for i=1:length(SUJETOS)
%     aux=ones(length(SUJETOS(i).S.results.intervalo_34))*i;
%     plot3(aux,1:length(SUJETOS(i).S.results.intervalo_34),SUJETOS(i).S.results.intervalo_34,'k.','MarkerSize',10)
%     hold on
%    
% end
% title('transicion 34')
% zlabel('tiempo [s]')
% xlabel('sujetos')
% ylabel('trials')
% zlim([0 2.5])
% 
% subplot(2,2,4)
% for i=1:length(SUJETOS)
%     aux=ones(length(SUJETOS(i).S.results.intervalo_45))*i;
%     plot3(aux,1:length(SUJETOS(i).S.results.intervalo_45),SUJETOS(i).S.results.intervalo_45,'g.','MarkerSize',10)
%     hold on
%    
% end
% title('transicion 45')
% zlabel('tiempo [s]')
% xlabel('sujetos')
% ylabel('trials')
% zlim([0 2.5])


%% Plot 2D medias y desvios
% figure;sgtitle('CRUDO 2D - primera transicion')
% index=1;
% for j=1:4
%     for i=1:4
%         if index<(length(SUJETOS)+1)
%             figure (j)
%             subplot(2,2,i)
%             plot(SUJETOS(index).S.results.intervalo_12,'r.','MarkerSize',15)
%             hold on
%             aux=['transicion 12 - S' num2str(index)];
%             title(aux)
%             ylabel('tiempo [s]')
%             ylim([0 2.5])
%             xlim([0 181])
%             for k=1:12:180 %180=12 seq x 15 bloq
%               xline(k)
%             end
%             index=index+1;
%         end
%     end
%     
%     saveas(gcf,[path ['primera_S' num2str(index-4) '-S' num2str(index-1)  '.'] 'fig']);
% 
% end
% 


% figure;sgtitle('CRUDO 2D - segunda transicion')
% index=1;
% for j=1:4
%     for i=1:4
%         if index<(length(SUJETOS)+1)
%             figure (j)
%             subplot(2,2,i)
%             plot(SUJETOS(index).S.results.intervalo_23,'b.','MarkerSize',15)
%             hold on
%             aux=['transicion 23 - S' num2str(index)];
%             title(aux)
%             ylabel('tiempo [s]')
%             ylim([0 2.5])
%             xlim([0 181])
%             for k=1:12:180 %180=12 seq x 15 bloq
%               xline(k)
%             end
%             index=index+1;
%         end
%     end
%     saveas(gcf,[path ['segunda_S' num2str(index-4) '-S' num2str(index-1)  '.'] 'fig']);
% 
%     
% end


% figure;sgtitle('CRUDO 2D - tercera transicion')
% index=1;
% for j=1:4
%     for i=1:4
%         if index<(length(SUJETOS)+1)
%             figure (j)
%             subplot(2,2,i)
%             plot(SUJETOS(index).S.results.intervalo_34,'k.','MarkerSize',15)
%             hold on
%             aux=['transicion 34 - S' num2str(index)];
%             title(aux)
%             ylabel('tiempo [s]')
%             ylim([0 2.5])
%             xlim([0 181])
%             for k=1:12:180 %180=12 seq x 15 bloq
%               xline(k)
%             end
%             index=index+1;
%         end
%     end
%     saveas(gcf,[path ['tercera_S' num2str(index-4) '-S' num2str(index-1)  '.'] 'fig']);
% end

% figure;sgtitle('CRUDO 2D - ultima transicion')
% index=1;
% for j=1:4
%     for i=1:4
%         if index<(length(SUJETOS)+1)
%             figure (j)
%             subplot(2,2,i)
%             plot(SUJETOS(index).S.results.intervalo_45,'g.','MarkerSize',15)
%             hold on
%             aux=['transicion 45 - S' num2str(index)];
%             title(aux)
%             ylabel('tiempo [s]')
%             ylim([0 2.5])
%             xlim([0 181])
%             for k=1:12:180 %180=12 seq x 15 bloq
%               xline(k)
%             end
%             index=index+1;
%         end
%     end
%     saveas(gcf,[path ['ultima_S' num2str(index-4) '-S' num2str(index-1)  '.'] 'fig']);
%     
% end

%% Medias y desvios (o medianas y mad) x bloque para cada sujeto

mediana12=[];
mediana23=[];
mediana34=[];
mediana45=[];

media12=[];
media23=[];
media34=[];
media45=[];

mad_12=[];
mad_23=[];
mad_34=[];
mad_45=[];

desvio12=[];
desvio23=[];
desvio34=[];
desvio45=[];

seq_per_block=12;

for j=1:length(SUJETOS)
    index=1;
    for i=1:15 %15 bloques

        %12
        aux12=SUJETOS(j).S.results.intervalo_12(index:(index+seq_per_block-1));
        mediana12(j,i)=nanmedian(aux12);
        mad_12(j,i)=mad(aux12);
        media12(j,i)=nanmean(aux12);
        desvio12(j,i)=nanstd(aux12);

%         %23
%         aux23=SUJETOS(j).S.results.intervalo_23(index:(index+seq_per_block-1));
%         mediana23(j,i)=nanmedian(aux23);
%         mad_23(j,i)=mad(aux23);
%         media23(j,i)=nanmean(aux23);
%         desvio23(j,i)=nanstd(aux23);
% 
%         %34
%         aux34=SUJETOS(j).S.results.intervalo_34(index:(index+seq_per_block-1));
%         mediana34(j,i)=nanmedian(aux34);
%         mad_34(j,i)=mad(aux34);
%         media34(j,i)=nanmean(aux34);
%         desvio34(j,i)=nanstd(aux34);
       

        %45
        aux45=SUJETOS(j).S.results.intervalo_45(index:(index+seq_per_block-1));
        mediana45(j,i)=nanmedian(aux45);
        mad_45(j,i)=mad(aux45);
        media45(j,i)=nanmean(aux45);
        desvio45(j,i)=nanstd(aux45);
        
        index=index+seq_per_block;

    end
end

%  %Mediana

% index=1;
% for j=1:3
%     for i=1:5
%             figure(j); sgtitle('CRUDO mediana por bloque')
%             subplot(1,5,i)
%             plot(ones(length(mediana12(:,index)),1),mediana12(:,index),'r.','MarkerSize', 10); hold on
%             %errorbar(ones(length(mediana12(:,index)),1),mediana12(:,index),mad_12(:,index)); 
%             plot(ones(length(mediana45(:,index)),1)*2,mediana45(:,index),'g.','MarkerSize', 10); hold on
%             %errorbar(ones(length(mediana45(:,index)),1)*2,mediana45(:,index),mad_45(:,index));
%             for k=1:length(mediana12(:,index))
%                 plot([1 2],[mediana12(k,index) mediana45(k,index)],'k-')
%             end
%             xlim([0.5 2.5])
%             ylim([0 1.1])
%             title(['bloque' num2str(index)])
%             xlabel('T12              T45')
%             index=index+1;
%         
%     end
%     saveas(gcf,[path ['mediana_B' num2str(index-5) '-B' num2str(index-1)  '.'] 'fig']);
% 
% end
% 
% %media
% 
% index=1;
% for j=1:3
%     for i=1:5
%             figure(j+3); sgtitle('CRUDO media por bloque')
%             subplot(1,5,i)
%             plot(ones(length(media12(:,index)),1),media12(:,index),'r.','MarkerSize', 10); hold on
%             %errorbar(ones(length(media12(:,index)),1),media12(:,index),desvio12(:,index)); 
%             plot(ones(length(media45(:,index)),1)*2,media45(:,index),'g.','MarkerSize', 10); hold on
%             %errorbar(ones(length(media45(:,index)),1)*2,media45(:,index),desvio45(:,index));
%             for k=1:length(media12(:,index))
%                 plot([1 2],[media12(k,index) media45(k,index)],'k-')
%             end
%             xlim([0.5 2.5])
%             ylim([0 1.1])
%             title(['bloque' num2str(index)])
%             xlabel('T12              T45')
%             index=index+1;
%     end
%     saveas(gcf,[path ['media_B' num2str(index-5) '-B' num2str(index-1)  '.'] 'fig']);
% 
% end

%% grafico todos los bloques juntos por transicion

% for i=1:length(SUJETOS)
%     %mediana y mad
%     figure(1)
%     subplot(2,1,1)
%     plot(mediana12(i,:),'.-'); hold on;
%     errorbar(1:length(mediana12(i,:)),mediana12(i,:),mad_12(i,:)); hold on;
%     xlabel('bloques')
%     ylabel('tiempo [s]')
%     title('transicion 12')
%     ylim([0 1.8])
%     
%     subplot(2,1,2)
%     plot(mediana45(i,:),'.-'); hold on;
%     errorbar(1:length(mediana45(i,:)),mediana45(i,:),mad_45(i,:)); hold on;
%     xlabel('bloques')
%     ylabel('tiempo [s]')
%     title('transicion 45')
%     ylim([0 1.8])
%     
%     % media y desvio
%     figure(2)
%     subplot(2,1,1)
%     plot(media12(i,:),'.-'); hold on;
%     errorbar(1:length(media12(i,:)),media12(i,:),desvio12(i,:)); hold on;
%     xlabel('bloques')
%     ylabel('tiempo [s]')
%     title('transicion 12')
%     ylim([0 1.8])
%     
%     subplot(2,1,2)
%     plot(media45(i,:),'.-'); hold on;
%     errorbar(1:length(media45(i,:)),media45(i,:),desvio45(i,:)); hold on;
%     xlabel('bloques')
%     ylabel('tiempo [s]')
%     title('transicion 45')
%     ylim([0 1.8])
% 
% end

%% mediana de la mediana y media de la media
mediana_mediana12=[];
mediana_mediana45=[];
mad_12_=[];
mad_45_=[];

media_media12=[];
media_media45=[];
desvio_12=[];
desvio_45=[];

for i=1:size(mediana12,2)
    mediana_mediana12(i)=nanmedian(mediana12(:,i));
    mediana_mediana45(i)=nanmedian(mediana45(:,i));
    mad_12_(i)=std(mediana12(:,i));
    mad_45_(i)=std(mediana45(:,i));

    
    media_media12(i)=nanmean(media12(:,i));
    media_media45(i)=nanmean(media45(:,i));
    desvio_12(i)=std(media12(:,i));
    desvio_45(i)=std(media45(:,i));    
end

% for j=1:15
%         figure(7); sgtitle('CRUDO mediana de la mediana por bloque')
%         subplot(3,5,j)
%         plot(1,mediana_mediana12(j),'r.','MarkerSize',10); hold on;
%         errorbar(1,mediana_mediana12(j),mad_12_(j)); hold on;
%         plot(2,mediana_mediana45(j),'g.','MarkerSize',10); hold on;
%         errorbar(2,mediana_mediana45(j),mad_45_(j)); hold on;
%         plot([1 2], [mediana_mediana12(j) mediana_mediana45(j)],'k-')
%         xlim([0.5 2.5])
%         ylim([0.2 0.8])
%         
%         figure(8); sgtitle('CRUDO media de la media por bloque')
%         subplot(3,5,j)
%         plot(1,media_media12(j),'r.','MarkerSize',10); hold on;
%         errorbar(1,media_media12(j),desvio_12(j)); hold on;
%         plot(2,media_media45(j),'g.','MarkerSize',10); hold on;
%         errorbar(2,media_media45(j),desvio_45(j)); hold on;
%         plot([1 2], [media_media12(j) media_media45(j)],'k-')
%         xlim([0.5 2.5])
%         ylim([0.2 0.8])            
% end

% todos los bloques juntos por transicion

%mediana
% figure(1);
% plot(mediana_mediana12,'r.-'); hold on;
% errorbar(1:length(mediana_mediana12),mediana_mediana12,mad_12_,'r'); hold on;
% plot(mediana_mediana45,'g.-');hold on;
% errorbar(1:length(mediana_mediana45),mediana_mediana45,mad_45_,'g'); hold on;
% ylim([0.2 0.8])
% ylabel('tiempo [s]')
% xlabel('bloques')
% title('mediana de la mediana - CRUDO')
% legend('T12','','T45','')

% media

% figure(1);
% plot(media_media12,'r.-'); hold on;
% errorbar(1:length(media_media12),media_media12,desvio_12,'r'); hold on;
% plot(media_media45,'g.-');hold on;
% errorbar(1:length(media_media45),media_media45,desvio_45,'g'); hold on;
% ylim([0.2 0.8])
% ylabel('tiempo [s]')
% xlabel('bloques')
% title('media de la media - CRUDO')
% legend('T12','','T45','')

clear mediana12; clear mediana45;
clear media12;  clear media45;
clear mad_12; clear mad_45;
clear desvio12; clear desvio45;

clear mediana_mediana12;  clear mediana_mediana45;
clear media_media12;  clear media_media45;
clear mad_12_; clear mad_45_;
clear desvio_12; clear desvio_45;


%% Calculo la mediana/media y desvio pero de punto a punto de las transiciones
mediana12=[];
mediana23=[];
mediana34=[];
mediana45=[];

media12=[];
media23=[];
media34=[];
media45=[];

mad_12=[];
mad_23=[];
mad_34=[];
mad_45=[];

desvio12=[];
desvio23=[];
desvio34=[];
desvio45=[];

intervalo_12=[];
intervalo_23=[];
intervalo_34=[];
intervalo_45=[];

for i=1:11
    intervalo_12=[intervalo_12;SUJETOS(i).S.results.intervalo_12];
    intervalo_23=[intervalo_23;SUJETOS(i).S.results.intervalo_23];
    intervalo_34=[intervalo_34;SUJETOS(i).S.results.intervalo_34];
    intervalo_45=[intervalo_45;SUJETOS(i).S.results.intervalo_45];

end

for i=1:180 %180 es la cant de transiciones en toda la tarea
   
         media12(i)=nanmean(intervalo_12(:,i));
         media23(i)=nanmean(intervalo_23(:,i));
         media34(i)=nanmean(intervalo_34(:,i));
         media45(i)=nanmean(intervalo_45(:,i));
         
         desvio12(i)=nanstd(intervalo_12(:,i));
         desvio23(i)=nanstd(intervalo_23(:,i));
         desvio34(i)=nanstd(intervalo_34(:,i));
         desvio45(i)=nanstd(intervalo_45(:,i));
         
         mediana12(i)=nanmedian(intervalo_12(:,i));
         mediana23(i)=nanmedian(intervalo_23(:,i));
         mediana34(i)=nanmedian(intervalo_34(:,i));
         mediana45(i)=nanmedian(intervalo_45(:,i));
         
         mad_12(i)=mad(intervalo_12(:,i));
         mad_23(i)=mad(intervalo_23(:,i));
         mad_34(i)=mad(intervalo_34(:,i));
         mad_45(i)=mad(intervalo_45(:,i));    
end

figure; sgtitle('crudo - mediana')
plot(mediana12,'r-','MarkerSize',15); hold on;
%errorbar(1:length(mediana12),mediana12,desvio12,'r'); hold on;
plot(mediana45,'g-','MarkerSize',15); hold on;
%errorbar(1:length(mediana45),mediana45,desvio45,'g'); hold on;
ylim([0.2 0.7])
ylabel('tiempo [s]')
xlabel('trials')
for i=1:12:180
    xline(i)
end
