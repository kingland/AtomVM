-module(esp_random).
-export([start/0]).

-include("estdlib.hrl").

start() ->
    erlang:display(esp:reset_reason()),
    loop().

loop() ->
    RandomLen = abs(atomvm:random()) rem 128,
    RandomBytes = atomvm:rand_bytes(RandomLen),
    erlang:display(RandomBytes),
    ?TIMER:sleep(5000),
    case RandomLen of
        0 ->
            esp:restart();
        _ ->
            loop()
    end.
