# Verification by Program Transformation
- [Philipp Rummer](www.philipp.ruemmer.org/projects.shtml) (University of Regensburg)

## Context: software model checking
- State of the art: CPAchecker, SeaHorn, Ultimate, VeriAbs, Theta
- Implementing algorithms: IC3/PDR, CEGAR,k-induction
- With various backends: SMT solvers, CHC solvers, abstract interpreters
- Anual competition SV-COMP
- [TriCera_Web_Interface](https://eldarica.org/tricera/?ex=stack-pointers/unary)

## Our tools: TriCera, Eldarica, Princess
- TriCera - language frontend for C
- Eldarica: solver for constraints Horn Clauses (CHC)
- Princess: SMT solver / theorem prover
    - Integers :LIA, NIA
    - BitVectors
    - ...

## Specifications in software model checking
- Specification languages like **ACSL** are high-level
    - Function contracts
    - Inductive predicates
    - etc.
- Encoding the *specifications* **MIND THE GAP**
- Software model checkers are able to handle **low-level** assertions:
    ```
    assert(...)
    assume(...)
    havoc(...)
    ```

## Complex specification operators
- High-level operators are written in rich languages, not natively supported
- Example: Maximum voltage in battery pack
```c
int bpack_max_voltage(int batt_volt[N]) {
    // Scania code
    int max_volt = INT_MIN;
    for (int i=0;i<N;i++) {
        if(batt_volt[i]>max_volt) max_volt=batt_volt[i];
    }
    assert(maxvolt==\max(batt_volt,0,N));
    return max_volt;
}
```
### Extended quantifiers, aka aggregation
- Nontrivial
- Supported by SMT Solvers
    - Definition using axioms possible, but tends to be brittle
    - Decision procedures for some, but no all extended quantifiers available (e.g. array folds logic)
    - Some extended quantifiers (\max, \min) can be encoded using ordinary quantifiers
- No support by default for **invariant inference / model checking**.

## Talk Outline
- Handling of complex operators by program transformation
- From complex operators to program equivalence...
- Replace unsupported operators by a "reference implementation"
```c
int my_max(int a[],int l,int u) {
    if (l < u) return max(my_max(a,l,u-l),a[u-1]);
    return INT_MIN;
}
```
- Encoding the operators
- Symbolic execution and **counterexamples**
- Verify the properties of the encoding, requires invariants
- Proof that `Program 1` and `Program 2` always produce the same result.

### Program equivalence and product programs
- In general we verify
```
assume(in1==in2)
o1=prog1(i1)
o2=prog2(i2)
assert(o1==o2)
```
- Partial equivalence
- "Weaving" programs together to obtain a product program


### ... from program equivalence to instrumented programs
- Define reference implementations through **rewrite rules**
- Each rewrite rule introduces **ghost code** operating on **ghost variables**

## $\Omega_{\text{max}}$ Instrumentation operators for \max
- Ghost variables store the state that is needed to verify the reference implementation
- Rewrite rules
- Instrumentation invariant
    - Verify the array is not outdated, changed

### Applying the instrumentation operator
0. Normalize the program
1. Declare ghost variables
1. Select a subset of the program statements to which rewrite rules can be applied
1. ?

### A run of the instrumented program
- When entering loop, tracked info (g_max, g_lo, g_hi)

### Properties of instrumentation
- How are `P` and `P'` related
- **Soundness**: `P'` correct iff `P` correct.
- **Weak completeness**: if an assertion in `P'` can fail, and this assertion already existed in `P`, then `P` is incorrect
- It can happen that `P'` is incorrect even though `P` is correct
    - When applying the wrong rules in rewrite
    - ...

> The formal stuff: definition of the instrumentation operator

### Defensiveness and shadow variables
- use `assert` $l_{\max}$
- use **shadow variables** to detect cases in which too few statements

### ... from instrumented programs to invariant inference
- In **deductive verification**, we could verify the program P using a hand-written **loop-invariant** e.g.
 $$l_P = 0 \le i \le N \land \text{max\_volt} ...$$
- Invariants with extended quantifiers can be inferred through instrumentation
- We can *back_translate** l_p to obtain an invariant

### The search of instrumentations
- Which of the `batt_volt[i]` expressions should be rewritten?

## Counterexample guided search for instrumentation
- `Program P -> statements S -> instrumentation_space R -> oracle isCorrect -> Safe | Unsafe | Inconclusive`

### Implementation: MonoCera
- TriCera (C frontend) $\iff$ Eldarica

### Evaluation (2023)
- Benchmark suite
    - Altogether 151 C programs
        - 117 from SV-COMP
        - 12 crafted by use, instantiated with different array sizes
    - We only considered `Safe` programs
    - In SV-COMP programs, we rewrote certain loops using extended quantifiers
- Programs with unbounded/large array sizes (>1000) only verified by MonoCera 

## Conclusion
- Verification with complex specification operators corresponds to program equivalence
- Towards a library of instrumentation operators
    - Any operator that can be modelled as homomorphism into some **commutative monoid**
        - max, min forall, exists
    - Operators that can be modelled as homomorphism into **cancellative monoids**
        - sum, product, numof
    - Combination of multiple instrumentation operators
- Classical strategy in deductive verification
    - Programs are verified though annotation with contracts, invariants, etc.
    - **The original program remains unchanged**
    - Software model checking automates this process
- Alternative strategy:
    - Verify program by step-wise transformation to simpler programs:
    $$P \rightsquigarrow P^1 \rightsquigarrow \dots \rightsquigarrow P^K$$












