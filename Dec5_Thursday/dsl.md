# Software Language Engineering Towards Formal Systems Engineering: a Journey
- Julien [Deantoni](Julien.deantoni@univ-cotedazur.fr) (Universite Cote d'Azur)

## Kairos Team
- Multiform Logical Time for Cyber-Physical System Design

## Cyber Physical Systems
- Immersed in physical environment
- Control processes
- Forecasting, controlling
- 3 Properties
    1. Intense link between cyber and physical parts of the system
    1. Effective collaboration between different scientific domains and stakeholders
    1. Complex and original underlying hardware
- Software intensive system engineering
    - Share using non-modelling artifacts (Word,PowerPoint,Excel)
- Model Based System Engineering
- **Capella** is an open-source solution for model-based systems engineering (by Thales)

## Problem #1: Model Behavior is not Explicit
- Language
    - Syntax
    - Behavioral semantics $\rightarrow$ Operational semantics
    - Even sharing an artifacts, the semantics may be different between tools
- Model
    - Structure (AST)
- Runtime
    - Tool 1, Tool 2, Tool 3 ...

## Proposition #1: Making explicit a model behavior
- Model behavior must
    - Represent the control aspect of the operational semantics of the language applied to the specific model structure
- We used Logical Time trough the _Clock Constraint Specification Language (CCSL)_ to express them    
- Clocks (events) are a totally ordered set of Instants (event occurrences)
- All Clocks are a priori independent from the others
- Constraints can be specified on instants or clocks to enforce a specific (partial) order
- Create precedence relation between clocks
```javascript
import 'hdr.markedGraph' as m1
Clock t1_fire(m1::t1)
Clock t2_fire(m2::t2)
Clock t3_fire(m3::t3)
Clock t4_fire(m4::t4)
t1_fire precedes t2_fire
t1_fire precedes t3_fire
t2_fire precedes t3_fire
t3_fire precedes t4_fire
```
- [times](https://timesquare.inria.fr)
- Check if the trace conforms to the semantics 
- Image in the UML model

## Proposition #2: Multi View Modelling
- Use each CCSL clock from the model behavior as a possible **handle** to coordinate different model behaviors
- Thesis of Carlos Ernesto Gomez Cardenas $\rightarrow$ **Modeling Functional and Non-Functional Properties of Systems based on a Multi-View Approach**
    - Consistency
    - Explicit Coordination
    - Based on the UML, SysML and MARTE standards
- Relation between operational semantics and the behavior model?

## Problem #2: Missing relation between model behavior and operational semantics
- The **syntax** defines the expected forms of model structure
    - Usually defined by a meta-language that can be tooled so that all syntax can take benefits of it (Ecore,XText)
- The **operational semantics** defines the expected set of execution traces for a specific model structure
- **non tractable**
- _Structural Operational Semantics (SoS)_: Structured way to represent the operational semantics of languages
    - Kermeta / Maude can be used to specify the SoS
- Handling of concurrency and time entangled with other concerns

## Proposition #3: Reifying concurrency of an operational semantics
- Structuring the operational semantics to make explicit the concurrent and timed aspects (the control)
    - Execution state
    - Rewriting rules
    - Domain Specific Events
    - Concurrency & Time Model
- **KerMeta**: static introduction of
    - Execution state as attributes of the syntax concepts
    - Rewriting rules as methods of the syntax concepts
- **MoCCML**: composition of two related languages
    - MoCC defines a set of domain specific constraints between events (DSE)
    - Mapping: act as a glue between the MoCC and the rewriting rules. It specifies both the DSE and how to apply constraint on them according to a model structure
```python
package markedgraph
    context Transition
        def: fire : Event = self.fire

    context Place
        inv produceBeFromConsumer:
            Relation Precedes(self.input.fire,self.output.fire)
```
- Tooling
    - Modeling Workbench
    - A generic execution engine only configured by the semantics!
    - Making the capella language executable

## Lingua Franca
- Developed by iCyPhy at Berkeley
- LF is a polyglot coordination system
- 3 dimensions of time
    - Logical times _Timed Concepts_
    - Micro Steps, used internally to order logical time with same tag
    - Causalities, used between two logical time instants for the partial.
- Developed on top of the Eclipse Modeling Framework
- Equipped with translational semantics
- Pros:
    - Optimized
    - Time aware
    - Functionally Deterministic
    - Intensively tested
- Cons:
    - Difficult to learn
    - ...

## Conclusion
- 700 lines of code
- Defined the MoCCML scenario
- Coordination framework: Ptolemy
- the BCOOL - Behavioral Coordination Operator Language
- Gemoc Concurrent Engined 

## Proposition #5: CoSim20
- Generation of dedicated distributed and efficient Master Algorithm
- FMI - Functional Mock-up Interface
- XCapella in the GEMOC Studio, from debugging to co-simulation (YouTube)
- Instead of just time steps, do steps that express the operational semantics of the language
- Validation: Use case
    - Box Cooling System
    - CPU Cooling System

## Perspectives about the model behavior CCSL
- Exploitation of the clock graph
- Deadlock detection
- Potential deadlock detection
- TCOS is an open source language engineering tools
- Long Term Perspectives
    - TIMES Improve Multi Engineering Synergies OR Tempo com Inspiração para Melhorar e Expandir Sinergias



