-module(fonc).
-export([facto/1]).

facto (0) -> 1;
facto (N) -> N* facto(N-1).

quicksort([a]) -> [a];
quicksort([a, b]) when a > b -> [b, a];
quicksort([a, b]) when b > a -> [a, b];
quicksort([a | R]) -> 
    S , B = [], [].
