---
uid: unified-character-type
summary: Deep dive into Unified Characters and how to set up a Unified Character Type.
---

# Unified Character Type

A **Unified Character Type** defines how a **Unified Character** is structured.

It contains the core data shared across all characters of that type, such as the **Base Spritesheet** and **Animator Controller**.

A **Unified Character** uses a **single spritesheet** that contains the complete character and all its animations.

![Unified Character Type Asset](~/images/character-types/unified-characters/unified-character-type-asset.png)

---

## Unified Characters

A Unified Character has all animations and frames contained in a single spritesheet.

This means unlike **Layered Characters**, the character is not built from multiple layers, instead, each character is self contained in it's own spritesheet.

For example, if your game contains a set of characters, each character variation would have its own spritesheet.
Example list:
- Knight
- Knight (Armored)
- Knight (Winter Outfit)

Each character spritesheet must follow the same frame layout so that all animation align correctly.

All Unified Character Spritesheets must share:
- The same Spritesheet size
- The same frame sizes
- The same frame positioning

---

## Create a Unified Character Type Asset

To create a new Unified Character Type:
1. `Right click` the **Project window**
2. Navigate to: **Create > BlazerTech > Character Management System > Unified Character Type**

![Create Unified Character Type Asset](~/images/character-types/unified-characters/create-unified-character-type.png)

---

## Character Type Setup

A **Unified Character Type** uses the same core properties shared by all **Character Types**.

| Property                                                                     | Type                      | Description                                          |
| ---------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------- |
| **[Characte Type ID](xref:character-types#character-type-id)**               | String                    | A **unique** identifer                               |
| **[Base Spritesheet](xref:character-types#base-spritesheet)**                | Sprite                    | The **character spritesheet** used by all characters |
| **[Animator Controller](xref:character-types#animator-controller-optional)** | RuntimeAnimatorController | Single **Animator Controller** for all characters    |
| **[Pixels Per Unit](xref:character-types#pixels-per-unit)**                  | int                       | PPU of your Base Spritesheet                         |

Read [Character Type Setup](xref:character-types#character-type-setup) for a step-by-setup guide on how to setup each field.

---

## Creating Unified Characters

The only way to create Unified Characters is through a **Unified Character Template**.

![Unified Character Template](~/images/character-templates/unified-character-templates/unified-character-template.png)

Inside the template you'll assign the **character spritesheet** you want to use.

[Read More → Unified Character Templates](xref:unified-character-templates)  

---

## Related
- [Character Types](xref:character-types)