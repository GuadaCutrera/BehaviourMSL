function Analisis_Seq_Individual(i_Dir)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Esta funcion se divide en varias secciones en las cuales se realiza la 
%%% extracción de la data, cálculos de variables que dependen del tiempo en
%%% que se presionaron las teclas, ganancias online y offline. 
%%% Antes de correr el scipt chequear donde de donde se obtienen y a donde
%%% se guardarán los datos y/o figuras que devuelva. Chequear también que
%%% el paradigma que se esta por analizar corresponde a la finalización del
%%% bloque por cantidad de teclas y no por tiempo. Ese script no está
%%% adaptado
%%%
%%% Además, hay un agregado de "filtrado de data" en el que se filtran los
%%% intervalos en razón de la mediana y 3 mad. 
%%%
%%% En esta funcion se realizan llamadas a: 
%%%   - Micro_Gains_key
%%%   - Micro_Micro_Gains_key
%%%   - Id_Filt_Interkey si es que se setea para un filtrado
%%%   - Id_Norm_Interkey 
%%%   - Plot_Individual_Figures
%%%
%%% Se guardarán todos los resultados en la estructura seq_results, en el
%%% archivo que corresponde a fname_results.mat en el path indicado. 
%%% 
%%%                         GC 12/12/2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

if nargin < 1
    i_Dir = '';
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 1: INPUT DATA FILE %                                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fname,path]=uigetfile([ i_Dir   '*.mat'], 'Choose a file to analyse');
if fname == 0
    return;
end
load(strcat(path,fname));

flag_ITI=''; %Protocolo Guada
if strfind(fname,'sin_ITI')
    param.seqA = param.seqA; %#ok<NODEF>
    param.task = 'Task sin ITI';
    param.nbBlocks = param.nbBlocksWithoutITI;
elseif strfind(fname, 'con_ITI')
    param.seqA = param.seqA; %#ok<NODEF>
    param.task = 'Task con ITI';
    param.nbBlocks = param.nbBlocksWithITI;
    flag_ITI='ITI'; % Indica que el protocolo contiene un ITI entre secuencias
elseif strfind(fname,'Day_One') %PROTOCOLO GUILLE Y FLOR
    param.sequence = param.seqA; %#ok<NODEF>
    param.task = 'Task day one';
    param.nbBlocks = param.nbBlocksDayOne;
else
    msgbox('Wrong input, this task can´t be analysed by this script')
    %En este caso, chequear los nombres de las variables. Si dicen DayOne
    % o DayTwo por ejemplo. 
    return
end

seq_results(1,1).flag_filt=0; %set this flag to 1 if you want the filtration of data
seq_results(1,1).flag_norm=1; %set flag to 1 if you want a normalization of data
if seq_results(1,1).flag_norm==1
    seq_results(1,1).flag_tipo_norm='01'; %indica qué tipo de normalización se quiere hacer: Z: zscore -- 01: normalización 01
end
seq_results.cant_SeqBlock=param.nbKeys/length(param.seqA);

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 2: EXTRACT DATA FROM 'LOGORIGINAL' STRUCTURE %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
data = NaN(param.nbBlocks, param.nbKeys);                                   % matrix of time values corresponding to key presses. Dimensions: TOTAL BlockS (all conditions) x KEY PRESSES PER Block
key = NaN(param.nbBlocks, param.nbKeys);                                    % matrix identifying which key was pressed (i.e., 1-4). Dimensions: TOTAL BlockS (all conditions) x KEY PRESSES PER Block
flag = '';                                                                  % used to separate rest periods (no key presses) from practice/training periods
noBlock = 1;                                                                % used as counter below; eventually will equal TOTAL BlockS (all conditions)
index = 1;                                                                  % used as counter in loop
counter = 1;

index_rest=1;
noRest=1;
data_rest = NaN(param.nbBlocks +1,param.nbKeys);                            % matrix of time values corresponding to key presses. Dimensions: TOTAL BlockS (all conditions) x KEY PRESSES IN THE REST
key_rest = NaN(param.nbBlocks +1,param.nbKeys);                             % matrix identifying which key was pressed (i.e., 1-4). Dimensions: TOTAL BlockS (all conditions) x KEY PRESSES IN THE REST
%estas dos matrices tienen 1 filas más para el rest del comienzo

for nLine = 1:length(logoriginal) %#ok<USENS>
    if strcmp(logoriginal{nLine}{2}, 'Practice')                            % 'Practice' denotes a training Block is about to begin (data stored in next n cells where n corresponds to the number of key presses per Block)
        flag = 'Practice';
        stimulus.GO(counter) = str2double(logoriginal{nLine}{1});
    end % IF loop
    if strcmp(logoriginal{nLine}{2}, 'Rest')                                % 'Rest' denotes the periods in between training Blocks (no key presses)
        flag = 'Rest';
        if strcmp(logoriginal{nLine-1}{2}, 'START') 
            % DO NOTHING
        else                                                                %si no es el primer rest
            stimulus.stop(counter) = str2double(logoriginal{nLine}{1});
            counter = counter + 1;
        end
    end % IF loop
         
    if strcmp(logoriginal{nLine}{2}, 'rep') && strcmp(flag, 'Practice')     % rep corresponds to single key press in the training Block
        data(noBlock,index) = str2double(logoriginal{nLine}{1});            %tiempo    
        key(noBlock,index) = str2double(logoriginal{nLine}{3});             %key
        index = index + 1;                                                  % counter
        if index > param.nbKeys && noBlock < param.nbBlocks                 % if counter = number of key presses within each Block
            index = 1;                                                      % reset counter
            noBlock = noBlock + 1;
        end % IF loop
    end % IF loop
    
    %la idea de estas líneas de código es poder ver si los sujetos siguen presionando teclas una vez que cambió de color la cruz central
    if strcmp(logoriginal{nLine}{2}, 'rep') && strcmp(flag, 'Rest')         % rep corresponds to single key press in the rest
        data_rest(noRest,index_rest) = str2double(logoriginal{nLine}{1});   % tiempo    
        key_rest(noRest,index_rest) = str2double(logoriginal{nLine}{3});    % key
        index_rest = index_rest + 1;                                        % counter
        if index_rest > param.nbKeys && noRest < param.nbBlocks             % if counter = number of key presses within each rest
            index_rest = 1;                                                 % reset counter
            noRest = noRest + 1;
        end % IF loop
    end % IF loop

    
end % FOR loop
clear index; clear flag; clear nLine; clear counter; clear index_rest;     % tidy workspace

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 3: COMPUTING DEPENENT VARIABLES BLOCK DURATION AND STANDARD %%%
%%% DEVIATION OF THE INTERVAL BETWEEN KEY PRESSES                       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

index= 1;
if noBlock < param.nbBlocks % por si la tarea del sujeto corta antes por algun error
    noBlock=noBlock-1;
end

for i = 1:1:noBlock                                                        
    seq_results(1,1).BLduration(index) = data(i,size(data,2)) - data(i,1);
    seq_results(1,1).GOduration(index) = stimulus.stop(i) - stimulus.GO(i); 
    for nKey = 2:size(data,2)
        %este interval no discrimina los ITIs
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
%%% dependent variables to the structure 'seq_results'.                 %%%
%%% The variables computed in this section are described                %%%
%%% below.                                                              %%%
%%%                                                                     %%%
%%% correct - 1 x n vector; number of correct sequences made within each%%%
%%% Block.                                                              %%%
%%%                                                                     %%%
%%% SEQduration - 1 x n vector; computes the averaged time it takes to  %%%
%%% complete a CORRECT m-element sequence within each Block. This       %%%
%%% measure will be highly correlated with BLduration; however,         %%%
%%% SEQduration is only computed for a correct sequence, effectively    %%%
%%% adjusting for any fluctuations in speed caused by the errors        %%%
%%%                                                                     %%%
%%% interval12: stores the intertap interval between 1st and 2nd        %%%
%%% key presses. Same logic aplies to interval23, interval34,           %%%
%%% interval45, and if considered, interval51. In this scirpt, the      %%%
%%% interval51 is not calculated                                        %%%
%%%                                                                     %%%
%%% seq_results.Interval12: stores the mean value of all the interval12 %%%
%%% per block. Same logic aplies to seq_results.Interval23, etc.        %%%
%%%                                                                     %%%
%%% seq_results.Intervalmean: stores the mean value of all the intertap %%% 
%%% intervals per block. This line of code does not discrminate between %%% 
%%% the type of transition.                                             %%%
%%%                                                                     %%%
%%% IKI_per_trial: this variable stores the mean value of the four      %%% 
%%% transitions made in a sequence. IKI = Inter Key Interval. A trial   %%% 
%%% is considered as a complete five- element sequence "41324".         %%%
%%%                                                                     %%%
%%% interkey_matrix: each row has the type of interval, and each column %%%
%%% the value of the interval corresponding to te trial. todas las      %%%
%%% transiciones en orden en el que sucedieron                          %%%
%%% 12 23 34 34 - 12 23 34 45 -...  There is also a filtered version.   %%%
%%%                                                                     %%%
%%% This section of the code will NOT work if the following criterion is%%%
%%% not met: a five-element sequence with the number 3 appearing one    %%%
%%% time. If your paradigm does not fit this criterion, you can edit the%%%
%%% appropriate sections below or simply comment the entire secion out  %%%
%%% and proceed only with the dependnet variables listed in SECTION 3   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

seqduration = NaN(noBlock,(param.nbKeys/length(param.seqA)));              % Preallocate; sets variable with dimensions TOTAL Block # x THE NUMBER OF SEQUENCE REPETITIONS WITHIN A GIVEN Block (I.E., KEY PRESSES / NUMBER OF ELEMENTS IN THE SEQUENCE)
                                                                           % Must allocate seqdurations with NaN; but this variable is dependent on CORRECT sequences; if errors are made, there are less seqduration within a given Block
seq_results(1,1).correct = zeros(1,noBlock);                               % Initialize; start with zero correct sequences; will sum in the code below

% Preallocate; sets variable with dimensions # SEQ Blocks x THE NUMBER OF SEQUENCE REPETITIONS WITHIN A GIVEN Block (I.E., KEY PRESSES / NUMBER OF ELEMENTS IN THE SEQUENCE);
interval12 = NaN(noBlock,param.nbKeys/length(param.seqA));                  % interval12 = duration between 1st and 2nd elements in the seq
interval23 = NaN(noBlock,param.nbKeys/length(param.seqA));                  % interval23 = duration between 2nd and 3rd elements in the seq
interval34 = NaN(noBlock,param.nbKeys/length(param.seqA));                  % interval34 = duration between 3rd and 4th elements in the seq
interval45 = NaN(noBlock,param.nbKeys/length(param.seqA));                  % interval45 = duration between 4th and 5th elements in the seq

seq_results(1,1).IKI_per_trial =NaN(noBlock,param.nbKeys/length(param.seqA));

%From 2nd to last correct seq, the flag will indicate if the sequence is continuous to the previous one
flag_continuous_seq=NaN(noBlock,param.nbKeys/length(param.seqA));           % first column will allways be NaN. 
                                                                            % Expample of two continuous sequences: 4132441324 -- In this case, set the flag to 1
                                                                            % Example of two discontinuous sequences: 413244341324 - notice how the subject made a mistake and then started again -- In this case, set the flag to 0

for i = 1:1:noBlock                                                         % i is used as counter that spans both SEQ and SEQ conditions
    previous_index=[];
    for ii = 1:1:param.nbKeys                                               
        flag_seq_correcta=0;                                                %mientras la flag esta en 0, o no se sabe o la secuencia es incorrecta
        if ii+4 <= param.nbKeys % prevents error msg of exceeding matrix dimensions
            if isempty(previous_index)==1 &&  key(i,ii) == param.seqA(1) && key(i,ii+1) == param.seqA(2) && key(i,ii+2) == param.seqA(3) && key(i,ii+3) == param.seqA(4) && key(i,ii+4) == param.seqA(5)
                % above line checks to make sure the appropriate sequence was executed; only valid for 5-element sequences y que es solo la primera secuencia que encuentra como correcta
                
                if strcmp(flag_ITI,'ITI')== 1
                    if mod(ii+4,5)==0 % o sea que es multiplo de 5 -- concuerda con estar dentro de 1 trial (la seq no tiene iti de por medio)
                        flag_seq_correcta=1;
                    else %la secuencia tiene un ITI de por medio - NO ES ACEPTABLE
                        flag_seq_correcta=0;
                    end
                else
                    flag_seq_correcta=1;
                end
                
                
                if flag_seq_correcta== 1
                    
                    seq_results(1,1).correct(i) = seq_results(1,1).correct(i) + 1;   % if correct sequence, add value of 1 to the count of correct sequences
                    seqduration(i,seq_results(1,1).correct(i)) = data(i,ii+4) - data(i,ii);                   % if correct sequence, determine time it took to complete sequence           
                    previous_index=[ii ii+1 ii+2 ii+3 ii+4];                         %guarda los indices de la primer secuencia correcta

                    %cálculo de los intervalos entre presiones de teclas
                    interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                    interval23(i,seq_results(1,1).correct(i)) = data(i,ii+2) - data(i,ii+1);
                    interval34(i,seq_results(1,1).correct(i)) = data(i,ii+3) - data(i,ii+2);  
                    interval45(i,seq_results(1,1).correct(i)) = data(i,ii+4) - data(i,ii+3); 

                    %IKI= Inter Key Interval
                    seq_results(1,1).IKI_per_trial(i,seq_results(1,1).correct(i))=nanmedian([interval12(i,seq_results(1,1).correct(i)) interval23(i,seq_results(1,1).correct(i)) ...
                       interval34(i,seq_results(1,1).correct(i)) interval45(i,seq_results(1,1).correct(i))]);
               
                end %END IF SEQ_CORRECTA
               
            elseif key(i,ii) == param.seqA(1) && key(i,ii+1) == param.seqA(2) && key(i,ii+2) == param.seqA(3) && key(i,ii+3) == param.seqA(4) && key(i,ii+4) == param.seqA(5)
                                                                           %con la condición  de arriba chequeo que la secuencia sea correcta
                if strcmp(flag_ITI,'ITI')== 1
                    if mod(ii+4,5)==0 % o sea que es multiplo de 5 -- concuerda con estar dentro de 1 trial (la seq no tiene iti de por medio)
                        flag_seq_correcta=1;
                    else %la secuencia tiene un ITI de por medio - NO ES ACEPTABLE
                        flag_seq_correcta=0;
                    end
                else
                    flag_seq_correcta=1;
                end
                
                if flag_seq_correcta== 1
                    previous_index=[previous_index ii ii+1 ii+2 ii+3 ii+4];    %concateno los nuevos indices con los previos
                    previous_index_aux=unique(previous_index);                 %elimino valores repetidos

                    %Si uno es mas corto que el otro significa que la segunda secuencia esta usando las mimas teclas que la primera ya considerada correcta. 
                    %Eso es considerado un error, y no se considrea esta secuencia como correcta.
                    if length(previous_index)==length(previous_index_aux)
                        % como las longitudes son iguales, las secuencias son "independientes" por lo que las dos se consideran correctas
                        seq_results(1,1).correct(i) = seq_results(1,1).correct(i) + 1;   % if correct sequence, add value of 1 to the count of correct sequences

                        %chequeo que la secuencia es continua a la anerior (no hay teclas presionadas entre ellas) - esto me sirve para luego poder calcular los Micro Micro
                        if (previous_index(5)+1)== previous_index(6)            %si el indice del ultimo numero de la seq anterior es consecutivo con el indice del primer numero de esta seq
                            flag_continuous_seq(i,seq_results(1,1).correct(i))=1;
                        else
                            flag_continuous_seq(i,seq_results(1,1).correct(i))=0;
                        end

                        seqduration(i,seq_results(1,1).correct(i)) = data(i,ii+4) - data(i,ii);                   % if correct sequence, determine time it took to complete sequence           
                        previous_index=[ii ii+1 ii+2 ii+3 ii+4];

                        % cálculo de los intervalos entre presiones de teclas
                        interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                        interval23(i,seq_results(1,1).correct(i)) = data(i,ii+2) - data(i,ii+1);
                        interval34(i,seq_results(1,1).correct(i)) = data(i,ii+3) - data(i,ii+2);  
                        interval45(i,seq_results(1,1).correct(i)) = data(i,ii+4) - data(i,ii+3);  

                        % IKI= Inter Key Interval
                        seq_results(1,1).IKI_per_trial(i,seq_results(1,1).correct(i))=nanmedian([interval12(i,seq_results(1,1).correct(i)) interval23(i,seq_results(1,1).correct(i)) ...
                       interval34(i,seq_results(1,1).correct(i)) interval45(i,seq_results(1,1).correct(i))]);

                    end %END IF SAME LENGTH
                end %END IF SEQ_CORRECTA
   
           end % IF loop
                    
%         %Cálculo de promedios por bloque
%         seq_results(1,1).SEQduration(i) = nanmean(seqduration(i,:));       % compute mean of seqduration within each Block (use NaN mean b/c NaN's will be present if errors were made)
%         seq_results(1,1).SEQstandard(i) = nanstd(seqduration(i,:));        % compute mean of seqduration within each Block (use NaN mean b/c NaN's will be present if errors were made)
%         
%         seq_results(1,1).Interval12(i) = nanmean(interval12(i,:));         % Compute mean - excludes NaNs
%         seq_results(1,1).Interval23(i) = nanmean(interval23(i,:)); 
%         seq_results(1,1).Interval34(i) = nanmean(interval34(i,:)); 
%         seq_results(1,1).Interval45(i) = nanmean(interval45(i,:)); 
%         
%         seq_results(1,1).Intervalmean(i) = nanmean([interval12(i,:) interval23(i,:) interval34(i,:) interval45(i,:)]);

        elseif (ii>param.nbKeys-4) && (ii<param.nbKeys) %Si son las ultimas 4 teclas pulsadas
            % GC 17/6/2023
            % en este elseif se pueden evaluar las secuencias que no
            % llegaron a completar porque se cortó el tiempo de bloque.
                        
            cont=1;
            index_max=0;
            while (cont~=0)
                if ii + cont -1 <=param.nbKeys                               % si se encuentra dentro del bloque
                     if key(i,ii+cont -1) == param.seqA(cont)               % si es correcta
                         cont=cont+1;
                         index_max=1;
                     else
                         cont=0;
                         index_max=0;
                     end
                else 
                    cont=0;
                end
            end
            if index_max>0
                clear cont;
            
            if strcmp(flag_ITI,'ITI')== 1
                    if mod(ii+4,5)==0 % o sea que es multiplo de 5 -- concuerda con estar dentro de 1 trial (la seq no tiene iti de por medio)
                        flag_seq_correcta=1;
                    else %la secuencia tiene un ITI de por medio - NO ES ACEPTABLE
                        flag_seq_correcta=0;
                    end
                else
                    flag_seq_correcta=1;
            end
             
            if flag_seq_correcta==1
                if isempty(previous_index)==1                               %primera seq correcta del bloque
                     
                    seq_results(1,1).correct(i) = seq_results(1,1).correct(i) + 1;                                % if correct sequence, add value of 1 to the count of correct sequences
                    seqduration(i,seq_results(1,1).correct(i)) = data(i,ii+index_max) - data(i,ii);               % if correct sequence, determine time it took to complete sequence           

                    %cálculo de los intervalos entre presiones de teclas
                    switch(index_max)
                        case 1
                            interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                            interval23(i,seq_results(1,1).correct(i)) = NaN;
                            interval34(i,seq_results(1,1).correct(i)) = NaN;
                        case 2
                            interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                            interval23(i,seq_results(1,1).correct(i)) = data(i,ii+2) - data(i,ii+1);
                            interval34(i,seq_results(1,1).correct(i)) = NaN;
                        case 3
                            interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                            interval23(i,seq_results(1,1).correct(i)) = data(i,ii+2) - data(i,ii+1);
                            interval34(i,seq_results(1,1).correct(i)) = data(i,ii+3) - data(i,ii+2); 
                    end
                    interval45(i,seq_results(1,1).correct(i)) = NaN; 

                    %IKI= Inter Key Interval
%                     seq_results(1,1).IKI_per_trial_visual(i,seq_results(1,1).correct(i))=nanmean([interval12(i,seq_results(1,1).correct(i)) interval23(i,seq_results(1,1).correct(i)) ...
%                        interval34(i,seq_results(1,1).correct(i)) interval45(i,seq_results(1,1).correct(i))]);

                   seq_results(1,1).IKI_per_trial(i,seq_results(1,1).correct(i))=nanmedian([interval12(i,seq_results(1,1).correct(i)) interval23(i,seq_results(1,1).correct(i)) ...
                       interval34(i,seq_results(1,1).correct(i)) interval45(i,seq_results(1,1).correct(i))]);

                else                                                       %no es la primera correcta del bloque
                    for index=ii:index_max
                        previous_index=[previous_index index];             %concateno los nuevos indices con los previos
                    end
                    previous_index_aux=unique(previous_index);             %elimino valores repetidos

                    %Si uno es mas corto que el otro significa que la segunda secuencia esta usando las mimas teclas que la primera ya considerada correcta. 
                    %Eso es considerado un error, y no se considrea esta secuencia como correcta.
                    if length(previous_index)==length(previous_index_aux)
                        % como las longitudes son iguales, las secuencias son "independientes" por lo que las dos se consideran correctas
                        seq_results(1,1).correct(i) = seq_results(1,1).correct(i) + 1;   

                        %chequeo que la secuencia es continua a la anerior (no hay teclas presionadas entre ellas) - esto me sirve para luego poder calcular los Micro Micro
                        if (previous_index(index_max)+1)== previous_index(index_max+1)            %si el indice del ultimo numero de la seq anterior es consecutivo con el indice del primer numero de esta seq
                            flag_continuous_seq(i,seq_results(1,1).correct(i))=1;
                        else
                            flag_continuous_seq(i,seq_results(1,1).correct(i))=2;
                        end

                        seqduration(i,seq_results(1,1).correct(i)) = data(i,ii+index_max) - data(i,ii);                   % if correct sequence, determine time it took to complete sequence           
                        
                        %cálculo de los intervalos entre presiones de teclas
                        switch(index_max)
                            %Como la secuencia está incompleta, se promedia el intervalo con los de la última secuencia correcta.
                            case 1
                                interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                                interval23(i,seq_results(1,1).correct(i)) = interval23(i,seq_results(1,1).correct(i)-1);
                                interval34(i,seq_results(1,1).correct(i)) = interval34(i,seq_results(1,1).correct(i)-1);
                            case 2
                                interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                                interval23(i,seq_results(1,1).correct(i)) = data(i,ii+2) - data(i,ii+1);
                                interval34(i,seq_results(1,1).correct(i)) = interval34(i,seq_results(1,1).correct(i)-1);
                            case 3
                                interval12(i,seq_results(1,1).correct(i)) = data(i,ii+1) - data(i,ii);
                                interval23(i,seq_results(1,1).correct(i)) = data(i,ii+2) - data(i,ii+1);
                                interval34(i,seq_results(1,1).correct(i)) = data(i,ii+3) - data(i,ii+2); 
                        end
                        interval45(i,seq_results(1,1).correct(i)) = interval45(i,seq_results(1,1).correct(i)-1);
                       
                        seq_results(1,1).IKI_per_trial(i,seq_results(1,1).correct(i))=nanmedian([interval12(i,seq_results(1,1).correct(i)) interval23(i,seq_results(1,1).correct(i)) ...
                       interval34(i,seq_results(1,1).correct(i)) interval45(i,seq_results(1,1).correct(i))]);

%                         %GC para copiar bonstrup 17/6/23
%                         seq_results(1,1).IKI_per_trial_visual(i,seq_results(1,1).correct(i))=nanmean([interval12(i,seq_results(1,1).correct(i)) interval23(i,seq_results(1,1).correct(i)) ...
%                        interval34(i,seq_results(1,1).correct(i)) interval45(i,seq_results(1,1).correct(i))]);

                        
                    end
                end %primera seq correcta
            end %flag_seq_correcta
            end %index_max cont>0       


       end
    end % FOR loop
        
        %Cálculo de promedios por bloque
        seq_results(1,1).SEQduration(i) = nanmean(seqduration(i,:));       % compute mean of seqduration within each Block (use NaN mean b/c NaN's will be present if errors were made)
        seq_results(1,1).SEQstandard(i) = nanstd(seqduration(i,:));        % compute mean of seqduration within each Block (use NaN mean b/c NaN's will be present if errors were made)
        
        seq_results(1,1).Interval12(i) = nanmean(interval12(i,:));         % Compute mean - excludes NaNs
        seq_results(1,1).Interval23(i) = nanmean(interval23(i,:)); 
        seq_results(1,1).Interval34(i) = nanmean(interval34(i,:)); 
        seq_results(1,1).Interval45(i) = nanmean(interval45(i,:)); 
        
        seq_results(1,1).Intervalmean(i) = nanmean([interval12(i,:) interval23(i,:) interval34(i,:) interval45(i,:)]);
end
seq_results.seqduration=seqduration;

%Interkey Matrix
seq_results(1,1).interkey_matrix=[reshape(interval12',1, []); reshape(interval23',1, []); reshape(interval34',1, []); reshape(interval45',1, [])];
seq_results(1,1).interkey_matrix=reshape(seq_results(1,1).interkey_matrix,[],1)';
clear i; clear ii; clear previous_index; clear flag_seq_correcta; clear previous_index_aux;

%% Filtrado y/o normalizado de intervalos
% Ult Modific: 19/5/23 GC
seq_results(1,1).intervalo_12=interval12;
seq_results(1,1).intervalo_23=interval23;
seq_results(1,1).intervalo_34=interval34;
seq_results(1,1).intervalo_45=interval45;
addpath('C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\experiments');

%Filtro
if seq_results(1,1).flag_filt==1
    [interval12_corr,interval23_corr,interval34_corr,interval45_corr,cant_puntos_total]= Id_corr_Interkey(interval12,interval23,interval34,interval45,fname,path);
    seq_results(1,1).IKI_per_trial_corr=NaN(noBlock,param.nbKeys/length(param.seqA));
    % IKI
    for i=1:noBlock
        for j=1:(param.nbKeys/length(param.seqA))
            seq_results(1,1).IKI_per_trial_corr(i,j)=nanmedian([interval12_corr(i,j) interval23_corr(i,j) interval34_corr(i,j) interval45_corr(i,j)]);
        end
    end
    %Interkey matrix
    seq_results(1,1).interkey_matrix_corr=[reshape(interval12_corr',1, []); reshape(interval23_corr',1, []); reshape(interval34_corr',1, []); reshape(interval45_corr',1, [])];
    seq_results(1,1).interkey_matrix_corr=reshape(seq_results(1,1).interkey_matrix_corr,[],1)';

    seq_results(1,1).puntos_filtrados=cant_puntos_total;
end

%Normalización
if seq_results(1,1).flag_norm==1
    if seq_results(1,1).flag_filt==1
        % si antes se hizo un filtrado, normalizo los intervalos corregidos
        [interval12_corr,interval23_corr,interval34_corr,interval45_corr,seq_results(1,1).IKI_per_trial_corr] = Id_Norm_Interkey(interval12_corr,interval23_corr,interval34_corr,interval45_corr,seq_results(1,1).IKI_per_trial_corr,fname,path,seq_results(1,1).flag_tipo_norm);
    else 
        %si antes no se hizo un filtrado, normalizo la data cruda
        [interval12_corr,interval23_corr,interval34_corr,interval45_corr,seq_results(1,1).IKI_per_trial_corr] = Id_Norm_Interkey(interval12,interval23,interval34,interval45,seq_results(1,1).IKI_per_trial,fname,path,seq_results(1,1).flag_tipo_norm);
    end
end

if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt==1
    seq_results(1,1).intervalo_12_corr=interval12_corr;
    seq_results(1,1).intervalo_23_corr=interval23_corr;
    seq_results(1,1).intervalo_34_corr=interval34_corr;
    seq_results(1,1).intervalo_45_corr=interval45_corr;
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 5: LEARNING ANALYSIS                                        %%%
%%%                                                                     %%%
%%% MOGS: MICRO OFFLINE GAINS. Diferencia entre el iki de la ultima     %%%
%%% secuencia del bloque con el iki de la primer secuencia del siguiente%%% 
%%% bloque.                                                             %%%
%%%                                                                     %%%
%%% MONGS: MICRO ONLINE GAINS. Diferncia entre el iki de la primer      %%%
%%% secuencia del bloque con el iki de la ultima secuencia del mismo bloque
%%%                                                                     %%%
%%% TOTAL LEARNING: diferencia entre el iki de la primer secuencia del  %%%
%%% bloque con el iki de la primera secuencia del siguiente bloque.     %%%
%%%                                                                     %%%
%%% MicroMOGS: iki de las dos ultimas teclas de la secuencia con el iki %%%
%%% de las dos primeras teclas de la secuencia siguiente. Està separado %%%
%%% por el ITI.                                                         %%%
%%%                                                                     %%%
%%% MicroMONGS: iki de las primeras dos teclas de la secuencia con el   %%%
%%% iki de las dos ultimas teclas de la secuencia. En el caso de haber  %%%
%%% ITI espuramente ONLINE.                                             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
addpath('C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\experiments')

% MICRO GAINS CRUDO
[seq_results(1,1).MOGS,seq_results(1,1).MONGS,seq_results(1,1).Total_Learning] = Micro_gains_key(seq_results(1,1).IKI_per_trial,noBlock);
% MICRO MICRO CRUDO
[seq_results(1,1).MicroMOGS,seq_results(1,1).MicroMONGS] = Micro_Micro_gains_key(interval12,interval45,flag_continuous_seq);

if seq_results(1,1).flag_norm==1 || seq_results(1,1).flag_filt==1
    % MICRO GAINS CORREGIDO
    [seq_results(1,1).MOGS_corr,seq_results(1,1).MONGS_corr,seq_results(1,1).Total_Learning_corr] = Micro_gains_key(seq_results(1,1).IKI_per_trial_corr,noBlock);
    % MICRO MICRO CORREGIDO
    %[seq_results(1,1).MicroMOGS_corr,seq_results(1,1).MicroMONGS_corr]= Micro_Micro_gains_key(interval12_corr,interval45_corr,flag_continuous_seq);
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 6: GENERATE FIGURES                                         %%%
%%% Section will generate plots of the appropriate dependent variables  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

seq_results=Plot_Individual_Figures(seq_results,path,fname);

%% Save seq_results structure
 
%save([param.outputDir fname(1:end-4) '_results.mat'],'seq_results');
save([path fname(1:end-4) '_results.mat'],'seq_results');