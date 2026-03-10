---
uid: character-templates
summary: Blueprints for creating characters during runtime.
---

# Character Templates

**Character Templates** are Scriptable Objects that act as blueprints for creating characters at runtime.

Instead of manually configuring characters in code, Templates let you define reusable character configurations directly in the Editor.
They provide an easy way to use pre-made characters anywhere in your project.

**Character Templates** can be created by **right clicking** the project window and navigating to  
`Create > BlazerTech > Character Management System > Character Templates`.

<img src="~/images/character-templates/create-character-template-guide.png" alt="Create Character Tempalte Guide" width="500" />

---

## What is a Character Template?

A Character Template defines:

- The **Character Type** the character will use
- The default **Name** and optional **Display Name**
- How the character’s appearance is configured

At runtime, a **Renderer component** can be used to easily create and display a character from a template.

[Read More → Character Renderer Components](xref:character-renderer-components)

---

## Character Template Variants

There are three types of Character Templates.

---

### Unified Character Templates

Used to create characters with a single, fully assembled spritesheet.  
They are linked to a [Unified Character Type](xref:unified-character-type) asset.

![Unified Character Template](~/images/character-templates/unified-character-templates/unified-character-template.png)

Unified characters use a single spritesheet which contains all animations for the character. That spritesheet is assigned to the **Unified Character Template** and is used by any characters created by that template.

> [!NOTE]
> The **Character Spritesheet** does **NOT** need to be sliced. All frame and slicing data is contained within the **Unified Character Type** the template is linked to.


[Read More → Unified Character Templates](xref:unified-character-templates)

---

### Layered Character Templates

Used to create modular characters composed of multiple layers.  
They are linked to a [Layered Character Type](xref:layered-character-type) asset.

![Layered Character Template](~/images/character-templates/layered-character-templates/layered-character-template.png)

A **Layered Character Template** lets you assign which Layer Option each layer should use.  
This gives you full control over exactly how the character will look.  

When used, a new **Layered Character** is created using the **Layer Options** you assign for each layer of the character.

[Read More → Layered Character Templates](xref:layered-character-templates)

---

### Randomized Layered Character Templates

Used to create randomized modular character based on a set of pre-defined rules. Unlike a standard [Layered Character Template](#layered-character-templates) where the final character is the same every time, a Randomized Layered Character Template creates a new random character every time it's used.

![Randomized Layered Character Template](~/images/character-templates/randomized-layered-character-templates/randomized-layered-character-template.png)

**Randomized Templates work great for**:
- Background NPC generation
- Characters with slightly randomized appearances
- Situations that need controlled randomness with features for additional fitlering

**Key Characteristics**:

- Per-layer selection rules
- White/Black list support
- Weighing support
- Regex-based filtering

[Read More → Randomized Layered Character Templates](xref:randomized-layered-character-templates)

---

## Related

- [Character Types](xref:character-types)  
- [Character Renderer Components](xref:character-renderer-components)  