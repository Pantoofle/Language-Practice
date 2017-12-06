(* Petit interlude : librairies, flottants, tuples **************)

(* la librairie OCaml: cf. http://caml.inria.fr *)
(* puis chercher la documentation, part IV "the OCaml library", 
   "standard library" *)
List.length [7;3;5;4]

let c = 3.2 +. 3.1

let n = 3. *. 3.333333

let f (x,y) = x+y

let permute (a,b,c) = (b,a,c)

let t = permute ("jaune", "vert", "rouge")

let t' = permute (3, [4;2], "titi")



(* Usages de "let" en Caml **********************)

(* Déclarations locales *)
let a =
  let x = 3 in
    x*x*x     (* <-- ici, "x*x*x" va avec le "let a =" *)


let f x y =
  let t = x*x - x*y in
    if t>0 then x-y
    else y -x



(* Ce qu'on appelle la "liaison statique" *)

(* "let k = .." peut se lire comme "dorenavant, k designera .." *)
let k = [12;13]

(* Ici on ne change pas la valeur de k, on definit un nouveau k qui,
   par hasard, a le meme nom que quelqu'un qui etait deja defini;
   ainsi, la definition suivante ne pose pas de probleme de typage *)
let k = 14


let m = 12

let f1 x = x*m

let m = "blabla"

(* Pas de problème lorsqu'on definit y: f1 utilise la valeur de m au
   moment où on a defini f1, pas l'identificateur "m" *)
let y = f1 5



let a =
  let n = 2 in
  let n = 3 in
    n*n


let b = a + a

let b = a + b


(* Réécrire le code ci-dessous en renommant les identificateurs
   lorsque c'est nécessaire, afin de rendre le code plus clair *)

let x =
  let f y =
    let z =
      if y>0 then y+2 else y-1 in
    z*z in
  f 3

(* Qu'est-ce qui cloche ci-dessous? *)
let rec x x =
  if x>0 then 33 else 2*(x (x-1))


(*On veut appliquer (x-1) à la fonction x. Or, à ce moment, x est un entier, argument de la fonction. Donc on essaye d'appeler un entier comme une fonction.*)








(* Fonctions d'ordre supérieur ********)

let fixe_second g y =
  fun x -> g x y


let compose f g =
  fun x -> f (g x)


let c' = fun f -> compose f f






(* Caml devine les types ********************************)

(* Devinez le type des fonctions que l'on définit ci-dessous. *)


let app1 (f,x) = f x
(* ('a -> 'b)*'a -> 'b  *)
                

let applique f x = f x
(* ('a -> 'b) -> 'a -> 'b *)
                     

let toto b = if b then "vrai" else "faux"
(* bool -> string *)
                                     
let t1 = applique toto
(* bool -> string *)

let t2 = applique (applique toto)
(* bool -> string *)
                  
let t3 = (applique applique) toto
(* bool -> string *)            

let app2 x = (applique applique) x
(* ('a -> 'b ) -> ('a -> 'b)  *)
                                 
let deuxfois f x = f (f x)
(* ('a -> 'a) -> 'a -> 'a *)

(* Devinez le type de "bizarre" avant de demander à Caml. *)
let bizarre f x = x (f x)   (* (('a -> 'b) -> 'a) -> ('a -> 'b) -> 'b   *)

(* Devinez le type de "rebizarre" avant de demander à Caml. *)
let rebizarre f x = (f f) x
(* Essai : (('a -> 'b) -> ('c -> 'd)) -> ( 'c -> 'd )  
   Mais, on aurait alors f de type 'a et de type 'a -> 'b 
   CamL plante... *)

