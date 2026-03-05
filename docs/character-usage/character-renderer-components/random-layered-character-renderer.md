---
uid: random-layered-character-renderer-component
summary: Component for creating and displaying a completely randomized Layered Character in-game
---

# Random Layered Character Renderer Component

The **Random Layered Character Renderer** creates a new completely randomized **Layered Character** at runtime by selecting a random **Layer Option** for each layer of the character.  

> [!NOTE]
> This component contains no options for controlling how the character is randomized. For advanced character randomization use a [Randomized Layered Character Template](xref:randomized-layered-character-templates).

This component is responsible for:
- Creating a random **layered character**
- Applying the **Character Shader**
- Assigning the **Animator Controller** (Optional)
- Managing **Overlay Layers**

**Requirements**:
- A [Layered Character Type](xref:layered-character-type)

![Random Layered Character Renderer Component](~/images/components/character-renderer-components/random-layered-character-renderer/random-layered-character-renderer.png)

---

## Quick Setup Overview

Quick overview of how to setup the **Random Layered Character Renderer** component.

1. Add the component to a **GameObject**.
2. Assign **Renderer** (Usually a Sprite Renderer).
3. optionally assign **Animator**.
4. Configure **Loading Settings**.
5. Assign the **Layered Character Type** you want to use.
6. Play your game and if **Load Character On Start** is enabled, a new completely randomized character will be displayed.

---

## Setup

Full step-by-step guide to setup the **Random Layered Character Renderer** component.

### Add Component
Add the component to a GameObject by clicking `Add Component` in the inspector window.

![Add Random Layered Character Renderer Component](~/images/components/character-renderer-components/random-layered-character-renderer/add-component.png)

---

### Assign Renderer Component

Assign the component responsible for rendering the character's sprites. 

In most cases, this will be a **Sprite Renderer**.
The **Character Shader** will be applied to this renderer.

![Renderer Reference](~/images/components/character-renderer-components/renderer.png)

---

### Assign Animator Component (Optional)

If your **Character Type** asset includes an **Animator Controller**, it can be applied automatically when the character is loaded.  

To enable this:
1. Enable `Set Animator Controller`.
2. Assign the target Animator component.

![Animator Reference](~/images/components/character-renderer-components/animator.png)

---

### Configure Loading Settings

The **Loading Mode** determines how the character is loaded at runtime. This can significantly impact performance.

![Loading Mode](~/images/components/character-renderer-components/loading-settings.png)

| Loading Mode     | Description                             | Advantages                                          | Cons                                                    |
| ---------------- | --------------------------------------- | --------------------------------------------------- | ------------------------------------------------------- |
| **Asynchronous** | Loads the character in the background.  | No frame stutters or freezes.                       | Character is temporarily invisible while loading.       |
| **Synchronous**  | Loads the character on the main thread. | Character is immedietely renderered the same frame. | May cause frame stutters depending on spritesheet size. |

#### Recommended Usage
- Use **Asynchronous** loading for background NPCs or characters that aren't time sensitive.
- Use **Synchronous** loading when the character must appear Immediately, such as a player character.

---

#### Load Character On Start

If `Load Character on Start` is enabled, the character is automatically created and rendered during the `Start()` method

If disabled, the character must be loaded manually through script using the [GetAndShowCharacter()](xref:BlazerTech.CharacterManagement.Components.CharacterRendererBase#BlazerTech_CharacterManagement_Components_CharacterRendererBase_GetAndShowCharacter) method

---

### Assign Character Type

Assign a **Layered Character Type** asset.  
The renderer will create a randomized character using the **Character Type** asset you assign.

![Character Specifications](~/images/components/character-renderer-components/random-layered-character-renderer/character-specifications.png)
---

### Hit Play

![Play Buttons](~/images/misc/play-buttons.png)

Enter Play Mode.

If `Load Character On Start` is enabled in **Loading Settings**, the character will be automatically created and displayed.