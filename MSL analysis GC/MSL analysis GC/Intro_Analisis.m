%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Esta funcion permite analizar la intro de los sujetos. La consigna fue:
%%% "Este es un espacio para que te familiarices con la tarea, que surjan
%%% dudas y que podamos controlar el correcto uso del teclado/botonera y la
%%% postura que vas a mantener en toda la tarea".                         
%%% La instrucción fue que realicen 3 secuencias correctas (con o sin ITI,
%%% dependiendo del protocolo).
%%% Este análisis nos sirve para poder visualizar el verdadero primer punto
%%% del sujeto. En dónde empieza su curva de learning REAL.                
%%% Cuento la cantidad de secuencias totales que hizo en la INTRO por sobre
%%% las 3 correctas que debía hacer. Para el análisis sólo pongo foco en
%%% las correctas.
%%% Contemplar que en estas secuencias, puede hacer pausas con preguntas, o
%%% casos en los que les acomodé la mano/postura, o les realice
%%% correcciones.
%%%                             GC 11/10/23
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function seq_results=Intro_Analisis(i_Dir,fname)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 1: INPUT DATA FILE %                                         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if nargin < 1
    i_Dir = '';
    [fname,path]=uigetfile([ i_Dir   '*.mat'], 'Choose a file to analyse');
    load(strcat(path,fname));
else
    load(i_Dir);
end

if fname == 0
    return;
end


flag_ITI=''; %Protocolo Guada
if strfind(fname,'sin_ITI')
    param.seqA = param.seqA; %#ok<NODEF>
    param.task = 'Task sin ITI';
elseif strfind(fname, 'con_ITI')
    param.seqA = param.seqA; %#ok<NODEF>
    param.task = 'Task con ITI';
    flag_ITI='ITI'; % Indica que el protocolo contiene un ITI entre secuencias
elseif strfind(fname,'Day_One') %PROTOCOLO GUILLE Y FLOR
    param.seqA = param.seqA; %#ok<NODEF>
    param.task = 'Task day one';
else
    msgbox('Wrong input, this task can´t be analysed by this script')
    %En este caso, chequear los nombres de las variables. Si dicen DayOne
    % o DayTwo por ejemplo. 
    return
end

%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 2: EXTRACT DATA FROM 'LOGORIGINAL' STRUCTURE                %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
index = 1;  

for nLine = 1:length(logoriginal) 
    if strcmp(logoriginal{nLine}{2}, 'rep')   
            data(index) = str2double(logoriginal{nLine}{1});            % tiempo    
            key(index) = str2double(logoriginal{nLine}{3});             % key
            index = index + 1;                                          % contador de teclas    
        
    end
end
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SECTION 3: COMPUTING DEPENDENT VARIABLES ACCURACY AND SEQ DURATION  %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Preallocate; sets variable with dimensions # SEQ Blocks x THE NUMBER OF SEQUENCE REPETITIONS WITHIN A GIVEN Block (I.E., KEY PRESSES / NUMBER OF ELEMENTS IN THE SEQUENCE);
seq_results(1,1).interval12 = NaN(1,3);                  % interval12 = duration between 1st and 2nd elements in the seq
seq_results(1,1).interval23 = NaN(1,3);                  % interval23 = duration between 2nd and 3rd elements in the seq
seq_results(1,1).interval34 = NaN(1,3);                  % interval34 = duration between 3rd and 4th elements in the seq
seq_results(1,1).interval45 = NaN(1,3);                  % interval45 = duration between 4th and 5th elements in the seq
seq_results(1,1).IKI_per_trial=NaN(1,3);
flag_continuous_seq=NaN(1,3);           % para Micro Micro
seq_results(1,1).correct=0;
previous_index=[];
seq_results(1,1).seqduration=NaN(1,3);;

for ii = 1:length(data)
    
    flag_seq_correcta=0;
        if ii+4 <= length(data)                          
            if isempty(previous_index)==1 &&  key(ii) == param.seqA(1) && key(ii+1) == param.seqA(2) && ...
                    key(ii+2) == param.seqA(3) && key(ii+3) == param.seqA(4) && key(ii+4) == param.seqA(5)
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
                    
                    seq_results(1,1).correct = seq_results(1,1).correct + 1;   % if correct sequence, add value of 1 to the count of correct sequences
                    seq_results(1,1).seqduration(seq_results(1,1).correct) = data(ii+4) - data(ii);                   % if correct sequence, determine time it took to complete sequence           
                    previous_index=[ii ii+1 ii+2 ii+3 ii+4];                         %guarda los indices de la primer secuencia correcta

                    %cálculo de los intervalos entre presiones de teclas
                    seq_results(1,1).interval12(seq_results(1,1).correct) = data(ii+1) - data(ii);
                    seq_results(1,1).interval23(seq_results(1,1).correct) = data(ii+2) - data(ii+1);
                    seq_results(1,1).interval34(seq_results(1,1).correct) = data(ii+3) - data(ii+2);  
                    seq_results(1,1).interval45(seq_results(1,1).correct) = data(ii+4) - data(ii+3); 

                    %IKI= Inter Key Interval
                    seq_results(1,1).IKI_per_trial(seq_results(1,1).correct)=nanmedian([seq_results(1,1).interval12(seq_results(1,1).correct) seq_results(1,1).interval23(seq_results(1,1).correct) ...
                       seq_results(1,1).interval34(seq_results(1,1).correct) seq_results(1,1).interval45(seq_results(1,1).correct)]);
                 
                 end %END SEQ CORRECTA
            elseif key(ii) == param.seqA(1) && key(ii+1) == param.seqA(2) && ...
                    key(ii+2) == param.seqA(3) && key(ii+3) == param.seqA(4) && key(ii+4) == param.seqA(5)
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
                    previous_index=[previous_index ii ii+1 ii+2 ii+3 ii+4]; %concateno los nuevos indices con los previos
                    previous_index_aux=unique(previous_index);              %elimino valores repetidos
                    
                     %Si uno es mas corto que el otro significa que la segunda secuencia esta usando las mimas teclas que la primera ya considerada correcta. 
                    %Eso es considerado un error, y no se considrea esta secuencia como correcta.
                    if length(previous_index)==length(previous_index_aux)
                        % como las longitudes son iguales, las secuencias son "independientes" por lo que las dos se consideran correctas
                        seq_results(1,1).correct = seq_results(1,1).correct + 1;   % if correct sequence, add value of 1 to the count of correct sequences

                        %chequeo que la secuencia es continua a la anerior (no hay teclas presionadas entre ellas) - esto me sirve para luego poder calcular los Micro Micro
                        if (previous_index(5)+1)== previous_index(6)            %si el indice del ultimo numero de la seq anterior es consecutivo con el indice del primer numero de esta seq
                            flag_continuous_seq(seq_results(1,1).correct)=1;
                        else
                            flag_continuous_seq(seq_results(1,1).correct)=2;
                        end

                        seq_results(1,1).seqduration(seq_results(1,1).correct) = data(ii+4) - data(ii);                   % if correct sequence, determine time it took to complete sequence           
                        previous_index=[ii ii+1 ii+2 ii+3 ii+4];

                        % cálculo de los intervalos entre presiones de teclas
                        seq_results(1,1).interval12(seq_results(1,1).correct) = data(ii+1) - data(ii);
                        seq_results(1,1).interval23(seq_results(1,1).correct) = data(ii+2) - data(ii+1);
                        seq_results(1,1).interval34(seq_results(1,1).correct) = data(ii+3) - data(ii+2);  
                        seq_results(1,1).interval45(seq_results(1,1).correct) = data(ii+4) - data(ii+3);  

                        % IKI= Inter Key Interval
                        seq_results(1,1).IKI_per_trial(seq_results(1,1).correct)=nanmedian([seq_results(1,1).interval12(seq_results(1,1).correct) seq_results(1,1).interval23(seq_results(1,1).correct) ...
                       seq_results(1,1).interval34(seq_results(1,1).correct) seq_results(1,1).interval45(seq_results(1,1).correct)]);
                        
               
                    end %END IF SAME LENGTH
                    
                end %END SEQ CORRECTA
                
            end %END IF PREVIOUS INDEX 
        end %END I+4
    
end
seq_results(1,1).seq_totales=length(key)/5;

[seq_results(1,1).MicroMOGS,seq_results(1,1).MicroMONGS] = Micro_Micro_gains_key(seq_results(1,1).interval12,seq_results(1,1).interval45,flag_continuous_seq);

