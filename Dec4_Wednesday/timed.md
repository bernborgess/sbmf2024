# Unions of Timed Scenarios
- Neda Saeedloei (Towson University)

## Timed Scenarios
- Formal way to specify sequences of events
- **Consistent**: Semantics of a scenario is not _empty_
- Upper and Lower bounds on time differences
- Theorem: $$m_{ij}+m_{jk}\le m_{ik} \le \dots$$
- Distance Tables: Matrix to represent the constraints
- **Stable** a distance table that satisfies the theorem
- _Stabilize_ applying the rules until table is `invalid` or `satisfied`.
- Stable tables are _unique_, each constraint is _tight_.

## Motivation
- Develop operations on timed scenarios
- Intersection is the interval where both timed scenarios happen
- For Union it's not always the case:
    - Quasi-union with min(mi,mj)-max(Mi,Mj)
- Zigzagging behaviors $\mathcal{B}^{Z}$
- If $\gamma$ becomes the union of $\xi$

## Necessary and sufficient conditions for the existence of unions
- z_pairs $\xi \cup \eta$

