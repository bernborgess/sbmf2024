# A CSP semantics for UML state machines
- Aiming at hidden formal methods verification
- DIego Ferreira, Lucas Lima (UFRPE)

## Advantages of Formal Methods
- Risk Reduction
- Precision and Assurance
- Early Fault Detection

## Disadvantages of Formal Methods
- Complexity and expertise
- Interpretation of results
- Scalability

## Hidden Formal Methods
- Integrates formal verification into "intuitive" [modeling] languages (e.g: UML)
- Shields users from the complexity of formal notations and tools.
- Ensures robust verification
- Enables the possibility of traceability by mapping counterexamples back to diagrams

> Secret Ninja Formal Methods\
> The Hidden models of model checking 

### State Machine Diagram
- reactive systems
- event driven behavior
- check **Deadlock** and **NonDeterminism**

## Overview of the Approach
- UML $\rightarrow^{\text{Translation}}$ CSP $\rightarrow^{\text{Verification}}$ FDR $\rightarrow$ OK!
- **Evanesco** will hide the translation and verification

### Why CSP?
- Expressive language
- Compositional operators
- Mature model checker (FDR)
- Established _refinement theory_

### A glimpse of CSP
- Types and values
- Channel declaration to communicate events
- Processes
    - External choice with conditions
    - Interleaving (parallel without sync)
    - Synchronized parallelism

### Research Project
- Define a formal semantic framework from UML state machines, translating them to CSP
- State Machine Diagram Semantics
- Parser - StartSync Controller
    - `States_id = On || Off || Recharging || Choice`
    - `Transitions_id = States_id [[interrupt.On <- batteryDepleted,
        interrupt.on <- TurnOff]]`
    - Memory on the battery
    - Internal Actions
    - Simple State
    - Composite State
- Tool Support: Plugin for AcUML Tool
- Counter Example:
    - Navigation mechanism to map the conter example to parts of the diagram
- Demo:
    - Check for deadlock, translate and check the property

## Related Work
- Borger, Djaaboub, Zhang
- AMS, LOTOS, Gamma, CSP, CSP# 
- Internal Actions, Composite State, Memory, Automated Translation, Hidden Verification, Traceability, Formalism

## Next Steps
- Extend the framework
- Explore complex systems
- Integrate state machines with other diagrams
