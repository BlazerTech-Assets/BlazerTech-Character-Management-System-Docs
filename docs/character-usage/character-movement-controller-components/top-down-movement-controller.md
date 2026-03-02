---
uid: top-down-character-movement-controller-component
summary: character controller for 2d four-directional movement.
---

# Top Down Character Movement Controller

Handles player movement for 2d top-down games where there are four directions the player can move (Left, right, up, down).

## Input Configuration

This component uses Unitys **New Input System**. Every input action is configurable.

[Input Actions](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.15/manual/Actions.html) are used to easily modify what inputs are used for each action.

### Input Actions

| Input Action      | Type      | Usage                                                                    |
| ----------------- | --------- | ------------------------------------------------------------------------ |
| **Move Action**   | `Vector2` | The input action used to control player movement along the X and Y axes. |
| **Sprint Action** | `Button`  | The input action used to let the player sprint. (If enabled)             |
| **Crouch Action** | `Button`  | The input action used to let the player crouch. (If enabled)             |

A default **Input Action asset** is included under the `/Input Actions` subfolder.  
This asset contains the default input actions for moving, sprinting and crouching.  

### Auto Enable Actions

If **Auto Enable Actions** is enabled, the component automatically enables and disables the assigned input actions when the GameObject is enabled or disabled.  
This is useful when not using a **PlayerInput** component or a [project‑wide input actions asset](https://docs.unity3d.com/Packages/com.unity.inputsystem@1.15/manual/ProjectWideActions.html) that handles enabling automatically.

## Movement Settings

| Field          | Type    | Description                                                                                      |
| -------------- | ------- | ------------------------------------------------------------------------------------------------ |
| **Move Speed** | `Float` | Base walk speed (Default: `6.5`).                                                                |
| **Can Move**   | `Bool`  | Toggles whether the character can currently move. Can be changed via script or in the inspector. |


## Sprinting & Crouching

Optional sprinting and crouching systems can be toggled on via their corresponding booleans.
Each system has customizable speed and button mode options.

| Field     | Type    | Description                                                              |
| --------- | ------- | ------------------------------------------------------------------------ |
| **Speed** | `Float` | Movement speed while sprint or crouching.                                |
| **Mode**  | `Enum`  | Determines whether the button must be held or toggled. (Default: `Hold`) |

## References

| Reference       | Type          | Description                                    |
| --------------- | ------------- | ---------------------------------------------- |
| **Rigidbody2D** | `Rigidbody2D` | Required reference used for applying movement. |

## Runtime Properties

| Property        | Type      | Description                                |
| --------------- | --------- | ------------------------------------------ |
| **IsMoving**    | `bool`    | True if the player is currently moving.    |
| **IsSprinting** | `bool`    | True if the player is currently sprinting. |
| **IsCrouching** | `bool`    | True if the player is currently crouching. |
| **Movement**    | `Vector2` | Current normalized movement direction.     |

> [!TIP]
> Designed to be used along with a [Character Animator Handler](#character-animator-handlers) component. When used together they provide both character movement and animation functionality.