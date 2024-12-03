------------------------------ MODULE Counter ------------------------------
EXTENDS Naturals

(* --algorithm Counter
variables 
    max = 5;
    x = 0;

define
    \* Propriedade: O valor de x nunca excede max
    NoOverflow == x <= max
end define;

begin
    counter:
    while (TRUE) do
        either
            x := x + 1;
        or
            x := 0;
        end either;
    end while;
end algorithm *)
\* BEGIN TRANSLATION (chksum(pcal) = "f14330d1" /\ chksum(tla) = "e5e39e49")
VARIABLES max, x, pc

(* define statement *)
NoOverflow == x <= max


vars == << max, x, pc >>

Init == (* Global variables *)
        /\ max = 5
        /\ x = 0
        /\ pc = "counter"

counter == /\ pc = "counter"
           /\ \/ /\ x' = x + 1
              \/ /\ x' = 0
           /\ pc' = "counter"
           /\ max' = max

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == counter
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Tue Dec 03 10:32:07 BRT 2024 by bernardob
\* Last modified Fri Oct 18 13:15:34 BRT 2024 by jefferson
\* Created Thu Oct 17 17:27:37 BRT 2024 by jefferson
