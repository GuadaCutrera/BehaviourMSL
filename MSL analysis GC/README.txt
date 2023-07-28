%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%		ANÁLISIS DE SUJETOS DE FORMA INDIVIDUAL          %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Analisis_Seq_Individual: posicionarse en esta función y correr el
script. Se despliega una ventana en la que se elije el .mat a 
analizar. El archivo .mat debe ser aquel que diga "task" de MSL. 
Este script permite analizar el protocolo de GG y FJ en el cual 
no hay ITI y el protocolo de GC que sí los tiene. 
Para el protocolo de tiempo, la dinámica es la misma pero se utiliza la función Analisis_Seq_Individual_TIME. 
Esta función llama a:
	- Remove_Simultaneous_keyPresses
	- Micro_gains_key
	- Micro_Micro_gains_key
	- Id_Filt_Interkey
	- Id_Norm_Interkey
	- Plot_Individual_Figures
	- Visualization_LearningCurva

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%		ANÁLISIS DE SUJETOS DE FORMA GRUPAL		       %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

LoadSubjects u otro script debe cargar todos los _results.mat de los 
sujetos que se quieran analizar de forma grupal. Se le pasan como 
parámetro (array de structs) a ID_RunAnalysisGroup2
que va a calcular media y desvío de cada tipo de variable que haya 
almacenada en seq_results (al que se accede mediante _results.mat)
Este script llama a:
	- Plot_Grupal_Figures
	- BlockDur_vs_MicroGains
	- CorreacionPlot
	- Learning_print
	- tapping_speed
	- Visualization_Learning_Grupal
