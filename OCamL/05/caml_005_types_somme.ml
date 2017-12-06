

(**********************************************************************)

(* Définir ses propres types / structures de données. *)

(* Les tuples *)
type personne = string*int*string

(* Les virgules sont le pendant des étoiles : *)
let don = ("Donald",25,"Walt Disney")

(* On peut indiquer le type explicitement (que se passe-t-il si on
   omet ":personne" ci-dessous ?).. *)
            (*Si on ommet :personne, et s'il y avait un autre tuple avec les mêmes types, camL n'aurait pas su au quel il appartient *)
let mick:personne = ("Mickey",62,"California")

(* Les tuples permettent d'agréger des types pré-existants.
   On peut aussi définir son propre type :  *)
type coup = Poum | Tchak | Paf


(* On définit une fonction prenant un "coup" en argument.
   La construction "match.. with.." fait ce qu'on appelle du filtrage. *)
let valse : coup -> string = fun p -> match p with
  | Poum -> "1er temps"
  | Tchak -> "2eme ou 3eme temps"
  | Paf -> "le batteur est nul"












type float_inf = Nombre of float | Infini

let i = Infini
let f = 3.5
let fi = Nombre 3.5

(* Nombre et Infini sont appelés des "constructeurs".
   Un constructeur n'est pas une fonction!! *)
let n = Nombre


(* Devinez le type de "nomb" avant de demander à Caml. *)
(* float -> float_inf*)
let nomb x = Nombre x



let inverse x = match x with
  | (Nombre f) -> if f<>0. then (Nombre (1./.f)) else Infini
  | Infini -> Nombre 0.


(* Un type avec 7 constructeurs. *)
type jour = Lundi | Mardi | Mercredi | Jeudi | Vendredi | Samedi | Dimanche

let weekend d = match d with
  | Samedi -> true
  | Dimanche -> true
  | _ -> false

(* On peut aussi écrire : *)
let we d = match d with
| Samedi | Dimanche -> true
| _ -> false

(* Il faut traiter tous les cas: comprendre le message affiché ici par Caml : *) 
let numero_jour d = match d with
  | Lundi -> 1
  | Mardi -> 2
  | Mercredi -> 3
  | Jeudi -> 4
  | Vendredi -> 5
  | Samedi -> 6
  | Dimanche -> 7           

(* ..et si on persiste a travailler avec une definition incomplète : *)
let k = numero_jour Jeudi




type nombre = Entier of int | Flottant of float

(* On utilise ici la fonction "float : int -> float" de Caml;
   comprendre que l'on fait du filtrage sur le --couple-- (x,y) *)
let rec somme x y = match (x,y) with
  | (Entier n,Flottant m) -> Flottant ((float n)+.m)
  | (Entier n,Entier m) -> Entier (n+m)
  | (Flottant n,Flottant m) -> Flottant (n+.m)
  | _ -> somme y x





(* Pour information, un type qui pré-existe en Caml, pour définir des
   fonctions partielles *)
type 'a option = None | Some of 'a

let a = Some 3

let b = Some "bonjour"

let c = Some (Some 3)

let tete_liste l = match l with
  | [] -> None
  | x::_ -> Some x



(* Récursion dans les definitions de types: arbres binaires *)
type arbre = Feuille | Noeud of (int*arbre*arbre)

(* On ajoute un noeud "au hasard" *)
let rec ajoute_noeud a k = match a with
  | Noeud (k',a1,a2) ->
    if Random.int 2 = 0   (* on appelle la fonction "int" de la librairie Random *)
    then Noeud (k',ajoute_noeud a1 k, a2)
    else Noeud (k',a1,ajoute_noeud a2 k)
  | Feuille -> Noeud (k,Feuille,Feuille)


(* NB: les listes, qui ont été vues précédemment, sont également définies de cette manière;
   une liste est
   - soit la liste vide, []
   - soit un élément suivi d'une liste, x::xs  *)


(* Définir la fonction qui construit un arbre à partir d'une liste
   d'entiers, et une fonction qui extrait la liste des éléments à
   partir d'un arbre *)

let rec list2tree l = match l with
  | [] -> Feuille
  | x::r -> ajoute_noeud (list2tree r) x 

let rec tree2list t = match t with
  | Feuille -> []
  | Noeud(x, g, d) -> x::((tree2list g)@(tree2list d))




(* Plus difficile: définir un type correspondant à la représentation
   des entiers naturels en notation binaire. *)
type bin = Zero | Un
type bin_int = Unique of bin | Multiple of bin_int*bin

(* definir les fonctions de conversion *)
let rec bin_int_2_int bi = match bi with
  | Unique Zero -> 0
  | Unique Un -> 1
  | Multiple (r, Zero) ->
     2 * (bin_int_2_int r)
  | Multiple (r, Un) ->
     2 * (bin_int_2_int r) + 1

                               
let rec bin_int_2_list k = match k with
  | Unique Zero -> [0]
  | Unique Un -> [1]
  | Multiple (r, Zero) ->
     0::(bin_int_2_list r)
  | Multiple (r, Un) ->
     1::(bin_int_2_list r);;

