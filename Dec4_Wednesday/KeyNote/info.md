# Evanesco: Hiding Formal Methods from _Muggles_ while Ensuring System Correctness
- Prof Marcel Oliveira (UFRN)
- Many SBMF in Natal 2006 ? 2012 2016

## Motivation and Challenges
- Formal Methods
    - Maths, Specification of precise models, development of correct systems
- Applications
    - Aerospace industry
    - Automotive systems
    - Medical devices
    - Railway systems
    - Cryptography
    - Distributed Systems
- Motivation and Challenges 

## The Muggle Problem
![muggle](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F0d%2F2c%2Fe3%2F0d2ce3dcc2c01f7f27dfe78b6f3811a8.jpg&f=1&nofb=1&ipt=ea3359db805393fef4d17c93e777cbe630e19f86ae794249b1ac812aeb8a1e7b&ipo=images)
- Evanesco -> makes things disappear
- Difficulty of using formal methods in practice
    - Software developers
    - Architects
    - Engineers
- Unfamiliar, find it complex
    - Gabriel
    - CRefine
    - CSP2HC
    - CSP2VHDL
    - BRICK Tool Support
- Nice tools developed, couldn't get adoption

- FormAr: automated formal verification of SysML-based software architecture descriptions
- Formalization and Verification of Relay based Railway Interlocking Systems (RIS)


## Evanesco
- Embedding formal verification into user-friendly tools
- "Muggles" can benefit from advanced formal methods
- No need to know about underlying magic

### Motivation
- Software architecture plays an importante role in system design
    - Anticipation of important decisions
    - Primary communication artifact among stakeholders
- Architecture Description

### SysADL: Software architecture in action
- SysML-based
- Multiple View Modelling
    - Structural
    - Behavioral
    - Execution
- Cross-View Checking
- SysADL Studio
- Types
    - Basic, Enums
- Structural Viewpoint: Organization of software architecture and their interactions
    - Ports: Data flow between components IO
    - Connectors: Responsible for receiving, processing and sending data to components
    - Components: Boundary or Non-boundary
- Behavioral Viewpoint: Activities on the structure to provide functionality
    - Constraints
    - Actions
    - Activities
        - Activity diagram
    - Allocation table
- Executable Viewpoint: Atomic actions that support the actual execution


### The Problem
- It gets too complex with scale
- Room Temperature Controller
    - Diagram with sensors, heater, cooler, UI
- Research Question?
    - Deadlocks?
    - Model inconsistencies?
    - Safety properties?
- SysADL Studio
    - Describe the architecture
    - A [CSP](https://en.wikipedia.org/wiki/Communicating_sequential_processes) Based Semantics for SysADL
    - Rules defined for elements of 
        - Types
        - Structural Behavioral and Execution viewpoint
- Components configuration (ALF Coding)
    ```alf
    Action = 
        input_1?value_1 ->
        input_2?value_2 ->
        ...
        input_n?value_n ->
        |~| value_out:
                {out | out <- csp_of(TYpe),
                    Constraint_1(p_1,...p_n)
                    Constraint_2(p_1,...p_n)
                }

    ```
## Formal Verification of Safety Properties
- How to hide it all fro the architects
- Evanesco on Architect inputs

- Quick Demo
    - YouTube [Formal Verification Tool for SysADL Model](https://www.youtube.com/watch?v=f8O2MM_vnxc&pp=ygUpRm9ybWFsIFZlcmlmaWNhdGlvbiBUb29sIGZvciBTeXNBREwgTW9kZWw%3D)

## Formalization and Verification of Relay based Railway Interlocking Systems (RIS)
- RIS: Safety mechanism to prevent conflicting train movements through tracks, particularly at junctions
- Signals controlled with relays
- Relay-Based RIS Diagrams
    - Ring-Bell Effect
    - Short-Circuit
- ClearSY, XM, RIS2CSP, CSP, FDR4, Results Analyzer
- Quick Demo
    - Verify for Ring-Bell on given circuit
- [csp_book](http://www.usingcsp.com/cspbook.pdf)
- [using_csp](http://www.usingcsp.com/)
