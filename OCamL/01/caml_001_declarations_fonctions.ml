(* Référez-vous au fichier caml-fiches-1-6.pdf pour des
   indications sur comment se servir de ce fichier. *)

let a = 3

let f = fun x -> x+2

let b = f a + f (2*a)


let det a b c = b*b - 4*a*c

(* comprenez le type de cette fonction *)
let f24 = det 2 4

(* f24 est definie comme det avec a=2 et b=4;
   Définissez par analogie la fonction pour laquelle a=2 et c=5.

   Nota Bene: "()" est une constante, dont le type est appelé "unit",
   on l'utilise ici pour mettre quelque chose : il faut l'effacer et
   la remplacer par du code sensé. *)
let f2_5 = det 2 5


(* definir des donnees ***********)

let a = 32+52

let a' = a*2

let b = "boom"

(*Pas de multiplication entre int et string ! *)
let c = 3*"paf"

let d = (3 > 2)

let l = [1;3;5;4+3]

let l1 = [true; false; false]

let l' = [] (* 'a list signifie que c'est une liste, d'éléments de type 'a. En effet, comme on a pas donné de type, on laisse le champ "en attente", en disant qu'il y a un type fixé *)

let l2 = [ [true]; [false; false] ]

(*Les listes ont tous leurs éléments de même type ! Il faut donc soit créer un nouveau type contenant 2 et "deux", soit... changer d'éléments !*)           
let l'' = [2; "deux"]

let l3 = [[[]]]


(* NB: pas droit aux majuscules au debut des identificateurs (a, b, l,
   l', etc.) !! *)





(* fonctions **********)

let suivant x = x+1

let dix = suivant 9

let trois = suivant (suivant 1)

(* Comprendre *)
(*suivant est une fonction int -> int et avec ces parenthèses, on essaye de l'appeler avec un type "int -> int". On envoit une fonction à une fonction attendant un entier. On a donc une erreur*)
let douze = (suivant suivant) 1
                              
(* Lorsqu'on débute en Caml, on passe son temps à recomprendre ce qui
   se passe ici : *)
(*Cette syntaxe essaye de donner deux arguments à la fonction suivant, qui n'en prend qu'un*)
let quarante = suivant suivant 1

(* Une autre maniere d'ecrire une definition de fonction *)
let suivantsuivant = fun k -> k+2



(* Notez le "let rec", .. *)
(* .. et comprenez le "then 1" *)
(* Rec indique que la fonction est récursive, et then indique quoi faire si la condition du if est vraie.*)
let rec fact n =
  if n <= 1 then 1 else n * (fact (n-1))


let rec double = fun n -> 
  if n=0 then 0
  else suivant (suivant (double (n-1)))




(* Définissez fibonacci *)
let rec fibo n =
  if n <= 1 then 1 else ( fibo (n-1) ) + ( fibo (n-2) )

                                           
