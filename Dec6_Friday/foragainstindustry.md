# Formal Methods For or Against Industry?
- Thierry Lecomte

## Why our feedback is valuable
- Developing formal methods around B
    - Atelier B
    - Customer specific engineering tools
- Connecting with formal tools
    - ProB, VisB (for Muggles)
    - SMT solvers (altergo, cvc4/5, vampire, z3, etc.)
- Using formal tools for industrial projects
    - Development
    - Verification, validation, certification
    - Several application domains (mainly railways, mobility at large, smartcard, defense, energy)

## Formal Methods Application
- Synergies between industries and Academia
- Why is industry using FM?
    - Help managers to sleep better
    - Sometimes reduces costs
    - Mandatory (standards)
    - Someone is going to die
    - Someone is going to lose $
- Why is industry using FM?
    - Help managers to sleep better
    - Complicated
    - Many (most?) engineers not able to handle it
    - SW companies **plan based on maintenance fees**l

## Formal Methods in Railways
- Proven software "The V cycle"
- Parameters formal validation

### Formal System Proof
- Safety reasoning exhibited "why was it designed this way?"
- For legacy systems and never implemented specs
- **5 Years to convince Muggles** - New York City Transit
- **Wizards at Key Positions**
    - RATP Safety proof of OCTYS CBTC
    - SNCF (Marseille-Vintimiglia) Safety Proof

### Formal Software Development
- Paris L14 Automatic Train Protection (ATP) **Muggles with 12-year late project**
    - Emergency braking in case of danger
- Used by 30% radio-based control metro worldwide CDGVAL
- To be used for paris trains

### Formal Data Validation
- Safety critical constant data formally specified & model-checked
- 100k data chunk, up to 2k rules, Human errors avoided
- First tool to verify embedded topology data **Muggles with Maintainability Problem**
- First tool integrated into CBTC metro dev process **Errors found on operated systems**
- Fist application to ERTMs (beacons)

#### Formal Data Validation: The Proof!
- TGV overspeed over a switch
    - 170 km/h instead of 100 km/h in La Milesse (France)
    - due to erros not detected during **human** data validation

#### CLEARSY Safety Platform
- `4oo4 Software`, `2oo2 Software`
- Building blocks developed for platform screen doors (PSD) controllers French R&D Project **Muggles Copied our system**

#### REX: Formal Methods in Railways
- Well-oiled process: deliverables accepted, models audited, no fatalities in metros
- Exploiting companies mention more and more FM in call for tender (because of past problems)
- Standards not "degrading" over time
- But FM not selling by itself:
    - Continue to be used because already in cycle

#### Formal Methods in SmartCard
- Common criteria
    - The only standard where formal methods are mandatory
    - EAL6+: formal model, functional specification complies with security policy, traceability with implementation
- Research project to model circuit and generate VHDL
    - Formal model as a link between datasheet and VHDL
    - Demonstration on STMicroelectronics MPU (20k gates)
    - **Refused by Muggles**
- B and Coq certification: deliverables accepted, models audited, process different between countries (Fr/Ger)
- Reusability of models for product lines
- Interest in FM depends on people
    - Knowledge transfer if internal FM expert, subcontracting if not
    - Often abandoned because of certification costs
- Separate evaluation
    - FM for nominal behavior

## Formal Methods in Autonomous Mobility
- Situation heterogeneous
    - Road + track shuttle
    - Low traffic regional train lines
    - Firefighter drone
    - Underwater drone
- Need real/agreed on standards
    - Driver/pilot to ensure safety
    - Remote control to handle unexpected situations
    - Who is responsible/covers accidents
    - Certified AI (How? Who?)
- Social acceptance
- **Muggles look for demo**
- FM not yet form perception-based AI
    - More for TRUE/FALSE ON/OFF Open/Close
- Automotive vs rails
    - More constraints because of tracks
- Economical model

## Synthesis
- Knowing the application domain
- Speak the same language
- Show examples in their domain
- Identify their problems
- Propose an approach combining tools or requiring to repurpose tools
- FM acceptance depends on domains/industries
- Contribution to SotA
    - Modelling safety reasoning, Formal Data Validation didn't exist 20 years ago
- Open questions where FM could add value:
    - Complex interactions SW,HW,env,hackers,people
    - How to handle Perception-based AI
- Subjects where AI could add value

