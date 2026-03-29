---
uid: quick-start
summary: Quick start guide to get you started using the BlazerTech Character Management System.
---

# Quick Start Guide

![Logo](~/images/logos/blazertech-character-management-system-cover-iamge.png)

Welcome to the **BlazerTech Character Management System**!  
This guide will get you on your feet and teach you the basics of setting up the core for all your characters along with creating and rendering your first character.

This guide will cover the setup process for both **Unified** and **Layered Characters**.

> [!TIP]
> It's recommended to read through the [Basic Concepts](xref:basic-concepts) before reading the **Quick Start Guide**.

---

## Video Guides

Prefer video guides? I've got you covered!
<iframe 
  width="720" 
  height="405" 
  src="https://www.youtube.com/embed/JMOD0XNIkFA" 
  title="YouTube video player" 
  frameborder="0" 
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
  allowfullscreen>
</iframe>  

**Covers:**
- Layered Character Type Setup.
- Layered Character Template Setup.
- Rendering a layered character from a template.

<iframe 
  width="720" 
  height="405" 
  src="https://www.youtube.com/embed/GT25zq6KCCE" 
  title="YouTube video player" 
  frameborder="0" 
  allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" 
  allowfullscreen>
</iframe>

**Covers:**
- Unified Character Type Setup.
- Unified Character Template Setup.
- Rendering a unified character from a template.

> [!NOTE]
> These videos will become dated fast as I continue to improve the **Character Managemnt System**.  
> Finalized versions of these videos will be created close to the full release.

## 1️⃣Create a Character Type

If you only plan to use the built-in characters you can skip straight to [Creating a Character Template](#2create-a-character-template).

Create a Character Type asset:  


**Right click** the **Project window** and navigate to  
`Create > BlazerTech > Character Management System`  
and select either **Layered Character Type** or **Unified Character Type**.

You can name this asset whatever you'd like.

> [!TIP]
> Unsure which **Character Type** to create? Read more about the difference between them [here](xref:character-types#character-type-variants)


### Character Type Core Fields

The following fields are required regardless of the Character Type you choose.

#### **Character Type ID**  
A **unique** identifier for this Character Type.
Must **not** be the same any other Character Types.

#### **Base Spritesheet**  
The core spritesheet that defines all animations & individual frames that characters of this type will include.  
All characters will need to have a spritesheet that is the exact same size as the **Base Spritesheet**.  

The Base Spritesheet will represent all characters of the same type. It's Recommended to make this spritesheet include your most barebones character.

Set **Sprite Mode** of the spritesheet to **Multiple** (to slice frames individually).  

- [Read More → Base Spritesheet](xref:character-type-core#base-spritesheet)  

#### **Character Controller** (Optional)  
You can optionally assign an **Animator Controller** for characters of this type.  
Animations should only use sprites from the **Base Spritesheet** otherwise they won't be renderered correctly with the [Character Shader](xref:character-usage#the-character-shader).  

If you’re using your own movement or animator handling scripts, you can configure the **Animator Controller** however best fits your system.
However the **Character Management System** also includes built-in movement and animator handler scripts Which require the **Animator Controller** be setup with specific parameters
- [Read More → Character Animation Setup](xref:character-animation-setup)  

Later in this guide when you learn how to render your character, you’ll see how the **Character Controller** can be automatically applied when the character is used.

- [Read More → Character Shader](xref:character-usage#the-character-shader)  
- [Read More → Character Controller](xref:character-type-core#character-controller)  

> [!IMPORTANT]
> **No further setup is required for Unified Character Types.**

### Layered Character Type Setup

Layered Characters are composed of multiple layers (eg: Body, Outfit, Hairstyle, Accessory), we need to define what those layers are.  
Each layer must be defined as it's own Character Layer Definition Asset.  

To create a new layer:  

**Right click** the **Project window** and navigate to  
`Create > BlazerTech > Character Management System > Layered Character Type > Character Layer`.  

Each **Character Layer Definition** represents a single visual layer and contains a list of possible spritesheets (Called **Layer Options**)

- Read [Character Layers](xref:character-layers) to learn how to properly setup each layer and add Layer Options.


## 2️⃣Create a Character Template  

Once your Character Type is setup, it's time to create a character.  
There are many ways to create a character but for this guide we'll be using the simplest one, a **Character Template**.  

You can think of a **Character Template** as a blueprint that lets you create a character from it later during runtime.

**Right click** the **Project window** and navigate to  
`Create > BlazerTech > Character Management System > Character Templates`  
and select either **Layered Character Template** or **Unified Character Template**.

---

### Unified Character Template Setup

A **Unified Character Template** requires:
1. A reference to it's **Unified Character Type**.
2. A **name** for the character when it gets created.
3. A reference to the **spritesheet** of the character.

#### Spritesheet Requirements:
- Must be the exact same size as the **Base Spritesheet** assigned in the **Character Type** and contain the same animations.
- **Sprite Mode:** `Single` — We won't be using the spritesheet directly. it'll be passed to the **Character Shader**.
- **Filter Mode:** `Point (No Filter)`.
- (Optionally) **Compression:** `None` (Generally not needed for pixel art).

That's it! Now go to [Character Usage](#3character-usage) to see it in action.

- [Read Also → Unified Character Templates](xref:character-templates#unified-character-template)  

---

### Layered Character Template Setup
A **Layered Character Template** requires a reference to the **Layered Character Type**. As well as a name for the character when it gets created.

Once the **Character Type** has been assigned, a list of **layers** will appear. These are the same layers you setup in the **Layered Character Type**.  

Each entry lets you select a Layer Option through a dropdown.  
Additionally the search bar can be used to narrow down the list.  

![Layered Character Template Layers List](~/images/character-templates/layered-character-template-layers-list.png)

> [!TIP]
> If the layers list ever appears incorrect or invalid, click **Recreate List** at the bottom to refresh the list.  
> (Note: This will **reset** any selected options)

- [Read Also → Layered Character Templates](xref:character-templates#layered-character-template)  

---

## 3️⃣Character Usage
The easiest way to use a character is with a **Character Renderer** component.

If you're using a **Unified Character Type** add the **Unified Character Template Renderer** component.  
If you're using a **Layered Character Type** add the **Layered Character Template Renderer** component.

### Character Renderer Fields
The following fields are required for all **Character Renderers**.

#### **References**
| Field                       | Description                                                                      |
| --------------------------- | -------------------------------------------------------------------------------- |
| **Renderer**                | Typically a `Sprite Renderer`. The **Character Shader** will be applied to this. |
| **Set Animator Controller** | Toggles whether to use the **Character Controller** from the Character Type.     |
| **Animator**                | The `Animator` component to assign the controller to.                            |

#### **Loading Settings**
| Field                       | Description                                                                                                                             |
| --------------------------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| **Loading Mode**            | `Asynchronous`: loads in the background without freezing gameplay.<br>`Synchronous`: loads immediately but may briefly freeze the game. |
| **Load Character On Start** | Automatically loads the character in `Start()`. If disabled, `GetAndShowCharacter()` must be called manually.                           |

#### **Template Reference**
At the bottom of the component, assign your **Character Template** (Unified or Layered).  
This defines which character is created at runtime.

## 4️⃣Test Your Character
Now enter **Play Mode**.  
If `Load Character On Start` is enabled then you'll see your character in-gama.  

**Congrats!**  
You now have your first working character! Creating more is as easy as creating and setting up a new **Character Template**.

**Happy game making!**