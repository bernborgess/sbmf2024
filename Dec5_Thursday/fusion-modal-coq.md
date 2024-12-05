# Soundness-Preserving Fusion of Modal Logics in Coq
- Miguel ?

## Introduction
- Modal logics are useful tools for philosophy
- Modal logics with server operators are _multimodal_
- Not easy to combine different logics
- Proof assistants may be useful for combining logics
- [code](github.com/funcao/LML)

## Related Work
- Non tackles methods of combining logics themselves

## Multimodal Logics
- An extension of modal logic that allows the representation of different modalities
- Interdefinable
- The grammar is an extension of modal logics, which is a extension of classical logic

## Combining Logics
- New topic, join up simple systems, or break up a complex one.
- The fusion of modal logics is a binary operation defined on the class of modal logic semantically defined by Kripke
- Preserves properties of the logics combined
- Completeness, Decidability ...
- Define a structure to represent the modal formulas, with indexes
- Proofs of soundness and completeness


## Combining Modal Logics in Coq
- Represent the sets of indexes
- `modal_index_set` typeclass and prove that this instance exists
- Any index in this set belongs to either base set
- Lifting
    - Show that an object can be in different types at once
    - Define some instances to relevant components
- Splitting and Splicing
- Classes of Frames
    - All have the same restriction applied to them
- Soundness

### Example: Fusion of S4 with S4
- Show that each component is sound, so the fusion will be sound

## Conclusion
- Proved that fusion preserves soundness
- Modal logic served as a basis for this work
- No other implementation of fusion in the proof system
