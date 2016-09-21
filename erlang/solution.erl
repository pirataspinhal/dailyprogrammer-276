- module(key_func).
- compile(export_all).

key (Elements, Keys, Func) ->
	dict:to_list(
	  fold_two(fun(A, B, C) -> dic_maker(Func, A, B, C) end, dict:new(), Keys, Elements)
	 ).

dic_maker(Func, Dic, Key, Elem) -> dict:update(Key, fun([V]) -> [Func(Elem, V)] end, [Elem], Dic).

fold_two (_, Start, [], []) -> Start;
fold_two (Func, Start, [H1|L1], [H2|L2]) -> fold_two(Func, Func(Start, H1, H2), L1, L2).

%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%
%%dic_maker(Func, Dic, Key, Elem) -> case dict:find(Key, Dic) of
									   %error -> dict:append(Key, Elem, Dic);
									   %{ok, Value} -> dict:update(Key, Func(Elem, Value), Dic)
								   %end.
% key (Elements, Keys, Func) -> dict:to_list(fold_two(fun(Dic, Key, Elem) -> dic_maker(Func, Dic, Key, Elem) end, dict:new(), Keys, Elements)).
