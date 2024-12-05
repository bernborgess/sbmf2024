# Verifying Integrated Designs of UML
- State Machines and Activities using CSP
- Diego Ferreira, Lucas Lima (UFRPE)

## Context
- TMT - [OpenMBEE](https://www.openmbee.org/#)
    - Aims to define a open model based engineering environment
    - Nasa - 30m telescope model
- Provide the semantics
- Develop a framework to automatically verify deadlock and nondeterminism in integrated UML

## The Approach
- Use UML and hide complexity under Evanesco
- Deadlock and NonDeterminism
- Activity and State Machine
    - Workflow - Imperative Behavior
    - States - Represent the situation of a state and transitions
- Activity Diagrams Semantics (using CSP)

## Integrate @ UML Level
- `invoke(actName, in i1 = q,..., out j = o1, ...)`
- Use the entry action of the state
- Semantic Relation
- Use the JVM, FDR and Astah

 




