let e = ref 2;;

!e;;

e := 3;;


(* Caml connaît un type particulier, "unit", qui a un seul élément, noté "()".  *)

();;

(* Question : À votre avis, pourquoi a-t-on obtenu le type "unit"
   lorsque l'on a évalué "e := 3" ci-dessus ? *)
(* car chaque ligne de commande renvoit une valeur, et comme cette ligne ne fait qu'une affectation, elle ne renvoit rien. Et rien, en OCamL, c'est unit *)
!e;;

e := !e + 1;;

!e;;

let e' = ref 0. ;;

e' := 0.01;;

print_string "bonjour monde\n";;


(* unit peut être utilisé pour "retarder un calcul" *)

let v = ref 0

(* Ici on définit un couple de fonctions. *)
let incremente, inspecte =
  (fun () -> v := !v+1),
  (fun () -> !v)

(* Comprendre pourquoi la version ci-dessus est considérablement mieux que ceci : *)
   (* Ci dessus on définit des fonctions. qui sont de type unit -> unit et unit -> int, alors que ci-dessous, on ne créé que des expressions unit et int. Cela ne rend donc pas du tout compte de l'action effectuée*)
let incr, insp =  (v := !v+1), (!v);;


incremente;;

incremente ();;

inspecte ();;


(* Un point-virgule seul sert à enchaîner les "commandes" (dont le
   type de retour est unit), comme ci-dessous.

   Comme ci-dessus, pour lancer le calcul'évaluation, on utilise le
   double point-virgule final. *)
( incremente (); incremente (); incremente () );;




(* Les tableaux en Caml **********)
let tab = Array.make 4 "hop" ;;

tab.(1) <- "hip";;

tab;;

let t = Array.make 10 0 ;;

for i = 1 to 9 do t.(i) <- i done;;

t;;

Array.iter print_int t;;

let m = Array.make 3 (Array.make 3 "boom");;

m.(0).(1) <- "wooq";;

m;;


(* Programmez une version de Fibonacci qui exploite un tableau de deux entiers. *)
let imp_fib n =
    let t = Array.make 2 1 in
    for i = 2 to n do
      let s = t.(1) in
      t.(1) <- t.(0) + t.(1);
      t.(0) <- s;
    done;
    t.(1);;

imp_fib 4;;


