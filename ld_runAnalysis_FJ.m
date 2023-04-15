function [intertaps_correct, MeanSeq_duration, Block_duration, Block_duration_gains, TapSpeedKeysPerSec_meanxBlock, ...
    TapSpeedKeysPerSec_meanxSeq, TapInterval_meanxBlock,TapInterval_meanxSeq, ...
    micro_offline_intertaps_correct, micro_online_intertaps_correct, total_learning_intertaps_correct, ...
    micro_offline_SeqDuration, micro_online_SeqDuration, total_learning_SeqDuration, ...
    micro_offline_TapInterval_meanxSeq, micro_online_TapInterval_meanxSeq, total_learning_TapInterval_meanxSeq, ...
    micro_offline_TapSpeedKeysPerSec_meanxSeq, micro_online_TapSpeedKeysPerSec_meanxSeq, total_learning_TapSpeedKeysPerSec_meanxSeq] = ld_runAnalysis_FJ(i_Dir)
close all
% Run basic analysis
% 
% 
% Arnaud Bore 2016/02/06
if nargin < 1
    i_Dir = '';
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 1: INPUT DATA FILE                                          
if nargin<1
[fname,path]=uigetfile([ i_Dir   '*.mat'], 'Choose a file to analyse');
if fname == 0
    return;
end
load(strcat(path,fname));
else
load(i_Dir);  
fname=regexp(i_Dir,'\','split');
fname=fname{9};
end
% param.outputDir=i_Dir;
param.rawDir=fileparts(fileparts(i_Dir));
param.outputDir=[param.rawDir '\output'];

if strfind(fname,'Day_One')
    param.sequence = param.seqA; %#ok<NODEF>
    param.task = 'Task day one';
    param.nbBlocks = param.nbBlocksDayOne;
elseif strfind(fname, 'Day_Two')
    param.sequence = param.seqA; %#ok<NODEF>
    param.task = 'Task day one';
    param.nbBlocks = param.nbBlocksDayTwo;
else
    msgbox('Wrong input, contact arnaud.boreatgmail.com')
    return
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 2: EXTRACT DATA FROM 'LOGORIGINAL' STRUCTURE 

data = NaN(param.nbBlocks, param.nbKeys);                                   % matrix of time values corresponding to key presses. Dimensions: TOTAL BlockS (all conditions) x KEY PRESSES PER Block
key = NaN(param.nbBlocks, param.nbKeys);                                    % matrix identifying which key was pressed (i.e., 1-4). Dimensions: TOTAL BlockS (all conditions) x KEY PRESSES PER Block
flag = '';                                                                  % used to separate rest periods (no key presses) from practice/training periods
noBlock = 1;                                                                % used as counter below; eventually will equal TOTAL BlockS (all conditions)
index = 1;                                                                  % used as counter in loop
counter = 1;

for nLine = 1:length(logoriginal) %#ok<USENS>
    if strcmp(logoriginal{nLine}{2}, 'Practice')                            % 'Practice' denotes a training Block is about to begin (data stored in next n cells where n corresponds to the number of key presses per Block)
        flag = 'Practice';
        stimulus.GO(counter) = str2double(logoriginal{nLine}{1});
    end % IF loop
    if strcmp(logoriginal{nLine}{2}, 'Rest')                                % 'Rest' denotes the periods in between training Blocks (no key presses)
        flag = 'Rest';
        if strcmp(logoriginal{nLine-1}{2}, 'START') 
            % DO NOTHING
        else
            stimulus.stop(counter) = str2double(logoriginal{nLine}{1});
            counter = counter + 1;
        end
    end % IF loop
         
    if strcmp(logoriginal{nLine}{2}, 'rep') && strcmp(flag, 'Practice')     % rep corresponds to single key press in the training Block
        data(noBlock,index) = str2double(logoriginal{nLine}{1});                 
        key(noBlock,index) = str2double(logoriginal{nLine}{3});
        index = index + 1;                                                  % counter
        if index > param.nbKeys && noBlock < param.nbBlocks                 % if counter = number of key presses within each Block
            index = 1;                                                      % reset counter
            noBlock = noBlock + 1;
        end % IF loop
    end % IF loop
end % FOR loop
clear index; clear flag; clear nLine; clear counter;                        % tidy workspace

%%
name=strsplit(fname,'_');
name=name{1};
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 3: COMPUTING DEPENENT VARIABLES BLOCK DURATION AND STANDARD %%%
%%% DEVIATION OF THE INTERVAL BETWEEN KEY PRESSES                       %%%

index= 1;                                                                  
for i = 1:1:noBlock                                                        
    seq_results(1,1).BLduration(index) = data(i,size(data,2)) - data(i,1);
    seq_results(1,1).GOduration(index) = stimulus.stop(i) - stimulus.GO(i); 
    for nKey = 2:size(data,2)
        interval(nKey-1) = data(i,nKey) - data(i,nKey-1); %#ok<AGROW>
    end % FOR loop
    seq_results(1,1).standard(index) = std(interval);

    index= index+ 1;                                              
end % FOR loop 
clear index; clear i; clear interval; clear nKey;  % tidy workspace
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 4: COMPUTING DEPENDENT VARIABLES ACCURACY AND SEQ DURATION  %%%
%%%                                                                     %%%
%%% This section builds upon the previous section and adds two new      %%%
%%% dependent variables to the structure arrasys 'ctrl_results' and     %%%
%%% 'seq_results'. The variables computed in this section are described %%%
%%% below.                                                              %%%
%%%                                                                     %%%
%%% correct - 1 x n vector; number of correct sequences made within each%%%
%%% Block. For the CTRL condition, this is set to perfect in each Block %%%
%%% n = # of Blocks in the sequence or control condition (nBlock/2)      %%%
%%%                                                                     %%%
%%% SEQduration - 1 x n vector; computes the averaged time it takes to  %%%
%%% complete a CORRECT m-element sequence within each Block. This       %%%
%%% measure will be highly correlated with BLduration; however,         %%%
%%% SEQduration is only computed for a correct sequence, effectively    %%%
%%% adjusting for any fluctuations in speed caused by the errors        %%%
%%%                                                                     %%%
%%% This section of the code will NOT work if the following criterion is%%%
%%% not met: a five-element sequence with the number 3 appearing one    %%%
%%% time. If your paradigm does not fit this criterion, you can edit the%%%
%%% appropriate sections below or simply comment the entire secion out  %%%
%%% and proceed only with the dependnet variables listed in SECTION 3   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

index = 1;                                                                 % used as counter in loop; used to count # of Blocks within a condition (SEQ or SEQ)

seqduration = NaN(noBlock,(param.nbKeys/length(param.sequence)));            % Preallocate; sets variable with dimensions TOTAL Block # x THE NUMBER OF SEQUENCE REPETITIONS WITHIN A GIVEN Block (I.E., KEY PRESSES / NUMBER OF ELEMENTS IN THE SEQUENCE)
intertap_interval = NaN((param.nbKeys/length(param.sequence)),4,noBlock);            % Preallocate; sets variable with dimensions THE NUMBER OF SEQUENCE REPETITIONS WITHIN A GIVEN Block (I.E., KEY PRESSES / NUMBER OF ELEMENTS IN THE SEQUENCE) x 4 x TOTAL Block #
                                                                           % Must allocate seqdurations with NaN; but this variable is dependent on CORRECT sequences; if errors are made, there are less seqduration within a given Block
seq_results(1,1).correct = zeros(1,noBlock);                             % Initialize; start with zero correct sequences; will sum in the code below

Find3 = find(param.sequence == param.sequence(3));                                          % Within the SEQ to be learned, find location of the element 3. The selection of 3 was arbitrary but the section ASSUMES that the element 3 only appears once in the sequence

data_correct=nan(size(data));

for i = 1:1:noBlock;                                                         % i is used as counter that spans both SEQ and SEQ conditions
    Loc3 = find(key(i,:) == param.sequence(3));                                % Within each Block, find where button 3 was pressed
    for ii = 1:1:length(Loc3)                                      % for each time the three appears
        if Loc3(ii) <= param.nbKeys - (length(param.sequence) - Find3) && (Loc3(ii) >= Find3); % Ensures that each time a 3 appears, there are enough subsequent key presses to verify if the correct sequence was executed (w/o this check, it is likely to receive error msg 'index exceeds matrix dimensions')
%             if key(i,Loc3(ii)-2) == param.sequence(find(param.sequence == param.sequence(3))-2) && key(i,Loc3(ii)-1) == param.sequence(find(param.sequence == param.sequence(3))-1) && key(i,Loc3(ii)+1) == param.sequence(find(param.sequence == param.sequence(3))+1) && key(i,Loc3(ii)+2) == param.sequence(find(param.sequence == param.sequence(3))+2);
            % above line checks to make sure the appropriate sequence was executed; only valid for 5-element sequences. 
            if ii==1 && key(i,Loc3(ii)-2) == param.sequence(find(param.sequence == param.sequence(3))-2) && key(i,Loc3(ii)-1) == param.sequence(find(param.sequence == param.sequence(3))-1) && key(i,Loc3(ii)+1) == param.sequence(find(param.sequence == param.sequence(3))+1) && key(i,Loc3(ii)+2) == param.sequence(find(param.sequence == param.sequence(3))+2);
                seq_results(1,1).correct(index) = seq_results(1,1).correct(index) + 1; % if correct sequence, add value of 1 to the count of correct sequences
                seqduration(i,ii) = data(i,Loc3(ii)+(length(param.sequence)-Find3)) - data(i,Loc3(ii)-(Find3 - 1)); % if correct sequence, determine time it took to complete sequence           
                %tapping speed is the time intervals between adjacent key
                %presses within correct sequences
                intertap_interval(ii,1,i)=data(i,Loc3(ii)-(Find3 - 2))-data(i,Loc3(ii)-(Find3 - 1)); 
                intertap_interval(ii,2,i)=data(i,Loc3(ii))-data(i,Loc3(ii)-(Find3 - 2)); 
                intertap_interval(ii,3,i)=data(i,Loc3(ii)-(Find3 - 4))-data(i,Loc3(ii)); 
                intertap_interval(ii,4,i)=data(i,Loc3(ii)+(length(param.sequence)-Find3))-data(i,Loc3(ii)-(Find3 - 4)); 
            
                data_correct(i,Loc3(ii)-2)=data(i,Loc3(ii)-2);
                data_correct(i,Loc3(ii)-1)=data(i,Loc3(ii)-1);
                data_correct(i,Loc3(ii))=data(i,Loc3(ii));
                data_correct(i,Loc3(ii)+1)=data(i,Loc3(ii)+1);
                data_correct(i,Loc3(ii)+2)=data(i,Loc3(ii)+2);
                
            elseif (ii>=2 && (Loc3(ii-1)+2) ~= (Loc3(ii)-2)) && key(i,Loc3(ii)-2) == param.sequence(find(param.sequence == param.sequence(3))-2) && key(i,Loc3(ii)-1) == param.sequence(find(param.sequence == param.sequence(3))-1) && key(i,Loc3(ii)+1) == param.sequence(find(param.sequence == param.sequence(3))+1) && key(i,Loc3(ii)+2) == param.sequence(find(param.sequence == param.sequence(3))+2);
                %if the last element of the previous sequence is different
                %from the first element of the current sequence, then count
                %it
                seq_results(1,1).correct(index) = seq_results(1,1).correct(index) + 1; % if correct sequence, add value of 1 to the count of correct sequences
                seqduration(i,ii) = data(i,Loc3(ii)+(length(param.sequence)-Find3)) - data(i,Loc3(ii)-(Find3 - 1)); % if correct sequence, determine time it took to complete sequence           
%                 %tapping speed is the time intervals between adjacent key
%                 %presses within correct sequences
                intertap_interval(ii,1,i)=data(i,Loc3(ii)-(Find3 - 2))-data(i,Loc3(ii)-(Find3 - 1)); 
                intertap_interval(ii,2,i)=data(i,Loc3(ii))-data(i,Loc3(ii)-(Find3 - 2)); 
                intertap_interval(ii,3,i)=data(i,Loc3(ii)-(Find3 - 4))-data(i,Loc3(ii)); 
                intertap_interval(ii,4,i)=data(i,Loc3(ii)+(length(param.sequence)-Find3))-data(i,Loc3(ii)-(Find3 - 4));
            
                data_correct(i,Loc3(ii)-2)=data(i,Loc3(ii)-2);
                data_correct(i,Loc3(ii)-1)=data(i,Loc3(ii)-1);
                data_correct(i,Loc3(ii))=data(i,Loc3(ii));
                data_correct(i,Loc3(ii)+1)=data(i,Loc3(ii)+1);
                data_correct(i,Loc3(ii)+2)=data(i,Loc3(ii)+2);
                
            end % IF loop
        end % IF loop
        seq_results(1,1).SEQduration(index) = nanmean(seqduration(i,:)); % compute mean of seqduration within each Block (use NaN mean b/c NaN's will be present if errors were made)
        seq_results(1,1).SEQstandard(index) = nanstd(seqduration(i,:)); % compute mean of seqduration within each Block (use NaN mean b/c NaN's will be present if errors were made)
    end % FOR loop
    
    index = index + 1;     
    
end

seqduration(seqduration == 0)=NaN;
intertap_interval(intertap_interval == 0)=NaN;

%% Graficos
%% Graficos

intertaps=diff(data');
intertaps=intertaps';

TapSpeed_=1./intertaps;

%blocks with different colors
figure
for i=1:param.nbBlocks
plot((1:59)+68*(i-1),TapSpeed_(i,:))
hold on
inicio=59+68*(i-1);%59*(i)+9*(i-1);
fin=69+68*(i-1);%69*(i)+9*(i-1);
areainf=zeros(1,11);
areasup=30*ones(1,11);
patch([inicio:fin fliplr(inicio:fin)],[areainf fliplr(areasup)],[220 220 220]/255,'EdgeColor',[220 220 220]/255);
end
ylim([0 5])
xlim([1 1011])
xlabel('Keypresses')
ylabel('Keypresses per second')
title('Keypresses only for all sequences')
saveas(gcf,[name '_TapSpeed_AllKeypresses','.png']);

figure; 
plot(reshape(TapSpeed_',1,param.nbBlocks*59))
figure;
plot(reshape(TapSpeed_',1,param.nbBlocks*59))
ylim([0 5])

%% Graficos (only correct)
intertaps_correct=diff(data_correct');
intertaps_correct=intertaps_correct';
seq_results(1,1).intertaps_correct=intertaps_correct;

TapSpeed_correct=1./intertaps_correct;

%blocks with different colors
figure
for i=1:param.nbBlocks
plot((1:59)+68*(i-1),1000*intertaps_correct(i,:))
hold on
inicio=59+68*(i-1);%59*(i)+9*(i-1);
fin=69+68*(i-1);%69*(i)+9*(i-1);
areainf=200+zeros(1,11);
areasup=2000*ones(1,11);%30*ones(1,11);
patch([inicio:fin fliplr(inicio:fin)],[areainf fliplr(areasup)],[220 220 220]/255,'EdgeColor',[220 220 220]/255);
end
ylim([0.2 2]*1000)
xlim([1 1011])
xlabel('Keypresses')
ylabel('Intertap intervals (ms)')
title('Only for correct sequences')
saveas(gcf,[name '_Intertap_Correct','.png']);

% figure; 
% plot(reshape(intertaps_correct',1,param.nbBlocks*59))
% figure;
% plot(reshape(intertaps_correct',1,param.nbBlocks*59))
% ylim([0 5])
%% Seq duration
Min=min(min(seqduration));
Max=max(max(seqduration));
SeqDuration=NaN(15,12);
figure;
set(gcf,'Position',get(0,'ScreenSize'));
h1=subplot(121);

fin=0;
fines=[];

% for block=1:param.nbBlocks
%     aux_nonans=seqduration(block,~isnan(seqduration(block,:)));
%     SeqDuration(block,1:length(aux_nonans))=aux_nonans;
% inicio=fin+1;
% fin=inicio+length(seqduration(block,:))-1;
%     hold on
% plot(inicio:fin,seqduration(block,:),'*-')
% line([fin fin],[Min Max],'LineStyle','--','Color','k')
% fines=[fines; fin];
% end
% xlabel('Block number')
% ylabel('Sequence duration (only correct seq)')
% set(gca,'XTick',fines,'XTickLabel',1:param.nbBlocks)
% title(name)

for block=1:param.nbBlocks
    aux_nonans=seqduration(block,~isnan(seqduration(block,:)));
    SeqDuration(block,1:length(aux_nonans))=aux_nonans;
inicio=fin+1;
fin=inicio+length(SeqDuration(block,~isnan(SeqDuration(block,:))))-1;
    hold on
plot(inicio:fin,SeqDuration(block,~isnan(SeqDuration(block,:))),'ok','MarkerFaceColor','k')
plot(inicio:fin,SeqDuration(block,~isnan(SeqDuration(block,:))),'-k','LineWidth',2)
line([fin fin],[Min Max],'LineStyle','--','Color','k')
fines=[fines; fin];
end
xlabel('Block number')
ylabel('Sequence duration (only correct seq)')
set(gca,'XTick',fines,'XTickLabel',1:param.nbBlocks)
title(name,'Interpreter', 'none')

for block=1:param.nbBlocks-1
        no_nans_this=find(~isnan(SeqDuration(block,:)));
        no_nans_next=find(~isnan(SeqDuration(block+1,:)));
        micro_online_SeqDuration(block)=SeqDuration(block,no_nans_this(1))-SeqDuration(block,no_nans_this(end)); %compare last correct sequence of the block vs the first correct seq of the block
        micro_offline_SeqDuration(block)=SeqDuration(block,no_nans_this(end))-SeqDuration(block+1,no_nans_next(1)); %compare last correct sequence of the block vs the first correct seq of the next block
        total_learning_SeqDuration(block)=SeqDuration(block,no_nans_this(1))-SeqDuration(block+1,no_nans_next(1)); %compare first correct sequence of the block vs the first correct seq of the next block
end

seq_results(1,1).micro_online_SeqDuration=micro_online_SeqDuration;
seq_results(1,1).micro_offline_SeqDuration=micro_offline_SeqDuration;
seq_results(1,1).total_learning_SeqDuration=total_learning_SeqDuration;

h2=subplot(122);
plot(h2,1:param.nbBlocks-1,micro_offline_SeqDuration,'r-')
hold on
plot(h2,1:param.nbBlocks-1,micro_online_SeqDuration,'b-')
plot(h2,1:param.nbBlocks-1,total_learning_SeqDuration,'k-')
legend(h2,'micro-offline','micro-online','total')
xlabel('Block number')
ylabel('Delta')

saveas(gcf,[name '_SeqDuration','.png']);

figure;
plot(1:param.nbBlocks-1,micro_offline_SeqDuration,'r-')
xlabel('Block number')
ylabel('Delta')
title([name ' Micro-offline gains - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_SeqDuration_micro-offline','.png']);

figure;
plot(1:param.nbBlocks-1,micro_online_SeqDuration,'b-')
xlabel('Block number')
ylabel('Delta')
title([name ' Micro-online gains - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_SeqDuration_micro-online','.png']);

figure;
plot(1:param.nbBlocks-1,total_learning_SeqDuration,'k-')
xlabel('Block number')
ylabel('Delta')
title([name ' Total learning - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_SeqDuration_total-learning','.png']);

%% Average sequence duration
MeanSeq_duration=seq_results.SEQduration;

figure;
set(gcf,'Position',get(0,'ScreenSize'));
areasup=seq_results.SEQduration+seq_results.SEQstandard;
areainf=seq_results.SEQduration-seq_results.SEQstandard;
hold on
patch([1:1:length(seq_results.SEQduration) fliplr(1:1:length(seq_results.SEQduration))],[areainf fliplr(areasup)],[220 220 220]/255,'EdgeColor',[220 220 220]/255);
plot(1:1:length(seq_results.SEQduration),seq_results.SEQduration,'k-','LineWidth',2)
plot(1:1:length(seq_results.SEQduration),seq_results.SEQduration,'ko','MarkerFaceColor','k')
xlabel('Block number')
ylabel('Mean Sequences duration (only correct seq)')
title(name,'Interpreter', 'none')
saveas(gcf,[name '_MeanSeqDuration','.png']);

% errorbar(1:1:length(seq_results.SEQduration),seq_results.SEQduration,seq_results.SEQstandard); 
% hold on;
% xlabel('Blocks','FontName','Arial','FontSize',12); 
% ylabel('Correct Sequences duration','FontName','Arial','FontSize',12); 
% ylim([0 (max(seq_results.SEQduration)+min(seq_results.SEQduration))]);
% xlim([0 length(seq_results.SEQduration)+1]);



%% Intertap interval

% seqduration is the duration of tapping the 5 elements of the sequence
% tapping speed is how many keypresses by second (avg intertap interval within correct sequences)
figure;
set(gcf,'Position',get(0,'ScreenSize'));
fin=0;
fines=[];

Min=min(min(min(intertap_interval)));
Max=max(max(max(intertap_interval)));

for block=1:param.nbBlocks
    for seq=1:size(intertap_interval,1)
        inicio=fin+1;
        fin=inicio+size(intertap_interval,2)-1;
    hold on
    aux=squeeze(intertap_interval(seq,:,block));
plot(inicio:fin,aux,'*-')

    end
    line([fin fin],[Min Max],'LineStyle','--','Color','k')
    fines=[fines; fin];
end
xlabel('Block number')
ylabel('Intertap interval (only correct seq)')
set(gca,'XTick',fines,'XTickLabel',1:param.nbBlocks)
title(name, 'Interpreter', 'none')
saveas(gcf,[name '_TapInterval','.png']);

%% Intertap interval by keypress (only keypresses corresponding to correct seq)
for block=1:param.nbBlocks-1
        no_nans_this=find(~isnan(intertaps_correct(block,:)));
        no_nans_next=find(~isnan(intertaps_correct(block+1,:)));
        micro_online_intertaps_correct(block)=nanmean(intertaps_correct(block,no_nans_this(1:4)))-nanmean(intertaps_correct(block,no_nans_this(end-3:end))); %compare last correct sequence of the block vs the first correct seq of the block
        micro_offline_intertaps_correct(block)=nanmean(intertaps_correct(block,no_nans_this(end-3:end)))-nanmean(intertaps_correct(block+1,no_nans_next(1:4))); %compare last correct sequence of the block vs the first correct seq of the next block
        total_learning_intertaps_correct(block)=nanmean(intertaps_correct(block,no_nans_this(1:4)))-nanmean(intertaps_correct(block+1,no_nans_next(1:4))); %compare first correct sequence of the block vs the first correct seq of the next block
end

h2=subplot(122);
plot(h2,1:param.nbBlocks-1,micro_offline_intertaps_correct,'r-')
hold on
plot(h2,1:param.nbBlocks-1,micro_online_intertaps_correct,'b-')
plot(h2,1:param.nbBlocks-1,total_learning_intertaps_correct,'k-')
legend(h2,'micro-offline','micro-online','total')
xlabel('Block number')
ylabel('Delta')

seq_results(1,1).micro_online_intertaps_correct=micro_online_intertaps_correct;
seq_results(1,1).micro_offline_intertaps_correct=micro_offline_intertaps_correct;
seq_results(1,1).total_learning_intertaps_correct=total_learning_intertaps_correct;

saveas(gcf,[name '_Intertaps_correct','.png']);


%% Intertap interval x seq
inicio=1;
fines=[];

TapInterval_meanxSeq=NaN(15,12);

figure;
set(gcf,'Position',get(0,'ScreenSize'));

h1=subplot(121);
for block=1:param.nbBlocks
    hold on
    aux=squeeze(intertap_interval(:,:,block));
    mean=nanmean(aux,2)';
    mean=mean(~isnan(mean));
    TapInterval_meanxSeq(block,1:length(mean))=mean;
    stdev=nanstd(aux,1,2)';
    stdev=stdev(~isnan(stdev));
areasup=mean+stdev;
areainf=mean-stdev;
fin=inicio+length(mean)-1;
patch(h1,[(inicio:fin) fliplr(inicio:fin)],[areainf fliplr(areasup)],[220 220 220]/255,'EdgeColor',[220 220 220]/255);

plot(h1,inicio:fin,mean,'k-','LineWidth',2)
plot(h1,inicio:fin,mean,'ko','MarkerFaceColor','k')
fines=[fines; fin];
% line([fin fin],[Min Max],'LineStyle','--','Color','k')
inicio=fin+1;
end
xlabel('Block number')
ylabel('Intertap interval - average per sequence (only correct seq) +/- SD')
set(gca,'XTick',fines,'XTickLabel',1:param.nbBlocks)
title(name, 'Interpreter', 'none')

for block=1:param.nbBlocks-1
        no_nans_this=find(~isnan(TapInterval_meanxSeq(block,:)));
        no_nans_next=find(~isnan(TapInterval_meanxSeq(block+1,:)));
        micro_online_TapInterval_meanxSeq(block)=TapInterval_meanxSeq(block,no_nans_this(1))-TapInterval_meanxSeq(block,no_nans_this(end)); %compare last correct sequence of the block vs the first correct seq of the block
        micro_offline_TapInterval_meanxSeq(block)=TapInterval_meanxSeq(block,no_nans_this(end))-TapInterval_meanxSeq(block+1,no_nans_next(1)); %compare last correct sequence of the block vs the first correct seq of the next block
        total_learning_TapInterval_meanxSeq(block)=TapInterval_meanxSeq(block,no_nans_this(1))-TapInterval_meanxSeq(block+1,no_nans_next(1)); %compare first correct sequence of the block vs the first correct seq of the next block
end

seq_results(1,1).micro_online_TapInterval_meanxSeq=micro_online_TapInterval_meanxSeq;
seq_results(1,1).micro_offline_TapInterval_meanxSeq=micro_offline_TapInterval_meanxSeq;
seq_results(1,1).total_learning_TapInterval_meanxSeq=total_learning_TapInterval_meanxSeq;

h2=subplot(122);
plot(h2,1:param.nbBlocks-1,micro_offline_TapInterval_meanxSeq,'r-')
hold on
plot(h2,1:param.nbBlocks-1,micro_online_TapInterval_meanxSeq,'b-')
plot(h2,1:param.nbBlocks-1,total_learning_TapInterval_meanxSeq,'k-')
legend(h2,'micro-offline','micro-online','total')
xlabel('Block number')
ylabel('Delta')

saveas(gcf,[name '_MeanTapIntervalxSeq','.png']);

figure;
plot(1:param.nbBlocks-1,micro_offline_TapInterval_meanxSeq,'r-')
xlabel('Block number')
ylabel('Delta')
title([name ' Micro-offline gains - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_TapInterval_meanxSeq_micro-offline','.png']);

figure;
plot(1:param.nbBlocks-1,micro_online_TapInterval_meanxSeq,'b-')
xlabel('Block number')
ylabel('Delta')
title([name ' Micro-online gains - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_TapInterval_meanxSeq_micro-online','.png']);

figure;
plot(1:param.nbBlocks-1,total_learning_TapInterval_meanxSeq,'k-')
xlabel('Block number')
ylabel('Delta')
title([name ' Total learning - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_TapInterval_meanxSeq_total-learning','.png']);
%% Intertap interval x block
for block=1:param.nbBlocks
intertap_interval2(block,:)=reshape(intertap_interval(:,:,block)',size(intertap_interval,1)*size(intertap_interval,2),1)';
end
figure;
set(gcf,'Position',get(0,'ScreenSize'));
for block=1:param.nbBlocks
    hold on
TapInterval_meanxBlock(block)=nanmean(intertap_interval2(block,:));
plot(block,nanmean(intertap_interval2(block,:)),'ro','MarkerFaceColor','r')
errorbar(block,nanmean(intertap_interval2(block,:)),nanstd(intertap_interval2(block,:)),'r*')
end
xlabel('Block number')
ylabel('Mean Intertap interval per block (only correct seq)')
set(gca,'XTick',1:param.nbBlocks,'XTickLabel',1:param.nbBlocks)
title(name,'Interpreter', 'none')
saveas(gcf,[name '_MeanTapIntervalxBlock','.png']);


%% Tapping speed average per sequence
inicio=1;
fines=[];

TapSpeedKeysPerSec_meanxSeq=NaN(15,12);

figure;
set(gcf,'Position',get(0,'ScreenSize'));

h1=subplot(121);
for block=1:param.nbBlocks
    hold on
    tapping_speed=1./squeeze(intertap_interval(:,:,block));
    mean=nanmean(tapping_speed,2)';
    mean=mean(~isnan(mean));
    TapSpeedKeysPerSec_meanxSeq(block,1:length(mean))=mean;
%     TapSpeedKeysPerSec_mean=mean;
    stdev=nanstd(tapping_speed,1,2)';
    stdev=stdev(~isnan(stdev));
%     TapSpeedKeysPerSec_std=stdev;
areasup=mean+stdev;
areainf=mean-stdev;
fin=inicio+length(mean)-1;
patch(h1,[(inicio:fin) fliplr(inicio:fin)],[areainf fliplr(areasup)],[220 220 220]/255,'EdgeColor',[220 220 220]/255);

plot(h1,inicio:fin,mean,'k-','LineWidth',2)
plot(h1,inicio:fin,mean,'ko','MarkerFaceColor','k')
fines=[fines fin];
% line([fin fin],[Min Max],'LineStyle','--','Color','k')
inicio=fin+1;
end
xlabel(h1,'Block number')
ylabel(h1,'Tapping speed average per sequence (only correct seq) keys/sec')
set(gca,'XTick',fines,'XTickLabel',1:param.nbBlocks)
title(name,'Interpreter', 'none')

for block=1:param.nbBlocks-1
        no_nans_this=find(~isnan(TapSpeedKeysPerSec_meanxSeq(block,:)));
        no_nans_next=find(~isnan(TapSpeedKeysPerSec_meanxSeq(block+1,:)));
        micro_online_TapSpeedKeysPerSec_meanxSeq(block)=TapSpeedKeysPerSec_meanxSeq(block,no_nans_this(end))-TapSpeedKeysPerSec_meanxSeq(block,no_nans_this(1)); %compare last correct sequence of the block vs the first correct seq of the block
        micro_offline_TapSpeedKeysPerSec_meanxSeq(block)=TapSpeedKeysPerSec_meanxSeq(block+1,no_nans_next(1))-TapSpeedKeysPerSec_meanxSeq(block,no_nans_this(end)); %compare last correct sequence of the block vs the first correct seq of the next block
        total_learning_TapSpeedKeysPerSec_meanxSeq(block)=TapSpeedKeysPerSec_meanxSeq(block+1,no_nans_next(1))-TapSpeedKeysPerSec_meanxSeq(block,no_nans_this(1)); %compare first correct sequence of the block vs the first correct seq of the next block
end

seq_results(1,1).micro_online_TapSpeedKeysPerSec_meanxSeq=micro_online_TapSpeedKeysPerSec_meanxSeq;
seq_results(1,1).micro_offline_TapSpeedKeysPerSec_meanxSeq=micro_offline_TapSpeedKeysPerSec_meanxSeq;
seq_results(1,1).total_learning_TapSpeedKeysPerSec_meanxSeq=total_learning_TapSpeedKeysPerSec_meanxSeq;

h2=subplot(122);
plot(h2,1:param.nbBlocks-1,micro_offline_TapSpeedKeysPerSec_meanxSeq,'r-')
hold on
plot(h2,1:param.nbBlocks-1,micro_online_TapSpeedKeysPerSec_meanxSeq,'b-')
plot(h2,1:param.nbBlocks-1,total_learning_TapSpeedKeysPerSec_meanxSeq,'k-')
legend(h2,'micro-offline','micro-online','total')
xlabel(h2,'Block number')
ylabel(h2,'Delta')

saveas(gcf,[name '_MeanTapSpeedxSeq_KeysPerSec','.png']);

figure;
plot(1:param.nbBlocks-1,micro_offline_TapSpeedKeysPerSec_meanxSeq,'r-')
xlabel('Block number')
ylabel('Delta')
title([name ' Micro-offline gains - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_TapSpeedKeysPerSec_meanxSeq_micro-offline','.png']);

figure;
plot(1:param.nbBlocks-1,micro_online_TapSpeedKeysPerSec_meanxSeq,'b-')
xlabel('Block number')
ylabel('Delta')
title([name ' Micro-online gains - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_TapSpeedKeysPerSec_meanxSeq_micro-online','.png']);

figure;
plot(1:param.nbBlocks-1,total_learning_TapSpeedKeysPerSec_meanxSeq,'k-')
xlabel('Block number')
ylabel('Delta')
title([name ' Total learning - Seq Duration'],'Interpreter', 'none')

saveas(gcf,[name '_TapSpeedKeysPerSec_meanxSeq_total-learning','.png']);
%% Tapping speed average per block

inicio=1;
fines=[];
figure;
set(gcf,'Position',get(0,'ScreenSize'));
for block=1:param.nbBlocks
    hold on
    tapping_speed=1./squeeze(intertap_interval2(block,:));
    mean=nanmean(tapping_speed,2)';
    mean=mean(~isnan(mean));
    TapSpeedKeysPerSec_mean(block)=mean;
    stdev=nanstd(tapping_speed,1,2)';
    stdev=stdev(~isnan(stdev));
    TapSpeedKeysPerSec_std(block)=stdev;
end
areasup=TapSpeedKeysPerSec_mean+TapSpeedKeysPerSec_std;
areainf=TapSpeedKeysPerSec_mean-TapSpeedKeysPerSec_std;

patch([(1:length(TapSpeedKeysPerSec_mean)) fliplr(1:length(TapSpeedKeysPerSec_mean))],[areainf fliplr(areasup)],[220 220 220]/255,'EdgeColor',[220 220 220]/255);

plot(1:length(TapSpeedKeysPerSec_mean),TapSpeedKeysPerSec_mean,'k-','LineWidth',2)
plot(1:length(TapSpeedKeysPerSec_mean),TapSpeedKeysPerSec_mean,'ko','MarkerFaceColor','k')
xlabel('Block number')
ylabel('Tapping speed average per block (only correct seq) keys/sec')
set(gca,'XTick',fines,'XTickLabel',1:param.nbBlocks)
title(name,'Interpreter', 'none')
saveas(gcf,[name '_MeanTapSpeedxSeq_KeysPerSec','.png']);
TapSpeedKeysPerSec_meanxBlock=TapSpeedKeysPerSec_mean;


%% Block duration

%% Plot Block duration
figure;
% set(gcf,'Position',get(0,'ScreenSize'));
% errorbar(1:1:length(seq_results.GOduration),seq_results.GOduration, seq_results.standard);
hold on
plot(1:1:length(seq_results.GOduration),seq_results.GOduration,'ko','MarkerFaceColor','k');
plot(1:1:length(seq_results.GOduration),seq_results.GOduration,'k-','LineWidth',2);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Block duration','FontName','Arial','FontSize',12); 
% ylim([0 (max(seq_results.GOduration))+min(seq_results.GOduration)]);
xlim([1 length(seq_results.GOduration)]);
title([name '_BlockDuration'],'Interpreter', 'none')
saveas(gcf,[name '_BlockDuration','.png']);

Block_duration=seq_results.GOduration;

%% Plot gains in Block duration
figure;
set(gcf,'Position',get(0,'ScreenSize'));
% errorbar(1:1:length(seq_results.GOduration),seq_results.GOduration, seq_results.standard);
hold on
plot(1:1:length(seq_results.GOduration)-1,-diff(seq_results.GOduration),'ko','MarkerFaceColor','k');
plot(1:1:length(seq_results.GOduration)-1,-diff(seq_results.GOduration),'k-','LineWidth',2);
hold on;
xlabel('Blocks','FontName','Arial','FontSize',12);
ylabel('Block duration delta (gains)','FontName','Arial','FontSize',12); 
% ylim([0 (max(diff(seq_results.GOduration)))+min(diff(seq_results.GOduration))]);
xlim([0 length(diff(seq_results.GOduration))+1]);
title([name '_BlockDuration_delta'],'Interpreter', 'none')
saveas(gcf,[name '_BlockDuration_delta','.png']);

Block_duration_gains=-diff(seq_results.GOduration);

save([path fname(1:end-4) '_results_flor.mat'],'seq_results');
%%

% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% SECTION 5: DURATION OF 2-ELEMENT COMBINATIONS                       %%%
% %%%                                                                     %%%
% %%% Computes the interval between consecutive key presses w/in a        %%%
% %%% CORRECT sequence; allows user to determine which two elements are   %%%
% %%% 'easiest' or 'hardest' for participants to execute consecutively.   %%%
% %%% Variables are saved to the seq.results cell.                        %%%
% %%%                                                                     %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% index = 1;                                                                 % used as counter in loop; used to count # of Blocks
% interval12 = NaN(noBlock,param.nbKeys/length(param.sequence));             % Preallocate; sets variable with dimensions # SEQ Blocks x THE NUMBER OF SEQUENCE REPETITIONS WITHIN A GIVEN Block (I.E., KEY PRESSES / NUMBER OF ELEMENTS IN THE SEQUENCE); interval12 = duration between 1st and 2nd elements in the seq
% interval23 = NaN(noBlock,param.nbKeys/length(param.sequence));             % interval23 = duration between 2nd and 3rd elements in the seq
% interval34 = NaN(noBlock,param.nbKeys/length(param.sequence));             % interval34 = duration between 3rd and 4th elements in the seq
% interval45 = NaN(noBlock,param.nbKeys/length(param.sequence));             % interval45 = duration between 4th and 5th elements in the seq
% interval51 = NaN(noBlock,param.nbKeys/length(param.sequence));             % interval51 = duration between 5th and 1st elements in the seq (from last element of sequence back to the first)
%                                                                            % Must allocate seqdurations with NaN; but this variable is dependent on CORRECT sequences; if errors are made, there are less seqduration within a given Block
% 
% for i = 1:1:noBlock;                                                      
%     counter = 1;
%     counter2 = 2;
%     for ii = 1:1:param.nbKeys
%         if ii+4 <= param.nbKeys % prevents error msg of exceeding matrix dimensions
%             if key(i,ii) == param.sequence(1) && key(i,ii+1) == param.sequence(2) && key(i,ii+2) == param.sequence(3) && key(i,ii+3) == param.sequence(4) && key(i,ii+4) == param.sequence(5)
%                 interval12(index,counter) = data(i,ii+1) - data(i,ii);
%                 interval23(index,counter) = data(i,ii+2) - data(i,ii+1);
%                 interval34(index,counter) = data(i,ii+3) - data(i,ii+2); 
%                 interval45(index,counter) = data(i,ii+4) - data(i,ii+3); 
%                 if ii+5 <= param.nbKeys && key(i,ii+5) == param.sequence(1) % prevents error msg of exceeding matrix dimensions AND it makes sure that the first element of the sequence is pressed after the last elementof the preceeding sequence
%                     interval51(index,counter2) = data(i,ii+5) - data(i,ii+4); 
%                     counter2 = counter2 + 1; 
%                 end
%                 counter = counter + 1; 
%             end
%         end
%     end
%     clear counter; clear counter2;  % tidy workspace
% 
%     seq_results(1,1).Interval12(index) = nanmean(interval12(index,:));  % Compute mean - excludes NaNs
%     seq_results(1,1).Interval23(index) = nanmean(interval23(index,:)); 
%     seq_results(1,1).Interval34(index) = nanmean(interval34(index,:)); 
%     seq_results(1,1).Interval45(index) = nanmean(interval45(index,:)); 
%     seq_results(1,1).Interval51(index) = nanmean(interval51(index,:)); 
%     index = index + 1;        
% end
% clear index; clear i; clear ii;  % tidy workspace
% clear interval12; clear interval23; clear interval34; clear interval45; clear interval 51;
% 
% %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% SECTION 6: GENERATE FIGURES                                         %%%
% %%%                                                                     %%%
% %%% Section will generate plots of the appropriate dependent variables  %%%
% %%%                                                                     %%%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             
% %-------------------------------------------------------------------------
% % Correct sequence - DURATION
% figure; set(gcf,'Color','white'); box OFF; hold on;
% 
% %% Plot Block duration
% subplot(2,2,1); 
% % errorbar(1:1:length(seq_results.GOduration),seq_results.GOduration, seq_results.standard);
% plot(1:1:length(seq_results.GOduration),seq_results.GOduration,'+');
% hold on;
% xlabel('Blocks','FontName','Arial','FontSize',12);
% ylabel('Block duration','FontName','Arial','FontSize',12); 
% ylim([0 (max(seq_results.GOduration))+min(seq_results.GOduration)]);
% xlim([0 length(seq_results.GOduration)+1]);
% %% Plot correct sequences duration
% subplot(2,2,2); 
% errorbar(1:1:length(seq_results.SEQduration),seq_results.SEQduration,seq_results.SEQstandard); 
% hold on;
% xlabel('Blocks','FontName','Arial','FontSize',12); 
% ylabel('Correct Sequences duration','FontName','Arial','FontSize',12); 
% ylim([0 (max(seq_results.SEQduration)+min(seq_results.SEQduration))]);
% xlim([0 length(seq_results.SEQduration)+1]);
% 
% %% Number of correct sequences
% subplot(2,2,3);  plot(seq_results.correct,'bo','MarkerSize', 6);
% xlabel('Blocks','FontName','Arial','FontSize',12);
% ylabel('Correct Sequences','FontName','Arial','FontSize',12);
% ylim([0 (max(seq_results.correct))+3]);
% xlim([0 length(seq_results.correct)+1]);
% 
% %% Plot Interkeys interval
% subplot(2,2,4)
% plot(seq_results.Interval12,'bo','MarkerSize', 6); hold on;
% plot(seq_results.Interval23,'ro','MarkerSize', 6); hold on;
% plot(seq_results.Interval34,'go','MarkerSize', 6); hold on;
% plot(seq_results.Interval45,'ko','MarkerSize', 6); hold on;
% plot(seq_results.Interval51,'co','MarkerSize', 6); hold on;
% 
% h = axis; 
% text(h(2)*1.1, h(4)*0.60,'Elem12','Color','b','FontSize',10); 
% text(h(2)*1.1, h(4)*0.55,'Elem23','Color','r','FontSize',10); 
% text(h(2)*1.1, h(4)*0.50,'Elem34','Color','g','FontSize',10); 
% text(h(2)*1.1, h(4)*0.45,'Elem45','Color','k','FontSize',10); 
% text(h(2)*1.1, h(4)*0.40,'Elem51','Color','c','FontSize',10);
% xlabel('Blocks','FontName','Arial','FontSize',12)
% ylabel('Interkeys interval','FontName','Arial','FontSize',12);
% ylim([0 (max([seq_results.Interval12, seq_results.Interval23, ...
%               seq_results.Interval34, seq_results.Interval45, ...
%               seq_results.Interval51]))])
% xlim([0 length(seq_results.Interval12)+1]);
% 
% %% Save figure: .fig and .png
% saveas(gcf,[param.outputDir fname(1:end-3) 'fig']);
% saveas(gcf,[param.outputDir fname(1:end-3) 'png']);
% 
% %% Save seq_results structure
%  
% save([param.outputDir fname(1:end-4) '_results.mat'],'seq_results');
