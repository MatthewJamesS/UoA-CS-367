
                        /*Einstein Riddle*/
/*
This code solves the Einstein Riddle by creating a way to work out positioning 
of the houses in relation to each other, creating a matrix that contains each 
of the riddles domains, it then processes through each hint (values hints first then position) 
given by the riddle, adding it to the matrix until all fields are filled. 
It then extracts who owns the fish. 
*/

                        /* position calculation*/
right_of(X, Y) :- X is Y+1.
left_of(X, Y) :- X is Y-1.
next_to(X, Y) :- right_of(X, Y).
next_to(X, Y) :- left_of(X, Y).


                        /* Solution */
solution(Persons) :-
    /* List to create matrix */
    Persons = [
    house(1, Nationality1,  Color1,     Pet1,   Drinks1,    Smokes1),
    house(2, Nationality2,  Color2,     Pet2,   Drinks2,    Smokes2),
    house(3, Nationality3,  Color3,     Pet3,   Drinks3,    Smokes3),
    house(4, Nationality4,  Color4,     Pet4,   Drinks4,    Smokes4),
    house(5, Nationality5,  Color5,     Pet5,   Drinks5,    Smokes5)],

                        /* Hints */

    /* the Brit lives in the red house */
    member(house(_,brit,red,_,_,_), Persons),
  
    /* the Swede keeps dogs as pets */
    member(house(_,swede,_,dog,_,_), Persons),
  
    /* the Dane drinks tea */
    member(house(_,dane,_,_,tea,_), Persons),
  
    /* the green house's owner drinks coffee  */
    member(house(_,_,green,_,coffee,_), Persons),
  
    /* the person who smokes Pall Mall rears birds */
    member(house(_,_,_,birds,_,pall_mall), Persons),
  
    /* the owner of the yellow house smokes Dunhill */
    member(house(_,_,yellow,_, _,dunhill), Persons),
  
    /* the owner who smokes BlueMaster drinks beer*/
    member(house(_,_, _,_,beer,bluemaster), Persons),
  
    /* the German smokes Prince */
    member(house(_,german,_,_,_,prince),Persons),
  
    /*Fish*/
    /*Fish is the last remaining pet so it is assigned to the last empty space*/
    member(house(_,_,_,fish,_,_), Persons),

                        /*Position Hints*/
  
    /* the green house is on the left of the white house */
    member(house(A,_,green,_,_,_), Persons),
    member(house(B,_,white,_,_,_), Persons),
    left_of(A, B),

    /* the man living in the center house drinks milk */
    member(house(3,_,_,_,milk,_), Persons),
  
    /* the Norwegian lives in the first house */
    member(house(1,norweigan,_,_,_,_), Persons),

    /*the man who smokes blends lives next to the one who keeps cats*/
    member(house(C,_,_,_,_,blend), Persons),
    member(house(D,_,_,cats,_,_), Persons),
    next_to(C, D),
  
    /*the man who keeps horses lives next to the man who smokes Dunhill*/
    member(house(E,_,_,horse,_,_), Persons),
    member(house(F,_,_,_,_,dunhill), Persons),
    next_to(E, F),
  
    /* the Norwegian lives next to the blue house*/
    member(house(H,norweigan,_,_,_,_), Persons),
    member(house(I,_,blue,_,_,_), Persons),
    next_to(H, I),
  
    /*the man who smokes blend has a neighbor who drinks water */
    member(house(J,_,_,_,_,blend), Persons),
    member(house(K,_,_,_,water,_), Persons),
    next_to(J, K).

                        /*Owner of fish statement*/

  /*Pulls out the owner of the fish and returns it with the matrix*/
ownerOfFish(Persons, Owner) :-
    solution(Persons),
    member(house( _,Owner,_,fish,_,_), Persons).