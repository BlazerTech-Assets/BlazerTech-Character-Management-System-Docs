---
uid: layered-character-type
summary: Deep dive into Layered Characters and how to setup a Layered Character Type plus layers.
---

# Layered Character Type

A Layered Character Type is an asset which holds core information needed for all your **Layered Characters** such as the **Base Character Spritesheet** and an **Animator Controller**.

![Layered Character Type Asset](~/images/character-types/layered-characters/layered-character-type-asset.png)

---

## Layered Characters

A **Layered Character** is made from **multiple layers**, each layer is its own **spritesheet**. Every spritesheet must be the same size and contain the same **frame sizes** and **positioning**.  

Each layer is stacked upon each other to create the final character.  
Ex: **Body > Outfit > Hairstyle > Accessory** - Each layer is added one by one in order.

![Layered Character Example](~/images/character-types/layered-characters/layered-character-example.png)

---
## Create Layered Character Type Asset

to create a new layered character type `right click` the `Project` window and navigate to  
`Create > BlazerTech > Character Management System > Layered Character Type`.

![Create Layered Character Type Asset](~/images/character-types/layered-characters/create-layered-character-type.png)

---

## Setup

Setup the core fields every Character Type has, below is an overview of those fields:  

| Property                                                                     | Type                      | Description                                          |
| ---------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------- |
| **[Characte Type ID](xref:character-types#character-type-id)**               | String                    | A **unique** identifer                               |
| **[Base Spritesheet](xref:character-types#base-spritesheet)**                | Sprite                    | The **character spritesheet** used by all characters |
| **[Animator Controller](xref:character-types#animator-controller-optional)** | RuntimeAnimatorController | Single **Animator Controller** for all characters    |
| **[Pixels Per Unit](xref:character-types#pixels-per-unit)**                  | int                       | PPU of your Base Spritesheet                         |

Read [Character Type Setup](xref:character-types#character-type-setup) for a step-by-setup guide on how to setup each field.

---

### Character Layers

At the bottom of the **Layered Character Type** is a list of **Character Layers**. Each entry is a Character Layer Definition asset which contains the following information regarding each layer:  
- **Layer Name**
- **If the layer can be blank**
- **Layer Options**

To create a Character Layer Definition `right click` the `Project window` and navigate to  
`Create > BlazerTech > Character Management System > Layerd Character Types > Layer Definition`

Create a **Layer Definition** for each layer you want your characters to have.

![Create Character Layer Definition Asset](~/images/character-types/layered-characters/character-layers/create-character-layer-definition.png)

Once created, add each **Layer Definition** to the **layers** list in the **Layered Character Type asset**.  
The order they appear in the list will determine the order the layers are combined.

![Layers List](~/images/character-types/layered-characters/layers-list.png)

Read [Character Layer Defintion Setup](character-layers.md) to learn how to setup each **Character Layer Definition**.

---

## Create a Layered Character

it is assumed you already have a **Layered Character Type** created and setup, including your **Character Layer Defintion** assets.

### Character Templates

A character template acts as a blueprint for a character

---

## Create a Layered Character in C#