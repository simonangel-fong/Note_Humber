# Requirements Classes

[back](../index.md)

[toc]

---

## Why analyse Requirements?

- Requirements (Use Case) model alone is **not enough**
  - There may be repetition
  - Some parts may already exist as standard components
  - Use cases give little information about structure of software system

---

## The purpose of analysis

- Analysis aims to identify:
  - A **software structure** that can meet the requirements
  - **Common elements** among the requirements that need only be defined once
  - **Pre-existing elements** that can be reused
  - The **interaction** between different requirements

---

## What an analysis model does

- An analysis model must confirm **what users** want a new system to do:

  - Understandable for users
  - Correct scope
  - Correct detail
  - Complete
  - Consistent between different diagrams and models

- An analysis model must also specify what designers **must design**:

  - Unambiguous about scope and detail
  - Consistent, e.g. about the names of classes, perations, etc. in different diagrams
  - Complete, e.g. regarding non-functional requirements such as localization
  - Correct, e.g. regarding the multiplicities of associations between classes

- Describes **what the software should do**
- **Represents people, things and concepts** important to understand the system
- Shows **connections and interactions** among these people, things and concepts
- Shows the **business situation** in enough detail to evaluate possible designs
- Is organized / structured so it can be useful for designing the software

---

## How to model the analysis

- The **main technique** for analysing requirements is the <u>class diagram</u>
- **Two main ways** to produce this:
  - Directly based on knowledge of the application **domain** (from a **Domain Model**)
  - By producing a separate class diagram for each use case, then assembling them into a single model (an **Analysis Class Model**)

---

## Class Diagram

[Class Diagram](../uml/class_diagram.md)

---

[TOP](#requirements-classes)
