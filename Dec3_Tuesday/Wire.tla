---------------------------- MODULE Wire ----------------------------
EXTENDS Integers
(*--algorithm Wire
variables
    people = {"alice", "bob"},
    acc = [p \in people |-> 5],
    sender = "alice",
    receiver = "bob",
    amount \in 1..6;
    
define
    NoOverdrafts  == \A p \in people: acc[p] >= 0
end define;

begin
    withdraw:
        acc[sender] := acc[sender] - amount;
    deposit:
        acc[receiver] := acc[receiver] + amount;
    skip;
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "4e995995" /\ chksum(tla) = "9c12e379")
VARIABLES people, acc, sender, receiver, amount, pc

(* define statement *)
NoOverdrafts  == \A p \in people: acc[p] >= 0


vars == << people, acc, sender, receiver, amount, pc >>

Init == (* Global variables *)
        /\ people = {"alice", "bob"}
        /\ acc = [p \in people |-> 5]
        /\ sender = "alice"
        /\ receiver = "bob"
        /\ amount \in 1..6
        /\ pc = "withdraw"

withdraw == /\ pc = "withdraw"
            /\ acc' = [acc EXCEPT ![sender] = acc[sender] - amount]
            /\ pc' = "deposit"
            /\ UNCHANGED << people, sender, receiver, amount >>

deposit == /\ pc = "deposit"
           /\ acc' = [acc EXCEPT ![receiver] = acc[receiver] + amount]
           /\ TRUE
           /\ pc' = "Done"
           /\ UNCHANGED << people, sender, receiver, amount >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == withdraw \/ deposit
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Tue Dec 03 11:48:08 BRT 2024 by bernardob
\* Created Tue Dec 03 11:33:50 BRT 2024 by bernardob
