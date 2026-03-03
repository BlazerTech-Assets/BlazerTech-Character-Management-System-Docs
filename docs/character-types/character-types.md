---
uid: character-types
summary: Unified vs Layered Character Types and which one works best for your project.
---

# Character Types

The **Character Management System** contains two types of characters, both meant for different use cases.

Check out the difference between them below:

## Unified Characters

A Unified Character contains one single spritesheet that contains all frames of the character.

![Unified Character Types Showcase](~/images/character-types/unified-character-type-showcase.png)

These are the simplest characters to setup and use but lack runtime customization since the character is pre-created beforehand.


---

## Layered Characters

A Layered Character is split into multiple spritesheets. Each spritesheet is a layer of the character. At runtime each spritesheet is layered on top of each other to create the finalized character.  
Every spritesheet must be the exact same size and contain the same frame sizes and position to work properly.

![Layered Character Types Showcase](~/images/character-types/layered-character-type-showcase.png)

Here's an example, we've got a character with four layers: **Body, Outfit, Hairstyle and Accessory**.

When the character is rendered, the body is rendered first, then the outfit on top of that, then the hairstyle and finally the accessory.  
The order the spritesheets are layered can be changed in the editor.


---

## The Character Type Asset

Character types are [Scriptable Objects](https://docs.unity3d.com/6000.0/Documentation/Manual/class-ScriptableObject.html) that define core aspects of a character. They are the heart of the **Character Management System**.

![Character Type Assets](~/images/character-types/character-type-assets.png)

> [!NOTE]
> All characters **Require** a **Character Type**.

---

### How to Create a Character Type

Character Types can be created by `right clicking` the `Project window` and navigating to:  
`Create > BlazerTech > Character Management System > (Choose Character Type)`

When creating a **Character Type** you'll need to choose whether it'll be a **Layered** or **Unified Character Type**.  
**Character Types** can only create characters of one type.

![Create Character Type](~/images/character-types/create-character-type.png)

<!-- ---

### Overview

| Field                                                                    | Type                      | Description                                           |
| ------------------------------------------------------------------------ | ------------------------- | ----------------------------------------------------- |
| **[CharacterTypeID](xref:character-type-core#character-type-id)**        | String                    | A **unique** identifer for every Character Type asset |
| **[BaseSpritesheet](xref:character-type-core#base-spritesheet)**         | Sprite                    | The default character spritesheet for all characters  |
| **[CharacterController](xref:character-type-core#character-controller)** | RuntimeAnimatorController | The Animator Controller used for all characters       |
| **[Pixels per Unit](xref:character-type-core#character-controller)**     | Int                       | The PPU of your Base Spritesheet                      | -->

---

## Character Type Setup

### Active Character Types List

A list of all **Character Type assets** which will be initialized at runtime.  
This list can be found under **Proejct Settings > BlazerTech > Character Management System**

![Active Character Type List](~/images/project-settings/active-character-types-list.png)

When a new Character Type asset is created you'll be promped to add it to the Active Character Types list before continuing.

![Add Character Type to List](~/images/project-settings/add-character-type-to-list.png)

### Character Type ID

This is a **unique identifier** for the Character Type asset. It **cannot** be the same as any other identifier in the **Active Character Types** list or the **Character Type asset** will fail to initialize at runtime.

![Character Type ID Field](~/images/character-types/fields/character-type-id.png)

### Base Spritesheet

Defines the layout that all other spritesheet must follow.

This spritesheet should be sliced into frames, these are the frames that are used for every character using the same **Character Type asset**.

![Base Spritesheet Field](~/images/character-types/fields/base-spritesheet.png)

### Animator Controller (Optional)

All characters use frames from the **Base Spritesheet**, this means a single **Animator Controller** can be used to animate all characters of the same **Character Type asset**. No need to create a new **Animator/Override Controller** for every character.

Check out [Character Animation Setup](xref:character-animation-setup) for more info about how to correctly configure your **Animator Controller**.

![Animator Controller Field](~/images/character-types/fields/animator-controller.png)

### Pixels Per Unit

Should be the same PPU set in the **Base Spritesheet**.

![Pixels Per Unit Field](~/images/character-types/fields/pixels-per-unit.png)








---

## Character Type Variants

| Variant     | Modularity           | Best For                      |
| ----------- | -------------------- | ----------------------------- |
| **Unified** | Single spritesheet   | Pre-created, fixed characters |
| **Layered** | Layered spritesheets | Modular, editable characters  |

---

### 1. Unified Character Type
characters use a single spritesheet containing the fully assembled character. No runtime customization is possible.  
- **Use Case:** Characters with fixed, pre-created appearances.  
- **Example:** Simplistic characters where their appearance is pre-determined and won't need to be changed.

[Read More → Unified Character Type](unified-character-type.md)

---

### 2. Layered Character Type
Characters consist of a set of spritesheets, each containing one visual layer of the character.  
- **Use Case:** Customizable player characters or dynamically generated NPCs.  
- **Example:** Body, Outfit, Hairstyle, Accessory.  

[Read More → Layered Character Type](layered-character-type.md)