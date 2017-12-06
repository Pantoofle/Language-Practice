-module(exo).
-export([fibo/1 , fibo/2, sum/1, aire/1, ackermann/1, iter/2, mapp/2, reverse/1, sort/2, convert/2, sort_city/1]).

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

% -------------------- Fonction de tri --------------------
split(L) when length(L) < 2 -> {L, []};
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


% --------------------- Fonction de conversion des températures ---------------
fonct_conv(A, B) ->
    % 0 = c , 1 = f, 2 = k
    % Passage en numérique pour pouvoir 'tourner' entre les variables avec une simple incrémentation
    % Donc on passe au modulo
    case {A rem 3, B rem 3} of
        {A, A} -> (  fun(T) -> T end );  % Cas de la même unité
        {0, 1} -> (  fun(T) -> 9/5 * T + 32 end ); % Celsius to Fahrenheit
        {2, 0} -> (  fun(T) ->  T - 273.15 end ); % Kelvin to Celsius
        {1, 2} -> (  fun(T) -> (T - 32) * 5/9 + 273.15 end ); % Fahrenheit to Celsius
        {A, B} -> (  fun(T) -> Fo = fonct_conv(2*(A+B), B),   %2*(A, B) modulo 3 renvoit l'élément de {0,1,2} une fois A et B retirés de l'ensemble
% On passe par l'unité intermédiaire
                               Ti = (fonct_conv(A, 2*(A+B)))(T),
                               Fo(Ti) end )
% Peut aussi s'écrire  (fonct_conv(2*(A+B), B))((fonct_conv(A, 2*(A+B)))(T)) mais l'opération effectuée est moins claire
     end.

u_to_n('c') -> 0;
u_to_n('f') -> 1;
u_to_n('k') -> 2.
    

convert({T, S}, E) -> ({(fonct_conv(u_to_n(S), u_to_n(E)))(T) , E}).


ordre({_, T1} , {_, T2}) ->
    {TC1, _} = convert(T1, c),
    {TC2, _} = convert(T2, c),
    TC1 > TC2.

% -------------------- Tri des villes -----------------
sort_city(L) -> sort(L, fun(A, B) -> ordre(A, B) end).
    
