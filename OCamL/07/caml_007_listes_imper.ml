(* Des tableaux pour les listes ****************)

(*
Cette fiche vous propose un "exercice de musculation" en Caml :
reprogrammer une partie de la librairie "List" de Caml en
s'appuyant sur des vecteurs (appelés aussi tableaux).
*)



(* On commence par poser : *)
type 'a vlist = 'a array 

(* avec l'idée qu'une liste contenant des éléments de type 'a sera
   représentée par un vecteur contenant des éléments de type 'a .


   Il vous est demandé de programmer la version “vecteur” d’un certain
   nombre de fonctions que définit la librairie List.  
   Vous pouvez vous référer a la documentation de la librairie List
   (http://caml.inria.fr/pub/docs/manual-ocaml/libref/List.html) pour
   savoir ce que doit faire chaque fonction.

   Par exemple, vous devez programmer la fonction rev : 'a vlist -> 'a vlist. 

   Vous pouvez faire quelques tests avec la fonction List.rev pour voir
   comment se comporte la fonction originelle en OCaml.  Votre code ne
   devra pas faire appel à d’autres librairies OCaml que Array, afin de
   privilégier l’indépendance des librairies entre elles.

   La curiosité peut vous pousser à regarder comment les fonctions que
   vous devez programmer sont codées dans la librairie Caml : vous
   pouvez voir cela dans /usr/lib/ocaml/list.ml 

*)

(* conversion des listes aux vlist.. *)
                   
let rec list2vlist_aux l a n i =
  if i >= n then a
  else
    let b = list2vlist_aux (List.tl l) a n (i+1) in
    begin
      b.(i) <- List.hd(l);
      b;
    end;;

let list2vlist l =
  let n = List.length l in
  if n = 0 then [||]
  else list2vlist_aux l (Array.make n (List.hd l)) n 0;;
  
(* .. et dans le sens inverse *)
let rec vlist2list_aux t i =
  if i = Array.length(t) then []
  else t.(i)::(vlist2list_aux t (i+1));;

let vlist2list t = vlist2list_aux t 0;;

(* Nouveau par rapport à la librairie List.
   Noté "::" pour les listes usuelles de Caml. *)
let cons x t =
  if t = [||] then [|x|]
  else
    let n = Array.length(t) in
    let v = Array.make (n + 1) x in
    begin
      for i = 1 to n do
        v.(i) <- t.(i-1);
      done;
      v
    end;;

let length t = Array.length(t);;
    
(* Failure "hd" *)
let hd t =
  match t with
  | [||] -> failwith("Error, empty list");
  | _ -> t.(0);;

(* Failure "tl" *)
let tl t =
    match t with
  | [||] -> failwith("Error, empty list");
  | _ ->
     let n = length t in
     let v = Array.make (n - 1) t.(0) in
     begin
       for i = 1 to n-1 do
         v.(i-1) <- t.(i);
       done;
       v
     end;;

let nth t n = t.(n);;

let rev t =
  let n = length t in
  let v = Array.make n t.(0) in
     begin
       for i = 0 to n-2 do
         v.(i) <- t.(n-i-1);
       done;
       v
     end;;
  
let append u v = Array.append u v;;
  
let rec concat u =
  match u with
  | [||] -> [||]
  | _    -> append (nth u 0) (concat (tl u));;

let rec map f t =
  match t with
  | [||] -> [||];
  | _ -> cons (f (hd t)) (map f (tl t));;

(***********************************
   On laisse ci-dessous les commentaires originels de la librairie
   List de Caml : à chaque fois que ça parle de listes, il faut remplacer
   par des vecteurs *)

let fold_left f a t =
(** [List.fold_left f a [b1; ...; bn]] is
   [f (... (f (f a b1) b2) ...) bn]. *)
  let n = length t in
  let v = ref a in
  begin
    for i = 0 to n-1 do
      v := f (!v) t.(i);
    done;
    !v
  end;;
  
let for_all f t = 
(** [for_all p [a1; ...; an]] checks if all elements of the list
   satisfy the predicate [p]. That is, it returns
   [(p a1) && (p a2) && ... && (p an)]. *)
  let n = length t in
  let v = ref true in
  begin
    for i = 0 to n-1 do
      v := (f t.(i)) && (!v);
    done;
    !v
  end;;

let find f t = 
(** [find p l] returns the first element of the list [l]
   that satisfies the predicate [p].
   Raise [Not_found] if there is no value that satisfies [p] in the
   list [l]. *)
  let n = length t in
  let i = ref 0 in
    if n = 0 then failwith("Not_Found")
    else
      begin
        while (((f t.(!i)) = false) && (!i < n)) do
          i := !i + 1;
        done;
        if (!i = n) then failwith("Not_Found")
        else t.(!i)
      end;;

let partition p t =
(** [partition p l] returns a pair of lists [(l1, l2)], where
   [l1] is the list of all the elements of [l] that
   satisfy the predicate [p], and [l2] is the list of all the
   elements of [l] that do not satisfy [p].
   The order of the elements in the input list is preserved. *)
  let n = length t
  and c1 = ref 0
  and c2 = ref 0 in
  begin
    for i = 0 to n-1 do
      if (p t.(i)) then c1 := !c1 +1
      else  c2 := !c2 +1;
    done;
    let u = Array.make (!c1) t.(0)
    and v = Array.make (!c2) t.(0) in
    begin
      c1 := !c1 -1;
      c2 := !c2 -1;
      for i = 0 to n-1 do
        if (p t.(n-i-1)) then
          begin
            u.(!c1) <- t.(n-i-1);
            c1 := !c1 - 1
          end
        else
          begin
            v.(!c2) <- t.(n-i-1);
            c2 := !c2 - 1
          end;
      done;
      [|u; v|]
    end
  end;;
  
let merge cmp l1 l2 = 
(** Merge two lists:
    Assuming that [l1] and [l2] are sorted according to the
    comparison function [cmp], [merge cmp l1 l2] will return a
    sorted list containting all the elements of [l1] and [l2].
    If several elements compare equal, the elements of [l1] will be
    before the elements of [l2].
    Not tail-recursive (sum of the lengths of the arguments).
 *)
  let n1 = length l1
    and n2 = length l2
    and i = ref 0
    and j = ref 0 in
  if ((n1 = 0) && (n2 = 0)) then [||]
  else if (n1 = 0) then l2
  else if (n2 = 0) then l1
  else
    let r = Array.make (n1 + n2) l1.(0) in
    begin
      while (!i + !j < n1 + n2) do
        if (!i = n1) then
          begin
            r.(!i + !j) <- l2.(!j);
            j := !j +1
          end
        else
          if(!j = n2) then
            begin
              r.(!i + !j) <- l1.(!i);
              i := !i -1
            end
          else 
            if(cmp l1.(!i) l2.(!j)) then
              begin
                r.(!i + !j) <- l1.(!i);
                i := !i -1
              end
            else
              begin
                r.(!i + !j) <- l2.(!j);
                j := !j +1
              end;
      done;
      r
    end;;

