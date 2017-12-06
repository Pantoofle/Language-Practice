-module('exo03').
-export([]).

% ----- Question 1 ------

%a. -----
% Un thead est un enchainement d'instructions suivant un programme. Mais il peut exister plusieurs threads en même temps, alors ces threads agissent en même temps sur les objets externes au thread (souvent la mémoire)
% Lors du lancement d'un programme, les instructions à faire sont placées dans un thread.

% b. -----
% Pour lancer un thread, on utilise la fonction spawn. Elle peut être utilisée ainsi :

F = fun(X) -> X+1 end.      
Thread_F = spawn(F).
% Créé un nouveau thread, contenant la fonction F. Son PID est enregistré dans Thread_F.

Thread_F2 = spawn()

 
