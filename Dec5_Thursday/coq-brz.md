# Brzozowski's Algorithm for Automata Minimization Verified in Coq
- Filipe Ramos
- Karina & Rafael (Universidade do Estado de Santa Catarina & University of Copenhageni)

## Introduction
- Why minimize DFA?
    - To reduce memory usage
    - Simplify automaton for reasoning
    - Obtain canonical DFA for given regular language
- Table filling algorithm
- Brzozowski's algorithm
    - Simpler to understand
    - Easier to implement
    - Despite $O(2^n)$, it frequently behaves well in practice
- Lack of correctness proofs of the algorithm in Coq 
- Coq Proof Assistant
    - ![coq](https://coq.inria.fr/files/barron_logo.png)
    - Formal proof management system
    - Tactics allowing for simpler proofs
    - Broad user community
- Proof goals
    - Reversal produces an automaton that accepts the strings reversed from the source language
    - the minimized automaton is deterministic
    - the language of the minimized DFA is the same as that of the input automaton
    - all constructed states are reachable and distinguishable

## Brzozowski's Algorithm
- Define the predicates
- Difficult function handling in definitions and proofs
- Impossible to apply induction directly
- Less predicates:
    - Same representation for both NFA and DFA
    - NFA $\iff$ DFA facilitated
    1. `start q1` becomes `q1`

## Automation Determinization in Coq
- State list normalization
    - Reduction of redundancy
    - Consistency in state representation
- Accepting states appending
    - The previously generated states with an accepting state
- Removal of unreachable states
    - Pumping lemma

### Proof of Equivalence
- $q_1 \in Q \land q_2 \in \text{ext\_transitionf}$
- Unreachable states do not exist.
- Minimization correctness
    - Every reachable state of g is in $Q_1$ iff it's in $Q_2$
- Since $\text{det}\ g^R$ is deterministic and all its states are reachable, $\det (\det )$

## Conclusion
- Finite automata as lists
- Proofs guided by **tactics** with well-defined syntax and step-by-step procedures
- Brzozowski's algorithm verified in Coq
- We show it works for both NFA and DFA
- Approx $2400$ lines of proof and $580$ of specification
