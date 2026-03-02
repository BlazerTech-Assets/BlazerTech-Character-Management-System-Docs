---
uid: character-animator-handler-components
summary: Components for controlling parameters in an Animator Controller
---

# Character Animator Handler Components

**Animator Handler components** control **parameters** within an **Animator Controller**.

All **Animator Handler components** require a reference to an **Animator component**.

> [!TIP]
> An **Animator Controller** can be assigned in any **Character Type** asset and be automatically used when a character of that type is used.

---

## Top Down Character Animator Handler

Reads input from a [Top Down Movement Controller](xref:top-down-movement-controller-component) component to update **paramters** in an **Animator Controller**.

![Top Down Character Animator Handler Component](~/images/components/character-animator-handler-components/top-down-character-animator-handler/top-down-character-animator-handler.png)

- [Read More → Top Down Character Animator Handler](xref:top-down-character-animator-handler-component)  

---

## Top Down Character Phsics Animator Handler

A physics driven component, every frame the GameObjects position is compared to its position last frame to determine **direction** and **speed**. This information is then used to update **paramters** in an **Animator Controller**.

![Top Down Character Physics Animator Handler Component](~/images/components/character-animator-handler-components/top-down-character-physics-animator-handler/top-down-character-physics-animator-handler.png)

- [Read More → Top Down Character Physics Animator Handler](xref:top-down-character-physics-animator-handler-component)  