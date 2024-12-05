# Temporal Logic Specifications
![Audi](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.d7fDJ9JAKVI5uKuR2tUTaQHaEK%26pid%3DApi&f=1&ipt=abcdb1f9815cb074547362dac1af070d0e0cafd1de29e5dead79f3989bc4f1fe&ipo=images)
- Audi Verifiable AI
- Autonomous Driving Path Planning
- Learn the demonstrations of paths 
    1. May not follow traffic rules
    1. May collide with oncoming traffic
    1. May violate road safety constraints
- Refinement via STL constraints
- **Signal Temporal Logics**
     - Quantified representation of how the logic follows the path
- **Robustness Degree**
- Learning from demonstration
    - Model and its parameters
    - Hidden Semi Markov Model
- Parameter refinement

## Proposed Method
- Obtained Trajectory + Discretization $\rightarrow$ Robustness Degree Calculation
> The trajectory must avoid Region X...

### Scenario A: Valet Parking avoiding dynamic vehicles
- "The trajectory must avoid `Obst 1` and `Obst 2` AND maintain maximum distance between the `Obst 3` and `Obst 4`.

### Scenario B: Valet Parking adhering to traffic signal
- Model learn the traffic rules by adding them as logical constraints
- We propose a method to define dynamic obstacle via STL logics and compute robustness
- Our methods can handle multiple constraints at once
