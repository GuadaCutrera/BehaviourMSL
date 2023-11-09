%%% Esta funcion permite ver el logoriginal como si fuese una matriz. Darle
%%% RUN directamente y te deja elegir la carpeta y el .mat a analizar. 
%%% poner un breakpoint al final para poder observar todos los parámetros. 
%%% es una funcion muy util para corregir algun sujeto que por ejemplo la
%%% botonera le jugó una mala pasada y en algun bloque le salieron "33"
%%% seguidos pero el indice del ITI lo tomaría mal. En la carpeta de output
%%% hay varios ejemplos de sujetos que corregí. Podes comparar sus
%%% logoriginal y fijarte donde "borre" un numero para no perder el sujeto
%%% completo.

function Ver_Logoringial()

if nargin < 1
    i_Dir = '';
end
addpath('C:\Users\physi\Documents\Guada_2022\MSL guada\Task_MSL\stim-master\experiments\MSL analysis GC');

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% SECTION 1: INPUT DATA FILE %                                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[fname,path]=uigetfile([ i_Dir   '*.mat'], 'Choose a file to analyse');
if fname == 0
    return;
end
load(strcat(path,fname));

flag_ITI=''; %Protocolo Guada
if strfind(fname,'sin_ITI')
    param.seqA = param.seqA; %#ok<NODEF>
    param.task = 'Task sin ITI';
    param.nbBlocks = param.nbBlocksWithITI;
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

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 2: EXTRACT DATA FROM 'LOGORIGINAL' STRUCTURE %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 logoriginal_matrix=table('Size',[length(logoriginal) 4],'VariableTypes',{'double','string','double','double'});

for nLine=1:length(logoriginal)
    logoriginal_matrix{nLine,1}=str2double(logoriginal{nLine}{1});
    logoriginal_matrix{nLine,2}=categorical(cellstr(logoriginal{nLine}{2}));
    if size(logoriginal{nLine},2)==3
        logoriginal_matrix{nLine,3}=str2double(logoriginal{nLine}{3});
    end
    if nLine>1
        logoriginal_matrix{nLine,4}=logoriginal_matrix{nLine,1}- logoriginal_matrix{nLine-1,1};
    end
end

new_logoriginal=Remove_Simultaneous_keyPresses(logoriginal);


new_logoriginal_matrix=table('Size',[length(new_logoriginal) 4],'VariableTypes',{'double','string','double','double'});

for nLine=1:length(new_logoriginal)
    new_logoriginal_matrix{nLine,1}=str2double(new_logoriginal{nLine}{1});
    new_logoriginal_matrix{nLine,2}=categorical(cellstr(new_logoriginal{nLine}{2}));
    if size(new_logoriginal{nLine},2)==3
        new_logoriginal_matrix{nLine,3}=str2double(new_logoriginal{nLine}{3});
    end
    if nLine>1
        new_logoriginal_matrix{nLine,4}=new_logoriginal_matrix{nLine,1}- new_logoriginal_matrix{nLine-1,1};
    end
end


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

