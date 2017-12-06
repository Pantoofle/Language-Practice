% ----- Question 1 ------

% a. -----
% Un thead est un enchainement d'instructions suivant un programme. 
% Mais il peut exister plusieurs threads en même temps, 
% alors ces threads agissent en même temps sur les objets externes au thread (souvent la mémoire)
% Lors du lancement d'un programme, les instructions à faire sont placées dans un thread.

% b. -----
% Pour lancer un thread, on utilise la fonction spawn. Elle peut être utilisée ainsi dans le shell:

% F = fun() -> 12+1.      
% Thread_F = spawn(F).
% Créé un nouveau thread, contenant la fonction F. Son PID est enregistré dans Thread_F.

% Thread_F2 = spawn(node, F). avec node le node souhaité (l'instance d'Erlang souhaitée)

% Thread_F3 = spawn(module, Fonction, arguments) avec mmodule le modulle de Fonction, et Argument les arguments à fournir à Fonction

% Thread_F4 = spawn(node, module, Fonction, arguments).


% ------ Question 2 -----

% a. -----
% <0.41.0> est le PID, c'est le numéro du thread créé. C'est ainsi qu'on y fera référence par la suite. Pour envoyer une information à un thread donné, il faut son PID. 

% b. -----
% L'identifiant du thread courant est donné par la fonction self() du module erlang


% ------ Question 3. ------

% a. -----
% Pour envoyer des messages à un thread, on utilise le caractère '!'. 
% Donc si on veut envoyer "Bonjour" au thread Thr, on écrit :
% Thr ! "Bonjour".

% b. -----
% Un thread reçoit ces messages avec le mot clé 'receive', qui fonctionne comme un 'case' :
-module('exo03').
-export([exemple/0, listener/0, listener_impatient/0, main_simple/1, ping/1, pong/0, principal/3, main_moyen/2, main_difficile/2, links/1, last_link/0, first_link/2]).

exemple() ->
    receive
        3 -> 3;
        [A, B] -> A+B;
        A -> A
     end.
         
% ------ Question 4. ------

% a. -----
% La fonction listener/0 est lançée dans le thread, elle tombe sur le mot "receive". 
% Elle attend donc de recevoir un parametre. Lors du premier appel de Pid ! 'Atomic' ,
%  elle reçoit ce parametre, l'affiche, et poursuit son éxecution. Elle arrive à la fin de
%  la fonction, elle n'attend donc plus rien. DOnc lors du 2e appel, la fpnction ne renvoit
%  rien car elle n'écoute pas avec un receive. Si on ajoutait un second receive après le premier,
%  la fonction répondrai 2 fois, mais pas 3. Il faut donc un receive par message. 
% Il va donc falloir mettre une boucle en place pour que la fonction attende un nouveau 
% message, même après le premier

listener() ->   
    receive 
        X -> io:fwrite("[~w] ~s~n", [self(), X]),
             listener()
    end.
 
% b. ------
% Pour "réarmer" le listener après une réception, on peut demander à la fonction de se relancer.


% c. ------
% Pour fermer le thread, il faut lui envoyer un message qui déclenchera la fermeture.
% Mais utiliser un mot clé comme 'exit' ou 'stop', ou même le Pid du thread fait qu'on ne peut pas envoyer ces 
% mots dans un appel classique. Il faut donc soit appeler un autre Thread dont le rôle est de fermer les autres, ou alors de mettre une condition pour que le thread se ferme lui-même après un certain temps d'inactivité, ou alors décider de saccrifier une entrée possible pour forcer le thread à se fermer.

% ------ Question 5 -----
% Pour pouvoir répondre à un message, il faut avoir le PID de l'expéditeur, donc il faut joindre
% le Pid à toutes les communications, et envoyer la réponse au Pid de l'expéditeur.
% On ajoute donc une sorte de signature à chaque message.

% ----- Question 6 ------
% Pour éviter un blockage, on utilise le mot clé 'after'. la syntaxe est la suivante : 
 listener_impatient() ->   
    receive 
        X -> io:fwrite("[~w] ~s~n", [self(), X]),
             listener_impatient()
    after
        % 100 est le temps en ms.
        % La suite s'effectue si rien n'a été reçu après 100 ms.
        100 -> exit(self())
    end.

% ------ Exercice ------
% SIMPLE -----
pong() ->
    receive
        From -> io:fwrite("[~w] -> Je renvois la balle ! ~n", [self()]),
                From ! self(),
                pong()
     end.

ping(N) ->
    case N of 
        0 -> io:fwrite("On a fait assez d'échange, j'arrête ~n"),
             exit(self());
        N -> 
            receive
                Target -> io:fwrite("[~w] (P) -> J'envois la balle ! ~n", [self()]),
                          Target ! self(),
                          ping(N-1)
            end
     end.
                  
             
main_simple(N) -> spawn(exo03, ping, [N]) ! spawn(exo03, pong, []).


% MOYEN -----

principal(L_init, L_actu, N) ->
    case L_actu of
        [] ->
            case N of
                0 -> io:fwrite("Principal : On a assez joué ! Je m'en vais ~n"),
                     exit(self());
                N -> io:fwrite("Tour fini! Plus que ~w à faire, on reset les cibles et on repart ~n", [N-1]),
                     principal(L_init, L_init, N-1)
            end;
        [H|T] -> io:fwrite("Principal : J'envois à ~w ~n", [H]),
                 H ! self(),
                 receive
                     _ -> io:fwrite("Principal : J'ai ! ~n")
                 after
                     1000 -> io:fwrite("Principal : Pas de réponse ? Bah je m'en vais alors..."),
                             exit(self())
                 end,
                 principal(L_init, T, N)
    end.
    
make_sec(0) -> [];
make_sec(Nb) -> [spawn(exo03, pong, []) | make_sec(Nb-1)].
   
main_moyen(N, Nb_sec) -> L = make_sec(Nb_sec),
                         spawn(exo03, principal, [L, L, N] ).
                                             

% DIFFICILE ------

links(Target)->
    receive
        First_PID -> io:fwrite("[~w] : J'ai ! Je fais passer ~n", [self()]),
                     Target ! First_PID,
                     links(Target)
    after
        1000 -> io:fwrite("[~w] : Plus de balle ? Je m'en vais alors ~n", [self()])
    end.

first_link(Target, N) ->
    receive 
        _ -> case N of
                 0 -> io:fwrite("Princ : On a fini, je sors ~n"),
                      exit(self());
                 N -> io:fwrite("Princ : Tour fini, plus que ~w. Je lance la suite ~n", [N]),
                      Target ! self(),
                      first_link(Target, N-1)
              end
     end.

last_link() ->
    receive
        First_PID -> io:fwrite("[~w] : J'ai ! Je fais passer au premier ~n", [self()]),
                     First_PID ! "Le token",
                     last_link()
    after
        1000 -> io:fwrite("[~w] : Plus de balle ? Je m'en vais alors ~n", [self()])
    end.
            
make_links(0, Last_PID) -> Last_PID;                    
make_links(N, Last_PID) -> make_links(N-1, spawn(exo03, links, [Last_PID])). 
    
main_difficile(N, Nb) ->
    Last = spawn(exo03, last_link, []),
    Sec = make_links(Nb, Last),
    Main = spawn(exo03, first_link, [Sec, N]),
    Main ! "Go !".
            

% ------ Question 7 ------
% RAS     
