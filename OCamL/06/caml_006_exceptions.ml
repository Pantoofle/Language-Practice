(* Petit interlude: l'égalité en Caml ********************************)

1 = 1.0;;

(* Ceci n'est pas ce qu'on voudrait écrire : comprenez pourquoi le type retourné nous l'indique. *)
let b1 = fun x -> x  =  fun k -> k+0
(* Prend une fonction x et regarde si elle vaut fun k -> k+0*)
                                     
(* Ceci est ce qu'on voulait écrire : réfléchissez à la réponse de Caml. *)
let b2 = (fun x -> x) == fun k -> k+0
(* Double égal ! *)
                                      
(* L'égalité est-elle réflexive en Caml ? *)
let b3 = (fun a -> a) == (fun a -> a)
(* Non *)



(**********************************************************************)
(* Sauter dans les programmes: les exceptions *)


exception Impossible

let e1 = Impossible

exception PasPossible

let e2 = PasPossible

exception Rate

let toto x =
  if x>0
  then 3
  else raise Rate;;

toto (-1);;
             
let g n =
  if (toto n) = 2 then "bonjour" else "salut"


let gere_g x =
  try
    g x
  with Rate -> "trois"





let inv x =
  if x <> 0. then 1. /. x
  else raise Impossible


let p = inv 2.
let q = inv 0.

(* comportement `inné' de Caml *)
let x = 1./.0.
let y = 1/0

let divise x y =
  try
    let z = inv y in
      x *. z
  with
  | Impossible -> raise PasPossible


let enveloppe f x = try f x with | Impossible -> raise PasPossible



let f x = if x then 3 else failwith "je m'en vais"

let a = f false


(* En réalité, Caml connaît l'exception Failure of string *)
(* et "failwith s" est un synonyme de "raise (Failure s)" *)


(* Définir une fonction mult_list : int list -> int, qui renvoie le
   produit de tous les entiers contenus dans la liste (et renvoie 1 si la
   liste est vide). Une exception devra être levée si la liste contient 0
   (pourquoi?) *)

exception ContientZero
          
let rec mult_list l =
  match l with
  | [] -> 1;
  | x::t -> if (x == 0) then raise ContientZero
            else
              try
                x*(mult_list t)
              with
              | ContientZero -> raise ContientZero ;;
                                      
(* Définir une fonction doublons : 'a list -> bool, qui teste si une
   liste contient des doublons.

   La fonction devra procéder de la manière suivante : au fur et à
   mesure qu'on avance dans la liste, on construit une liste triée des
   éléments rencontrés jusque là. Si on tombe sur un élément déjà
   rencontré, on lève une exception.

   Pour trier les éléments, vous pourrez utiliser "<", qui en Caml
   peut être utilisé avec de nombreux types (mais vous ne pourrez pas
   manipuler des listes de fonctions, par exemple).

   La liste des éléments rencontrés pourra être stockée dans une
   référence, ou bien passée lors d'appels récursifs.
*)
exception Doublon
  
let rec insere x l =
  match l with
  | [] -> [x];
  | a::t ->
     if (a == x) then raise Doublon
     else
       if (a < x)
       then a::(insere x t)  
       else x::l 
  
let rec doublons_ l vus =
  match l with
  | [] -> false
  | x::t ->
     doublons_ t (insere x vus)
     

let doublons l = doublons_ l [];;

  
