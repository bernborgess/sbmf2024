---------------------------- MODULE Wire ----------------------------
EXTENDS Integers
(*--algorithm Wire
variables
    people = {"alice", "bob"},
    acc = [p \in people |-> 5];

define
    NoOverdrafts  == \A p \in people: acc[p] >= 0
end define;

process wire \in 1..2
variables
    sender = "alice",
    receiver = "bob",
    amount \in 1..acc[sender];
begin
    CheckFunds:
        if amount <= acc[sender] then
            withdraw:
                acc[sender] := acc[sender] - amount;
            deposit:
                acc[receiver] := acc[receiver] + amount;
        end if;
end process;
end algorithm; *)
\* BEGIN TRANSLATION (chksum(pcal) = "8496924" /\ chksum(tla) = "4207a71c")
VARIABLES people, acc, pc

(* define statement *)
NoOverdrafts  == \A p \in people: acc[p] >= 0

VARIABLES sender, receiver, amount

vars == << people, acc, pc, sender, receiver, amount >>

ProcSet == (1..2)

Init == (* Global variables *)
        /\ people = {"alice", "bob"}
        /\ acc = [p \in people |-> 5]
        (* Process wire *)
        /\ sender = [self \in 1..2 |-> "alice"]
        /\ receiver = [self \in 1..2 |-> "bob"]
        /\ amount \in [1..2 -> 1..acc[sender[CHOOSE self \in  1..2 : TRUE]]]
        /\ pc = [self \in ProcSet |-> "CheckFunds"]

CheckFunds(self) == /\ pc[self] = "CheckFunds"
                    /\ IF amount[self] <= acc[sender[self]]
                          THEN /\ pc' = [pc EXCEPT ![self] = "withdraw"]
                          ELSE /\ pc' = [pc EXCEPT ![self] = "Done"]
                    /\ UNCHANGED << people, acc, sender, receiver, amount >>

withdraw(self) == /\ pc[self] = "withdraw"
                  /\ acc' = [acc EXCEPT ![sender[self]] = acc[sender[self]] - amount[self]]
                  /\ pc' = [pc EXCEPT ![self] = "deposit"]
                  /\ UNCHANGED << people, sender, receiver, amount >>

deposit(self) == /\ pc[self] = "deposit"
                 /\ acc' = [acc EXCEPT ![receiver[self]] = acc[receiver[self]] + amount[self]]
                 /\ pc' = [pc EXCEPT ![self] = "Done"]
                 /\ UNCHANGED << people, sender, receiver, amount >>

wire(self) == CheckFunds(self) \/ withdraw(self) \/ deposit(self)

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == /\ \A self \in ProcSet: pc[self] = "Done"
               /\ UNCHANGED vars

Next == (\E self \in 1..2: wire(self))
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(\A self \in ProcSet: pc[self] = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Tue Dec 03 11:56:19 BRT 2024 by bernardob
\* Created Tue Dec 03 11:33:50 BRT 2024 by bernardob
