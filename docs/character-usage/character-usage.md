---
uid: character-usage
summary: Included components for rendering and animating characters.
---

# Character Usage

The **BlazerTech Character Management System** includes the runtime components needed to **load**, **render**, **animate** and **control** characters.

| Component Type                                                       | Purpose                                                                                                |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [Character Renderer components](#character-renderer-components)      | Load and render characters.                                                                            |
| [Character Animator Handler component](#character-animator-handlers) | Control specific **paramters** set in an **Animator Controller** used to properly animate a character. |
| [Character Movement components](#character-controllers)              | Handle player input and movement logic.                                                                |

---

## The Character Shader

A shader is used to visually display a character over the **Base Spritesheet**.  
Sprites from the **Base Spritesheet** whic is assigned in a **Character Type asset** are rendered in a component such as a **Sprite Renderer** or used in an **Animator Controller**.

If a **Unified Character** is used, the shader takes the single spritesheet of the character and shows that over the **Base Spritesheet**.  
If a **Layered Character** is used, the shader combines all layers into the final rendered character.  

This approach means only the **Base Spritesheet** needs to be sliced, all other spritesheets should have a `Sprite Mode` of `Single`.

> [!NOTE]
> If a **Character Renderer** component is used the shader will be applied automatically.

---

## Character Renderer Components

Character Renderer components will load and display any character regardless of the type

### Components

| Renderer Component                                                          | Used For                                                                 |
| --------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| [Layered Character Group Renderer](#layered-character-group-renderer)       | Load a saved **Layered Character** from a group.                         |
| [Layered Character Template Renderer](#layered-character-template-renderer) | Create and render a **Layered Character** from a template.               |
| [Unified Character Template Renderer](#unified-character-template-renderer) | Create and render a **Unified Character** from a template.               |
| [Random Layered Character Renderer](#random-layered-character-renderer)     | Create a new **Layered Character** with completely random layer options. |

## Character Animator Handlers

**Animator Handler components** control parameters set within an Animator Controller.

All **Animator Handler components** require a reference to an **Animator component**.

> [!TIP]
> An **Animator Controller** can be assigned to any **Character Type** and be automatically used when a character of that type is used.

---

## Character Controllers

**Character Controllers** are included components which let the player control the movement of a game object.

When used with a **Character Animator Hander** you can both control and aniamte any character with ease.