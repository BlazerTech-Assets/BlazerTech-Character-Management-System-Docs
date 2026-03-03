---
uid: layered-character-type
summary: Deep dive into Layered Characters and how to setup a Layered Character Type plus layers.
---

# Layered Character Type
A layered character is made from multiple layers, these layers are stacked upon each other to form the final character.  
Ex: **Body > Outfit > Hairstyle > Accessory** - Each layer is added one by one in order.

---

## Creating a Layered Character Type
to create a new layered character type right click the **Project** window and navigate to **Create > BlazerTech > Character Management System > Layered Character Type**.

---

### Setting up a Layered Character Type
The following properties must be set:

| Property                                                                 | Type                      | Description                       |
| ------------------------------------------------------------------------ | ------------------------- | --------------------------------- |
| **[CharacterTypeID](xref:character-type-core#character-type-id)**        | String                    | A **unique** identifer            |
| **[BaseSpritesheet](xref:character-type-core#base-spritesheet)**         | Sprite                    | The default character spritesheet |
| **[CharacterController](xref:character-type-core#character-controller)** | RuntimeAnimatorController | The Animator Controller used      |

---

### Setting up Character Layers

At the bottom of your **Layered Character Type** is a list of **Character Layers**. Each layer is a **Scriptable Object** that contains all available options for that layer of your character.

Refer to [Character Layers](character-layers.md) for how to create and setup character layers.