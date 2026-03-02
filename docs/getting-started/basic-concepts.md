---
uid: basic-concepts
summary: Overview of all main features for the BlazerTech Character Management System.
---

# Basic Concepts

This page introduces the **main features** of the **Character Management System**:  
- [**Character Types**](#character-types) – Defines the core of every character.  
- [**Character Templates**](#character-templates) – Blueprints for creating characters later.  
- [**Character Usage**](#character-usage) – Scripts to load and render characters.  
- [**Built-in Modular Characters**](#built-in-characters) - Modular characters pre-setup and ready for use.
- [**Character Grouping System**](#character-grouping-system) - Groups used to save and manage characters.
- [**Character Creator**](#character-creator) – Modular UI framework for building customizable characters in-game.  

---

## Character Types

<img src="~/images/character-types/character-types.png" alt="Character Types" width="500" />  

 A **Character Type** is a [Scriptable Object](https://docs.unity3d.com/6000.0/Documentation/Manual/class-ScriptableObject.html) that defines how  
 a character works. There are two kinds:  

| Type                       | Description                                                                            | Best For                                                    |
| -------------------------- | -------------------------------------------------------------------------------------- | ----------------------------------------------------------- |
| **Unified Character Type** | A single spritesheet containing a fully assembled character. No runtime customization. | Characters with fixed, pre-set appearances.                 |
| **Layered Character Type** | Multiple spritesheets, each containing one visual layer (body, outfit, hair, etc.).    | Customizable player characters, dynamic or randomized NPCs. |

Every **Character Type** contains a **Base Spritesheet**. This spritesheet contains all animations every character of that type will need to contain.  
New characters can then be easily added by simply adding a new spritesheet or multiple spritesheets if using layered characters.

Optionally an **Animator Controller** can be setup with all animations using sprites from the **Base Spritesheet**. With this setup only a single **Animator Controller** is required. No need to create a new **Animator Controller** or **Override Controller** for each new character.


- [Read More → Character Types](xref:character-types)  
- [Read More → Unified Character Type](xref:unified-character-type)  
- [Read More → Layered Character Type](xref:layered-character-type)  

---

## Character Templates
A **Character Template** is a [Scriptable Object](https://docs.unity3d.com/6000.0/Documentation/Manual/class-ScriptableObject.html) that acts as a **blueprint** for creating characters later. Templates are supported for both **Unified** and **Layered Characters**.

[Read More → Character Templates](xref:character-templates)  

---

## Character Usage

### Character Renderer Components
Once a **Unified or Layered Character** has been created, it can be used through one the following scripts:

| Renderer Component                                                                                  | Purpose                                                      |
| ----------------------------------------------------------------------------------------------- | ------------------------------------------------------------ |
| [Layered Character Group Renderer](xref:character-usage#layered-character-group-renderer)       | Load and render pre-existing Layered Character from a group. |
| [Layered Character Template Renderer](xref:character-usage#layered-character-template-renderer) | Create/load and render a Layered Character from a template.  |
| [Unified Character Template Renderer](xref:character-usage#unified-character-template-renderer) | Create/load and render a Unified Character from a template.  |

### Character Shader
Shaders are how the final Unified or Layered Character are rendered. Sprites from the **Base Spritesheet** defined in the **Character Type** are used in a renderer component such as a **Sprite Renderer**.

If a **Unified Character** is used, the shader takes the single spritesheet of the character and shows that over the **Base Spritesheet**.  
If a **Layered Character** is used, the shader combines all layers into the final rendered character.  

[Read More → Character Usage](xref:character-usage)  

---

## Built-in Characters
Modular characters are included within the **BlazerTech Character Management System**.
They can be freely used inside any project. These characters will also be purchasable separately upon the full release of the Character Management System

The **BlazerTech Modular Characters** consist of 4 layers:
1. **Body**
2. **Outfit**
3. **Hairstyle**
4. **Accessory**

A **Layered Character Type** for these characters are already included and fully setup. New characters can be created by using a [Layered Character Tempate](xref:character-templates#layered-character-template), amongst other ways not listed here.

Additionally a [Unified Character Type](xref:unified-character-type) is setup with a set of pre-made characters made by combining various layer options.

[Read More → Built-In Characters](xref:built-in-characters)  

---

## Character Grouping System

Charcter groups are used to sort characters. They're great for organizing characters into meaningful collections, whether that's for a dynamic roster or a fixed group size.

[Read More → Character Grouping System](xref:character-grouping-system)  

Two types of groups exist.  

### Flexible Group Type
A dynamic list that characters can be added to, removed from, or edited at anytime.

Example Uses:
- A roster of playable characters the player can create, edit, and delete.  
- A collection of background NPCs that will later be randomly selected from.  

[Read More → Flexible Group Type](xref:character-grouping-system#flexible-group-type)  
### Fixed Group Type
An immutable list of characters. When the list is created all characters are created immedietely. Characters can then be edited but not removed and new characters cannot be added.

Example Uses:
- A predined set of characters the player can choose to play as.  
- A set of main characters the player can customize.  

[Read More → Fixed Group Type](xref:character-grouping-system#fixed-group-type)  

---

## Character Creator
The **Character Creator** is a prefab based **Character Creation Menu Framework**.  
Prefabs can be combined and customized to create whatever design you want.  
It makes the process of building a **Character Creation Menu** into your game easy.  

> [!TIP]  
> The **Character Creator** only works with **Layered Characters**. **Unified Characters do not support runtime customization.**

### Example Use Cases
1. **Customizable Player Character** – Easily setup the menu for a single character such as the player character. 
2. **Editing Character Lists** – Allow players to edit a predefined roster, or manage a dynamic list (create, edit, delete).  

### Key Features
| Feature               | Description                                                         |
| --------------------- | ------------------------------------------------------------------- |
| **Layer Selectors**   | Dropdowns, carousels, tabs, etc.                                    |
| **Character Preview** | Static or animated, with options to rotate or swap animations.      |
| **History Tracking**  | Every change is logged and can be shown as text or image snapshots. |
| **Randomization**     | Randomize the entire character or specific layers.                  |
| **Loading Screens**   | Customizable loading screens which hide the menu until it's ready.  |
| **Character Naming**  | Optional name field.                                                |

[Read More → Character Creator](xref:character-creator-overview)