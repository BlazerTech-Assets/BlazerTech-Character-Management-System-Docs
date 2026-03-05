---
uid: character-types
summary: Learn the difference between Unified and Layered Characters and which one works best for your project.
---

# Character Types

The **Character Management System** supports two different character structures: **Unified Characters** and **Layered Characters**.  

Once setup, both can be used the same way but differ in how the character is rendered and how it can be customized.

Read below to choose the correct type for your project.

---

## Choosing a Character Type

| Feature               | Unified Character               | Layered Character                       |
| --------------------- | ------------------------------- | --------------------------------------- |
| Spritesheets          | One complete spritesheet        | Multiple layered spritesheets           |
| Runtime Customization | ❌ No                            | ✅ Yes                                   |
| Setup Complexity      | Simple                          | Moderate                                |
| Best For              | Fixed characters or simple NPCs | Customizable characters or dynamic NPCs |

---

## Unified Characters

A **Unified Character** uses a single spritesheet that contains the fully assembled character.

![Unified Character Types Showcase](~/images/character-types/unified-characters/unified-character-type-showcase.png)

### Best Used For
- Characters with fixed appearances
- Story characters that never change
- Projects that do not need character customization

Unified Characters are the **simplest to create and manage**, but they do **not support any runtime customzation** since the character is fully assembled beforehand.

[Read More → Unified Character Type](xref:unified-character-type)  

---

## Layered Characters

A **Layered Character** is split into multiple spritesheets. Each spritesheet is a layer of the character.

![Layered Character Types Showcase](~/images/character-types/layered-characters/layered-character-type-showcase.png)

At runtime the system stacks each layer together to create the final character.

For example a character may contain the layers:
- **Body**
- **Outfit**
- **Hairstyle**
- **Accessory**

When the character is rendered:

1. The body renders first
2. The outfit renders on top of that
3. the hairstyle renders above that
4. accessory layer renders last

The **layer order can be configured inside the editor**.

### Requirements
All layer spritesheets must:
- Be the **exact same size**
- Use the **same layout**
- Align to the **same animation frames**

### Best Used For
- Customizable player characters
- Randomly generated NPCs

[Read More → Layered Character Type](xref:layered-character-type)  

---

## The Character Type Asset
Character types are the heart of the **Character Management System**, they are implemented using [Scriptable Objects](https://docs.unity3d.com/6000.0/Documentation/Manual/class-ScriptableObject.html).

![Character Type Assets](~/images/character-types/character-type-assets.png)

A Character Type asset stores the core configuration used by all characters of that type.

**This includes**:
- Base Spritesheet all characters use
- Animator Controller
- Layer Definitions (For Layered Character Types)


> [!NOTE]
> A **Character Type asset** must exist before characters can be created.

---

### Create a Character Type

A new Character Type asset can be created by **right clicking the Project window** and navigating to  
`Create > BlazerTech > Character Management System > (Choose Character Type)`

You will then choose which character type to create:
- **Unified Character Type**
- **Layered Character Type**
  
A **Character Type can only create characters of the same type**.

![Create Character Type](~/images/character-types/create-character-type.png)

> [!NOTE]
> You will need a new **Character Type** for each set of characters that have a different spritesheet layout (EG: different animations, number of frames, etc.)

---

## Active Character Types List

The **Active Character Types list** determines which Character Types are initialized when the game starts.

It can be found under: **Project Settings > BlazerTech > Character Management System**.

![Active Character Type List](~/images/project-settings/active-character-types-list.png)

Only Character Types in this list will be useable at runtime.

When creating a new **Character Type asset** you will be promped to add it to the **Active Character Types list** automatically.

![Add Character Type to List](~/images/project-settings/add-character-type-to-list.png)

---

## Character Type Setup

This section explains how to configure the fields inside the **Character Type asset**.  
Setup specific to only **Layered** or **Unified Character Types** will be found in their own pages.

---


---

### Character Type ID

A **unique identifier** for the Character Type

![Character Type ID Field](~/images/character-types/fields/character-type-id.png)

This ID **must be unique** among all Character Types listed in the **Active Character Types list**.

If two Character Types share the same ID, initialization will fail at runtime.

---

### Base Spritesheet

The spritesheet all characters of the same type will use.

![Base Spritesheet Field](~/images/character-types/fields/base-spritesheet.png)

The **Base Spritesheet** contains all animation frames that characters of this type will use.  
This spritesheet acts as a **template for frame positions, sizes and animations**.

All characters using the same **Character Type** must follow this layout.

#### Why All Characters Use the Same Base Spritesheet

The [Character Shader](xref:basic-concepts#the-character-shader) uses the animation frames from the **Base Spritesheet** to determine **which frame should be displayed**.

instead of changing the animation itself, the shader replaces the visual sprites with the character's own spritesheet.

This allows:
- One **Animator Controller** to animate every character
- New characters to be added without creating new animations

#### Base Spritesheet Settings

The **Base Spritesheet** must use the correct import settings to work properly.  

| Setting         | Value              | Reason                                          |
| --------------- | ------------------ | ----------------------------------------------- |
| **Sprite**      | Multiple           | Allows the spritesheet to be sliced into frames |
| **Compression** | None (Recommended) | Prevents artifacts in pixel art                 |
| **Filter Mode** | Point (No Filter)  | Keeps pixel art sharp                           |

#### Spritesheet Layout Requirements

All character spritesheets for this Character Type must:
- Use the **same frame sizes**
- Use the **same frame positions**
- Contain the **same animation frames**

This guarantees that animations line up correctly across all characters.

##### Example
If the **Base Spritesheet** contains the following animations:
- Idle (4 frames)
- Walk (6 frames)
- Run (6 frames)

Then **every character spritesheet must also contain those same frames in the same positions**.

---

### Animator Controller (Optional)

All character share the same spritesheet layout, meaning **one Animator Controller can animate every character of a single type**.

![Animator Controller Field](~/images/character-types/fields/animator-controller.png)

This removes the need to create separate **Animator Controllers** or **Animator Override Controllers** for each character.

See [Character Animation Setup](xref:character-animation-setup) for instructions on configuring your **Animator Controller**.

---

### Pixels Per Unit

The **render scale** of the character.

![Pixels Per Unit Field](~/images/character-types/fields/pixels-per-unit.png)

This value should match the **Pixels Per Unit** setting used in the **Base Spritesheet**.

---

## Related
- [Layered Character Type](xref:layered-character-type)
- [Unified Character Type](xref:unified-character-type)
- [Character Templates](xref:character-templates)
- [Character Renderer Components](xref:character-renderer-components)