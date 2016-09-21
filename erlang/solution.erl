- module(solution).
- export([key/3]).

key(Elements, Keys, Func) ->
        dict:to_list(fold2(fun(LDic, LKey, LEl) ->
                dict:update(LKey, fun([V]) -> [Func(V, LEl)] end, [LEl], LDic)
                           end, dict:new(), Keys, Elements)).

fold2(Func, Acc, [H1|[]], [H2|[]]) -> Func(Acc, H1, H2);
fold2(Func, Acc, [H1|L1], [H2|L2]) -> fold2(Func, Func(Acc, H1, H2), L1, L2).
