---
uid: unified-character-type
summary: Deep dive into Unified Characters and how to setup them up.
---

# Unified Character Type
A **Unified Character** is made of one single premade spritesheet which contains every animation of the character.

## Creating a Unified Character Type
to create a new **Unified character type** right click the **Project** window and navigate to **Create > BlazerTech > Character Management System > Unified Character Type**.

---

### Setting up a Unified Character Type
The following properties must be set:

| Property                | Type                      | Description
|-----------------------------------------------------------------------------|---------------------------|---------------------------
| **[CharacterTypeID](xref:character-type-core#character-type-id)**         | String                    | A **unique** identifer
| **[BaseSpritesheet](xref:character-type-core#base-spritesheet)**         | Sprite                    | The default character spritesheet
| **[CharacterController](xref:character-type-core#character-controller)** | RuntimeAnimatorController | The Animator Controller used

That's it! Once your **Unified Character Type** is all setup you can create a **Unified Character Template** to make characters from this **Character Type**.

[🔗 Read More → Unified Character Templates](character-templates.md#unified-character-template)