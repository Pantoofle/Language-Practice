(* Fonctions sur les listes **********)

(* Une liste, c'est soit la liste vide, soit la tete de la liste
   suivie de la queue de la liste.
   La fonction longueur ci-dessous se fonde sur cette distinction de
   cas.  *)
let rec longueur l = match l with
  | [] -> 0
  | x::xs -> 1 + (longueur xs)


(* Un exemple d'utilisation. *)
let cinq = longueur [32;52;17;3]

(* Définissez une fonction qui calcule la somme des entiers contenus dans une liste. *)
let rec somme l = match l with
  | [] -> 0
  | x::xs -> x + somme(xs)


(* À completer.
   garde_pairs ne garde que les entiers pairs dans une liste;
   ou alors (comme vous preferez, codez la version que vous voulez),
   renvoie la sous-liste constituee du 2e element, suivi du 4e, puis
   du 6e, etc *)
let rec garde_pairs l = match l with
  | [] -> []
  | x::xs when (x mod 2 = 0) -> x::(garde_pairs xs)
  | x::xs -> garde_pairs xs




(* Voici une fonction qui prend une fonction en argument. *)
(* Contemplez le type de evalue_3_2, et comprenez-le. *)
let evalue_3_2 f =
  3 + (f 2)


let echange f x y = f y x

(* On aurait aussi pu écrire : *)
let echange f = fun x y -> f y x

(* Comprendre les fonctions à plusieurs arguments en Caml. *)
(* "diff" peut être vue comme une fonction qui, lorsqu'on lui passe son
   premier argument, renvoie une fonction *)
let diff a b =
  if a<b then b-a else a-b


let n = diff 10 9

(* Une "application partielle" : *)
let n' = diff 10

(* mais .. *)
let n' = diff (12,8)

(* une fonction pour concatener les listes?
   p.ex., concat [2;4] [6;8]   renvoie   [2;4;6;8] *)
let rec concat l l' = match l with
  | [] -> l'
  | x::xs -> x::(concat xs l')




let rec applique f l = match l with
  | [] -> []
  | x::xs -> (f x)::(applique f xs)


let f x y = y*x

let l = applique (f 3) [1;2;3]

(* Le "(fun n -> 3*n)" ci-dessous est ce qu'on appelle une fonction
   anonyme *)
let l' = applique (fun n -> 3*n) [1;2;3]
















(* Faire échouer le programme en cas de situation exceptionnelle *)
let tete l = match l with
  | [] -> failwith "tete: je ne veux pas avoir a faire a la liste vide!"
  | t::q -> t


(* Observez l'avertissement renvoyé par Caml *)
let tete2 l = match l with
  | t::q -> t

(*Des fonctions ne seront pas filtrées, et donc feront planter la fonction*)
              
let x1 = tete2 []

let x2 = tete []

let queue l = match l with
  | [] -> failwith "erreur!"
  | t::q -> q


let troisieme l = tete (queue (queue l))


(* Ci-dessous, on definit "_", autrement dit on renonce a donner un
   nom a ce qu'on calcule *)
let _ = troisieme [2;3;4]
















let rec dernier l = match l with
| [] -> failwith "dernier: liste vide"
| x::xs -> (match xs with
  | [] -> x
  | y::ys -> (dernier xs)
	   )

let rec der l = match l with
  | [x] -> x
  | x::xs -> der xs
  | [] -> failwith "dernier: liste vide!"


(* autre maniere d'ecrire *)
let rec der l = match l with
  | [x] -> x
  | _::xs -> der xs
  | [] -> failwith "dernier: liste vide!"



let tete3 l = match l with
  | [] -> failwith "rate!"
  | x::_ -> x


let est_non_vide l = match l with
  | [] -> false
  | _ -> true
(*  | _::_ -> true *)


let toujours3 l = match l with
  | _ -> 3
  | [] -> 4





let rec reverse l = match l with
| [] -> []
| x::xs -> (reverse xs)@[x]


(* Réfléchir à "(reverse xs)@[x]" ci-dessus : pourquoi est-on
   malheureux en termes d'efficacite?
   
   Efficacité horrible car la fonction @ concatene les listes, donc en O(n = longueur de l). Et on fait cet appel n fois 

   Programmer une version plus efficace, en ajoutant un argument à la
   fonction reverse. *)


                          
let rec rev a l = match l with
  | [] -> a
  | x::xs -> rev (x::a) xs
  
let renverse l = rev [] l
                     
let l0 = renverse [1;2;3]


