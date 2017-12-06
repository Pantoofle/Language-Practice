
(* Dans cette fiche, on vous demande de programmer des fonctions
   récursives sur les listes de Caml. Les listes en elles-mêmes sont
   une structure de données comme une autre, mais ce qui vous est
   demandé est emblématique d'une manière de programmer que l'on
   rencontre souvent en Caml. *)

(* On est au royaume des fonctions récursives: si vous voyez une
   solution où vous commenceriez par recopier la liste dans un
   tableau, puis la parcourriez en faisant des boucles "for", vous
   pouvez la coder, mais efforcez-vous quand même de faire la version
   récursive, qui est ce que l'on vous demande. *)



(* construit une liste de singletons de même taille que l, avec un
   singleton par élément de l. Ainsi, singletons [2;5;3] doit renvoyer
   [[2];[5];[3]] *)
let rec singletons l =
  match l with
  | []   -> []
  | x::t -> [x]::(singletons t)

(* renvoie la liste passée en argument, en ne gardant qu'une copie des
   éléments qui apparaissent plusieurs fois *)

(* version 1: si x apparaît plusieurs fois dans la liste, c'est la
   première occurrence de x qui est gardée *)
                   
let rec elimine_doublons1_aux l l1 =
  match l with
  | [] -> []
  | x::q ->
     if(List.exists (fun a -> x=a;) l1) then elimine_doublons1_aux q l1
     else x::(elimine_doublons1_aux q (x::l1));;

let elimine_doublons1 l =
  elimine_doublons1_aux l [];;

(* version 2: c'est ici la dernière occurrence de x qui est gardée *)
let rec elimine_doublons2 l =
  match l with
  | [] -> []
  | x::q ->
     let l1 = elimine_doublons2 q in
     if(List.exists (fun a -> x=a;) l1) then l1
     else x::l1;;

(* version 3: c'est la version "médiane" de x qui est gardée,
   autrement dit, si x apparaît k fois, on garde la k/2-ème occurrence
   de x *)
let elimine_doublons3 f =
  

let l0 = [1;4;3;2;4;1;5;4;3;7;4;2;1]

let _ = elimine_doublons1 l0
let _ = elimine_doublons2 l0
let _ = elimine_doublons3 l0


(* Renvoie la liste de toutes les sous-listes de la liste passée en
   argument. Une sous-liste est obtenue en retirant des éléments de la
   liste de départ. Vous pouvez faire l'hypothèse que tous les
   éléments sont distincts deux à deux.
*)

let sous_listes = ()


(* renvoie la liste de toutes les permutations des éléments de la
   liste passée en argument. Vous pouvez faire l'hypothèse que tous
   les éléments sont distincts deux à deux. *)

let perms = ()






(* Partie 2 : avec les combinateurs de listes *)

(* Regardez la documentation de la librairie List (dans la librairie
   standard), et comprenez en particulier ce que font List.map,
   List.fold_left, List.fold_right, List.iter et List.flatten (on les
   appelle parfois des "combinateurs de listes" *)

(* Codez les fonctions de la partie 1 en vous appuyant sur les
   combinateurs de listes. La règle du jeu est que l'on essaye
   d'écrire le moins possible de "let rec", ce sont les combinateurs
   qui "récurent" pour vous. *)
