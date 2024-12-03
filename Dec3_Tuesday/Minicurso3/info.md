# Math Saves Lives: How Formal Methods Keep Trains on Track and Software from Going off the Rails
- Mr. Thierry Lecomte (CLEARSY, France)

- [code](https://github.com/CLEARSY/ETMF2024) available

### Clearsy: Safety Solutions Designer
- SME created in 2001
- 150+ engineers
- 120 MR$ turnover 2022
- Aix, Lyon, Paris, Strasbourg
- Safety critical systems
- AtelierB Editor
- SIL4 Products
- System formal engineering, RAMS services

### My CV
- Development of Atelier B and its proof tools
    - Applied Formal methods Teach at IMG
- R&D and education
    -  Projects in schools
    - "The B Method - Marketing Video"
- Application to industry
    - Smartcard certification
    - ProB for formal data validation
    - Railways signalling software
    - SP metro: platform screen doors control

### My Subjects
- Safety
- Autonomous Mobility
- ...

> We are going to design a train line with different configurations and see how formal methods apply

#### Safety
- failing systems
- ...
- Safety is about things that happen 1 in 1000000

## Failing Software-Based Systems
1. Natural language requirement -> Formal Model
1. Specification -> Formal Dev Assertions (Frama-C)
1. Design -> Redundancy CompCERT
1. Source code
1. Binary code -> Redundancy 2oo2 (2 out of 2), 2oo3 (2 out of 3)
- Hardware fail -> Test, RE, Redundancy
- Wrong environment specification
- Wrong exploitation procedure

## Safety @ Railways
- Strong standards
    - SIL3: $10^{-7}$ failures per hour
    - SIL4: $10^{-9}$ failures per hour
- Systematic failures
- Random failures
- Certification

## Railways in a Nutshell
- Move people / goods from point A to B
    - Using predefined paths
- Trams, Metros, Freight train, Passenger Trains, High Speed Train
### Safety Properties
- No collision
- No over-speed
- No derailment
![train-collision](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.3oOUvFE96RnI5dJrAwlsaAHaEK%26pid%3DApi&f=1&ipt=fae380584a256de8635245951a52e84350c6447ea6414117047fe538008dbb62&ipo=images)
#### No collision
- Collision with trains :bullettrain_front:
    - Braking curves
- Collision with obstacles :cow::monorail:
    - Driver, tunnels, sensors
- Collision with animals

![overspeed](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.mgLuSn48ifpSaQs2z8SwaQHaEK%26pid%3DApi&f=1&ipt=f31cf7cb9b33f315e3a4375c3cb6478205f81fba852c4d26e0ac9a47145075ca&ipo=images)
#### No Over-Speed
- Emergency braking if speed over speed limit
    - Shutdown engine, trigger break
    - Alarm (sound) when approaching speed limit
> Train driver has to push a button every 30 sec to show he is alive
- Means to measure speed
    - Odometer, GNSS (satelite) out
- Resume travel when at full stop

![derailment](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.wsiJhdEL4yFPJssCrDqumQHaE8%26pid%3DApi&f=1&ipt=df6afbf64a8b5e8cc5b111e6b01236ac861d60965c060be5c09a2dc5b7af789e&ipo=images)
#### No Derailment
- Prevent switch to move when a train in passing by
- Routes are allocated to trains by interlocking (IXL)
    - Switch fixed until the train leaves
- The absence of derailment is not always guaranteed
    - After and earthquake

![kiwitrain](https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.szARnAAIjz0JI_TxM2QllgHaD4%26pid%3DApi&f=1&ipt=fc6a31587b4b5f9578335132ba810bc0d7bd520cc941f5cb4e9513f7b00182c4&ipo=images)

## Types of Trains
### Monocab
![monocab](https://www.notebookcheck.net/fileadmin/Notebooks/News/_nc4/monocab_autonom_taxi94.jpg)
- Compact, autonomous monorail vehicle designed to revitalise disused railway tracks
- Uses one rail only with advanced gyroscopic

#### Safety
- No collision with train on same rail
- No collision with train on other rail
    - Gyroscopic mechanism fails
    - Shaky passengers, strong lateral wind
    - Avoid with physical obstacles between cars, way to detect the situation (angle, speed)
    - Feet, to limite angular deviation
- No collision with obstacles
    - Buffer stop
    - Use an odometer to detect it's close to the platform
    - Beacons to provide location when confidence is too low
    - Laser measuring distance
    - Internal timer can activate a watchdog
- No collision with animals

## Short Introduction to B
1. Natural language requirement
1. **B Specification**
1. **B Implementation**
1. C generated code 
1. binary code
- Coherence and refinement
- Cyclic Software single thread

### Proof obligations from B Models
- Static Aspect
    - Invariant
    - Sets, Constants, Values
- Dynamic Aspect
    - Initialization
    - Operations

### B Code Generation
- Close to C or ADA
- [mooc](https://mooc.imd.ufrn.br/)
- Software Formal Development
    - (1998) Paris L14 Automatic Train Protection (ATP)
        - Emergency braking in case of danger (86 kloc B 110 kloc Ada)
    - (2000-2024) Used by 30% radio-based control metro worldwide CDGVAL shuttle (500 kloc / automatic refinement)
    - (2006-2024) Used for paris L4,L4,L13,L14 (Olympics)
    - (2024-2030) To be used for Paris L15,L16...

#### Formal IDE for B
![atelier_b](https://prob.hhu.de/w/images/4/4d/ProB_AtelierB_Proof.png)
- Model software (B) and systems (Event-B)
- Automatic and interactive proof
- Code generation
- Simple installer

#### PROB
![prob](https://prob.hhu.de/w/images/e/e6/ProB_BlockInit_Screenshot.png)
- Same support but simple B models architecture
- Model checking, verification

> Code [available](./Conf1/CTX.mch)

### Multiple Trains
- Definition of fixed blocks
- Track circuit to detect if there is a train in the block
- Signals on each interlocking
- One train maximum per block
- Signal (virtual)
    - Red: next block is occupied, stop before the next signal
    - Orange: next ?
- code [available](./Conf2/CTX.mch)
- model [available](./Conf2/IXL.mch)

#### Controlling Signals
- We cannot specify where the trains are as we do not have this information
- Sensor information is made redundant and diverse

### Garage and Switches
- Interlocking control switches position (`left`,`right`,`unknown`)
- Redundant sensors to detect switch position
- Switch cannot move when associated track circuit is occupied (=> derailment)

#### Detecting the position of a switch
- With 3 contact sensors
- Each sensor returns a measure
- code [available](./Conf3/BLADE.mch)
- refined [implementation](./Conf3/BLADE_i.imp)
- Other [function](./Conf3/BLADE2_i.imp)

## Properties of the B mathematical language
### Formal Data Validation
- B predicates
- Set Theory, FOL, etc.

## Formal Methods in Action
- Software Development _B_
- Data Validation _PROB_
- System Specification Proof _B_

## Conclusion
- FM can complement engineering when designing a system
- Safety is by design
    - There is no ultimate design
    - Only consequences of decisions and a reasoning
- Particularly useful when dealing with cyber-critical systems