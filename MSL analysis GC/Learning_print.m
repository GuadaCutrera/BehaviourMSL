function Learning_print(iki_mean,IKI_per_subj,path,titulo)

durBlock=1000;
durRest=300;
for j=1:size(IKI_per_subj,1)
    figure; set(gcf,'Color','white'); box OFF; hold on;
    
    contBlock=0;
    for i=1:durBlock:length(iki_mean)
        %media
        plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,iki_mean(i:i+(durBlock-1)),'k','LineWidth',0.5);
        hold on;
        contBlock=contBlock+1;
        
        %sujeto individual
        plot(i+contBlock*durRest:i+(durBlock-1)+contBlock*durRest,IKI_per_subj(j,i:i+(durBlock-1)),'b','LineWidth',0.5);
        
    end
    
    saveas(gcf,[path '_Learning_visual_' titulo '_Sujeto_' num2str(j) '.fig']);
    saveas(gcf,[path '_Learning_visual_' titulo '_Sujeto_' num2str(j) '.png']);
end