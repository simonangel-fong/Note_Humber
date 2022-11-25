# Realizing Use Cases

[back](../index.md)

[toc]

---

## From Requirements To Classes

- Requirements (use cases) are usually expressed in user language
- Use cases are units of development, but they are not structured like software
- The software we will implement consists of classes
- We need a way to translate requirements into classes

---

## Goal of Realization

- An **analysis class diagram** is only an interim(暂时的，临时的) product
- This in turn will be realized as a **design class diagram**
- The ultimate product of realization is the software implementation of that use case

---

## Communicatioin Diagram

- Analyse one use case at a time
- Identify likely classes involved (the use case collaboration) 
    - These may come from a `domain model`
- Draw a `communication diagram` that fulfils the needs of the use case
- Translate this into a `use case class diagram`
- Repeat for other use cases
- Assemble the `use case class diagrams` into a single `analysis class diagram`

## Robustness Analysis

- Aims to produce set of classes robust enough **to meet requirements** of a use case
- Makes some assumptions about the interaction: 
    - Assumes some class or classes are needed to **handle the user interface**
    - **Abstracts logic** of the use case away from entity classes (that store persistent data)

---

### Robustness Analysis Class Stereotypes

- Class stereotypes differentiate the roles objects can play:
    - **Boundary objects model** interaction between the system and actors (and other systems)
    - **Control objects** co-ordinate and control other objects
    - **Entity objects** represent information and behaviour in the application domain
    - Entity classes may be imported from domain model
    - Boundary and control classes are more likely to be unique to one application

Boundary Class Stereotype

Boundary classes represent interaction with the
user - likely to be unique to the use case but
inherited from a library

---

[TOP](#realizing-use-cases)
