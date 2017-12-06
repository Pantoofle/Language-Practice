-module(filtrage).
-export([fibo/1 , fibo/2, sum/1, aire/1, ackermann/1, iter/2, mapp/2, reverse/1]).

fibo(X) when X < 2 -> 1;
fibo(X)           -> fibo(X-1)  + fibo(X-2).

fibo(0, {U, _}) -> U;
fibo(1, {_, V}) -> V;
fibo(X, Init)   -> fibo(X-1, Init) + fibo(X-2, Init).

sum(L)        -> sum(L, 0).
sum([], S)    -> S; 
sum([H|T], S) -> sum(T, H + S).

aire({'cercle', R}) -> 2*3.141592* (R*R);
aire({'carre', C})  -> C*C; 
aire({'triangle',C})-> aire({'carre', C}) / 2;
aire({'hexagone',C})-> aire({'triangle', C}) * 6. 

ackermann(X)-> ackermann(X, X).

ackermann(0, Y)-> Y+1; 
ackermann(X, 0)-> ackermann(X-1, 1); 
ackermann(X, Y)-> ackermann(X-1 , ackermann(X, Y-1)).

iter([A], Fun)   -> Fun(A);
iter([H|T], Fun) -> Fun (H), 
                    iter(T, Fun).

mapp([], _) -> [];
mapp([H|T], Tra) -> [Tra(H)| mapp(T, Tra)].

reverse([])    -> [];
reverse([A])   -> [A];
reverse([H|T]) -> reverse(T) ++ [H].

split([]) -> {[], []};
split([A]) -> {[A], []};
split([A|[B|T]]) -> {G, D} = split(T),
                    {[A|G], [B|D]}.

merge([], B, _) -> B;
merge(A, [], _) -> A;
merge([HA |TA] , [HB|TB], C) ->
    case C(HA, HB) of
        true  -> [HA|merge(TA, [HB|TB], C)];
        false -> [HB|merge([HA|TA] ,TB, C)]
    end.

sort(L, _) when length(L) < 2 -> L; 
sort(L, C)  -> {A, B} = split(L), 
            merge(sort(A, C), sort(B, C), C).
