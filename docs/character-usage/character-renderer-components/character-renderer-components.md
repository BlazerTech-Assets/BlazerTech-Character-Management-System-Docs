---
uid: character-renderer-components
summary: Included components for using Unified or Layered Characters in-game
---

# Character Renderer Components

Character Renderer components will load and render characters in-game.

**All renderer components handle**:
1. Creating/loading a character
2. Applying the **Character Shader**
3. Assigning the **Animator Controller** if applicable
4. Managing **Overlay Layers**

## Components

| Renderer Component                                                                | Used For                                                                 |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| [Layered Character Template Renderer](#layered-character-template-renderer)       | Create and render a **Layered Character** from a template.               |
| [Unified Character Template Renderer](#unified-character-template-renderer)       | Create and render a **Unified Character** from a template.               |
| [Random Layered Character Renderer](#random-layered-character-renderer)           | Create a new **Layered Character** with completely random layer options. |
| [Layered Character Group Entry Renderer](#layered-character-group-entry-renderer) | Load a saved **Layered Character** from a group.                         |

---

## Layered Character Template Renderer

Creates a **Layered Character** from a **Layered Character Template** and displays it in-game.

![Layered Character Template Renderer Component](~/images/components/character-renderer-components/layered-character-template-renderer/layered-character-template-renderer.png)

- [Read More → Layered Character Template Renderer](xref:layered-character-template-renderer-component)  

### Requirements
- A [Layered Character Type](xref:layered-character-type)
- At least one [Layered Character Template](xref:character-templates#layered-character-template)

---

## Unified Character Template Renderer

Creates a Unified Character from a Unified Character Template and displays it in-game.

![Unified Character Template Renderer Component](~/images/components/character-renderer-components/unified-character-template-renderer/unified-character-template-renderer.png)

- [Read More → Unified Character Template Renderer](xref:unified-character-template-renderer-component)  

### Requirements
- A [Unified Character Type](xref:unified-character-type)
- At least one [Unified Character Template](xref:character-templates#Unified-character-template)

---

## Random Layered Character Renderer

Creates a completely randomized **Layered Character** from a **Layered Character Type**.  
The **Random Layered Character Renderer** component looks at every layer in the **Character Type** and selects a random **Layer Option** for each layer.

![Random Layered Character Renderer Component](~/images/components/character-renderer-components/random-layered-character-renderer/random-layered-character-renderer.png)

- [Read More → Random Layered Character Renderer](xref:random-layered-character-renderer-component)  

### Requirements
- A [Layered Character Type](xref:layered-character-type)


---

## Layered Character Group Entry Renderer

Loads a **Layered Character** of a specific **Layered Character Type** from a **Layered Character Group** and displays it in-game.

![Layered Character Group Entry Renderer Component](~/images/components/character-renderer-components/layered-character-group-entry-renderer/layered-character-group-entry-renderer.png)

- [Read More → Layered Character Group Entry Renderer](xref:layered-character-group-entry-renderer-component)  

### Requirements
- A [Layered Character Type](xref:layered-character-type)
- At least one **Layered Character** saved in a group

---

## Related
- [Character Templates](xref:character-templates)
- [Character Types](xref:character-types)
- [Character Groups](xref:character-grouping-system)