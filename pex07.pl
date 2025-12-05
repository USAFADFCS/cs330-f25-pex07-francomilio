% pex5.pl
% USAFA UFO Sightings 2024
%
% name: Franco Milio
%
% Documentation: I asked my instructor for help with some errors.
% I also searched some errors on google but did not find answers.
% I heavily referenced the code from HW07
% The query to get the answer(s) or that there is no answer
% ?- solve.


cadet(smith).
cadet(garcia).
cadet(chen).
cadet(jones).

obj(balloon).
obj(kite).
obj(fighter).
obj(cloud).

day(tuesday).
day(wednesday).
day(thursday).
day(friday).

solve :-
    cadet(TuesdayMan), cadet(WednesdayMan), cadet(ThursdayMan), cadet(FridayMan),
    all_different([TuesdayMan, WednesdayMan, ThursdayMan, FridayMan]),
    
    obj(TuesObj), obj(WedObj), obj(ThursObj), obj(FriObj),
    all_different([TuesObj, WedObj, ThursObj, FriObj]),
    
    Triples = [ [tuesday, TuesdayMan, TuesObj],
    			[wednesday, WednesdayMan, WedObj],
    			[thursday, ThursdayMan, ThursObj],
    			[friday, FridayMan, FriObj] ],
    
    \+ member([_, smith, balloon], Triples),
    \+ member([_, garcia, kite], Triples),
    (member([friday, chen, _], Triples); 
    member([friday, _, fighter], Triples)),
    \+ member([tuesday, _, kite], Triples),
    \+ member([_, garcia, balloon], Triples),
    \+ member([_, jones, balloon], Triples),
    \+ member([tuesday, jones, _], Triples),
    member([_, smith, cloud], Triples),
    member([friday, _, fighter], Triples),
    \+ member([wednesday, _, balloon], Triples),
    
    tell(tuesday, TuesdayMan, TuesObj),
	tell(wednesday, WednesdayMan, WedObj),
	tell(thursday, ThursdayMan, ThursObj),
	tell(friday, FridayMan, FriObj).
    
all_different([H | T]) :- member(H, T), !, fail.
all_different([_ | T]) :- all_different(T).
all_different([_]).


tell(X, Y, Z) :-
	write('It was '), write(X), write(' when '), write(Y),
	write(' saw UFO '), write(Z), write('.'), nl.