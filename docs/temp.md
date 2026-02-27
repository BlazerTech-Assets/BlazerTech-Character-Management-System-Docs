---
uid: temp
summary: Component for creating and displaying a Layered Character from a Layered Character Template at runtime.
---

# Layered Character Template Renderer Component

The **Layered Character Template Renderer** creates a new **Layered Character** from a **Layered Character Template** and renders it in-game.

This component handles:

- Creating a **Layered Character instance**
- Applying the **Character Shader**
- Assigning the **Animator Controller** (optional)
- Managing **Overlay Layers**

---

## Requirements

- A [Layered Character Type](xref:layered-character-type)
- At least one [Layered Character Template](xref:character-templates#layered-character-template)

![Layered Character Template Renderer Component](~/images/components/character-renderer-components/layered-character-template-renderer/layered-character-template-renderer.png)

---

# Setup

## 1. Add the Component

Add the component to a GameObject by clicking **Add Component** in the Inspector.

![Add Layered Character Template Renderer Component](~/images/components/character-renderer-components/layered-character-template-renderer/add-component.png)

---

## 2. Assign a Renderer Component

Assign the component responsible for rendering the character’s sprites.

In most cases, this will be a **Sprite Renderer**.  
The **Character Shader** will be applied to this renderer.

![Renderer Reference](~/images/components/character-renderer-components/layered-character-template-renderer/renderer.png)

---

## 3. Assign an Animator (Optional)

If your **Character Type** includes an **Animator Controller**, it can be applied automatically when the character loads.

To enable this:

1. Enable **Set Animator Controller**
2. Assign the target **Animator** component

If disabled, the renderer will not modify any Animator settings.

![Animator Reference](~/images/components/character-renderer-components/layered-character-template-renderer/animator.png)

---

## 4. Configure Loading Settings

The **Loading Mode** determines how the character is created at runtime. This can significantly impact performance.

![Loading Mode](~/images/components/character-renderer-components/layered-character-template-renderer/loading-settings.png)

| Loading Mode     | Description | Advantages | Considerations |
|------------------|------------|------------|----------------|
| **Asynchronous** | Loads the character in the background. | Prevents frame stutters or freezes. | Character is temporarily invisible while loading. |
| **Synchronous**  | Loads the character on the main thread. | Character appears on the next frame. | May cause frame stutters depending on spritesheet size. |

### Recommended Usage

- Use **Asynchronous** loading for background NPCs or non-critical characters.
- Use **Synchronous** loading when the character must appear immediately, such as a player character.

---

### Load Character On Start

If **Load Character On Start** is enabled, the character is automatically created and rendered during `Start()`.

If disabled, the character must be loaded manually through script.

---

## 5. Assign a Template

Assign a **Layered Character Template** asset.  
The renderer will use this template to generate a new character instance.

![Character Specifications](~/images/components/character-renderer-components/layered-character-template-renderer/assign-template.png)

---

### Use Cache

Determines whether previously generated characters are reused.

- **Enabled**  
  If a character has already been created from this template, the cached instance is reused.

- **Disabled**  
  A new character instance is always generated.

#### When to Enable or Disable

- Keep enabled for improved performance in most cases.
- Disable when using a **Randomized Template**, so a new random character is generated each time.

---

## 6. Play the Scene

Enter Play Mode.

If **Load Character On Start** is enabled, the character will automatically be created and displayed.