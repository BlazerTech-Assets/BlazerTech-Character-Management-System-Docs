---
uid: character-usage
summary: Included components for rendering and animating characters.
---

# Character Usage

The **BlazerTech Character Management System** includes the runtime components needed to **load**, **render**, **animate** and **control** characters.

| Component Type                                                       | Purpose                                                                                                |
| -------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| [Character Renderer components](#character-renderer-components)      | Load and render characters.                                                                            |
| [Character Animator Handler component](#character-animator-handlers) | Control specific **paramters** set in an **Animator Controller** used to properly animate a character. |
| [Character Movement components](#character-controllers)              | Handle player input and movement logic.                                                                |

---

## The Character Shader

A shader is used to visually display a character over the **Base Spritesheet**.  
Sprites from the **Base Spritesheet** whic is assigned in a **Character Type asset** are rendered in a component such as a **Sprite Renderer** or used in an **Animator Controller**.

If a **Unified Character** is used, the shader takes the single spritesheet of the character and shows that over the **Base Spritesheet**.  
If a **Layered Character** is used, the shader combines all layers into the final rendered character.  

This approach means only the **Base Spritesheet** needs to be sliced, all other spritesheets should have a `Sprite Mode` of `Single`.

> [!NOTE]
> If a **Character Renderer** component is used the shader will be applied automatically.

---

## Character Renderer Components

Character Renderer components will load and display any character regardless of the type

### Components

| Renderer Component                                                          | Used For                                                                 |
| --------------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| [Layered Character Group Renderer](#layered-character-group-renderer)       | Load a saved **Layered Character** from a group.                         |
| [Layered Character Template Renderer](#layered-character-template-renderer) | Create and render a **Layered Character** from a template.               |
| [Unified Character Template Renderer](#unified-character-template-renderer) | Create and render a **Unified Character** from a template.               |
| [Random Layered Character Renderer](#random-layered-character-renderer)     | Create a new **Layered Character** with completely random layer options. |

## Character Animator Handlers

**Animator Handler components** control parameters set within an Animator Controller.

All **Animator Handler components** require a reference to an **Animator component**.

> [!TIP]
> An **Animator Controller** can be assigned to any **Character Type** and be automatically used when a character of that type is used.

---

## Character Controllers

**Character Controllers** are included components which let the player control the movement of a game object.

When used with a **Character Animator Hander** you can both control and aniamte any character with ease.

---

### Top Down Movement Controller

- **Component**: [TopDownMovementController](xref:BlazerTech.CharacterManagement.Components.TopDownMovementController). 

The **Top Down Movement Controller** handles player movement for top-down 2d games where there are 4 directions the player can move (Left, right, up, down).  

#### Input Configuration

This component uses Unitys **New Input System**. Every input action is configurable.

[Input Actions](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.15/manual/Actions.html) are used to easily modify what inputs are used for each action.

##### Input Actions

| Input Action      | Type      | Usage                                                                    |
| ----------------- | --------- | ------------------------------------------------------------------------ |
| **Move Action**   | `Vector2` | The input action used to control player movement along the X and Y axes. |
| **Sprint Action** | `Button`  | The input action used to let the player sprint. (If enabled)             |
| **Crouch Action** | `Button`  | The input action used to let the player crouch. (If enabled)             |

A default **Input Action asset** is included under the `/Input Actions` subfolder.  
This asset contains the default input actions for moving, sprinting and crouching.  

##### Auto Enable Actions

If **Auto Enable Actions** is checked, the component automatically enables and disables the assigned input actions when the GameObject is enabled or disabled.  
This is useful when not using a **PlayerInput** component or a [project‑wide input actions asset](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.15/manual/ProjectWideActions.html) that handles enabling automatically.

#### Movement Settings

| Field          | Type    | Description                                                                                      |
| -------------- | ------- | ------------------------------------------------------------------------------------------------ |
| **Move Speed** | `Float` | Base walk speed (Default: `6.5`).                                                                |
| **Can Move**   | `Bool`  | Toggles whether the character can currently move. Can be changed via script or in the inspector. |


#### Sprinting & Crouching

Optional sprinting and crouching systems can be toggled on via their corresponding booleans.
Each system has customizable speed and button mode options.

| Field     | Type    | Description                                                              |
| --------- | ------- | ------------------------------------------------------------------------ |
| **Speed** | `Float` | Movement speed while sprint or crouching.                                |
| **Mode**  | `Enum`  | Determines whether the button must be held or toggled. (Default: `Hold`) |

#### References

| Reference       | Type          | Description                                    |
| --------------- | ------------- | ---------------------------------------------- |
| **Rigidbody2D** | `Rigidbody2D` | Required reference used for applying movement. |

#### Runtime Properties

| Property        | Type      | Description                                |
| --------------- | --------- | ------------------------------------------ |
| **IsMoving**    | `bool`    | True if the player is currently moving.    |
| **IsSprinting** | `bool`    | True if the player is currently sprinting. |
| **IsCrouching** | `bool`    | True if the player is currently crouching. |
| **Movement**    | `Vector2` | Current normalized movement direction.     |

> [!TIP]
> Designed to be used along with a [Character Animator Handler](#character-animator-handlers) component. When used together they provide both character movement and animation functionality.

---

## Character Display Name Renderer

The **Character Display Name Renderer** component provides an easy way to render the `Display Name` of a character on screen.

### Config

Setup how you'll get a reference to a character. There are two options.

1. **From Character Renderer**
   - Assign a reference to a [Character Renderer component](#character-renderer-components) and get the character from there.
2. **From Character Group**
   - Find a character from a group. Assign the **Character Type** you want to use and the group you want to load from.
   - Read more about character groups [here](xref:character-grouping-system).

### References

| Field                   | Type         | Description                                                                 |
| ----------------------- | ------------ | --------------------------------------------------------------------------- |
| **Display Name Parent** | `GameObject` | Parent GameObject used to disable text when `Display Name` is blank.        |
| **Display Name Text**   | `TMP_Text`   | Reference to a `TMP Text` component used to render the `Display Name` text. |

> [!NOTE]
> Use a canvas with a `Render Mode` set to `World Space`. This lets you display UI elements within the world. In this case it'll sit on top of our character and follow along with it.