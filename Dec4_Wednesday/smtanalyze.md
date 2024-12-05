# SMTQuery: Analysing SMT-LIB String Benchmarks
- Paul Sarninghausen-Cahn

## What is SMT?
- SAT Problem
- SMT - extension of a theory - of *strings*
- Satisfiability module Strings:
    - Word equations
    - regular constraints
    - length constraints
- Example: $aaaX = aaY$

### SMT-LIB
- formalize into SMT-LIB files
```smt2
(assert (= (str.++ aaa X) (str.++ aa Y))
```

## Motivation
- There are over thousands of string benchmarks for smt-lib
- Custom Analysis:
    - Query `SELECT count FROM woorpje WHERE (hasRegex and hasWEQ)`
    - Query `SELECT count FROM automatark24:simplenew WHERE isCorrect(CVC5)`
    - Query `SELECT instanceTable FROM pisa`
- New Benchmarks from smtlib files
    - `SELECT SMTLib FROM kaluza WHERE ((hasAtLeast5STringVariables and hasRegex) and (not hasLinears))`

### Architecture
- Database, Solvers, Filesystem; QLANG Query, Result
- AST Enriched with computations

## Use Case - Classification of instances
- `SELECT features FROM *` returns a CSV-file of 21 numerical properties for each instance, states of min-DFA
- Train a random forest machine learning model that determines which solver is best suited.
- CVC5 benchmarked the best for the Instances
- `SELECT DecisionTree FROM pisa`

## Summary
- Custom Analysis
    - SQL-like interaction with the tool
    - easily expandable with new predicates
    - extraction of files, features and graphics
- creation of new benchmarks
- expandable to new tools
