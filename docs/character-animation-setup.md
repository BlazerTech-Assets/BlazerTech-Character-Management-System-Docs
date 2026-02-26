---
uid: character-animation-setup
summary: Step-by-step guide to setup an Animator Controller for use with a Character Type.
---

# Character Animation Setup

This page goes over how to **create and properly configure an Animator Controller** to be used by a [Character Type](xref:character-types) asset.

---

## Overview

Every Character Type can include an **Animator Controller**.  
This controller provides useable animations from the sprites contained within the **Base Spritesheet** in the **Character Type**

All characters using the same **Character Type** can use a single **Animator Controller**. No need to create a separate Animator/Override Controller for every new character.

The setup process is the same for both **Unified** and **Layered Character Types**.

> [!IMPORTANT]
> All animations **must only use sprites from the Base Spritesheet**.  
> If sprites from other sheets are used, they **will not render correctly** when used with the [Character Shader](xref:character-usage#the-character-shader).

If you already have your own movement and animator handling scripts, you can setup the **Animator Controller** 
however you need for you project. That means you can create your own parameters, animation states, blend trees, etc.

---

## Integration with Built-In Scripts
The **BlazerTech Character Management System** includes pre-built movement and animator handling scripts.
The included scripts contain support for the following movement animations:
- **Idle**
- **Walk**
- **Sprint**
- **Crouch-Idle**
- **Crouch-Moving**

Additional animations can be played at runtime using:
```csharp
PlayAnimation("AnimationName");
```
on any **Character Animator Handler** component.

## 1️⃣Create an Animator Controller
1. In the **Project window**, right-click and select  
   `Create > Animation > Animator Controller`.
2. **Name asset** (Recommended to name it after the Character Type it's used for)
3. Double-click to open it in the **Animator window**.

You should now see an empty Animator Controller.

---

## 2️⃣Add Parameters
The built-in **Character Animator Handler** components do **not** call animations directly.  
Instead, they modify **parameters** set in the **Animator Controller**, which control transitions between animation states.

The **Parameters** section is located in the top left of the **Animator window**.

![Character Animator Controller Create Parameter](~/images/character-animation/character-animator-create-parameter.png)

### Required Parameters

| Parameter Name          | Type  | Usage                                                              |
| ----------------------- | ----- | ------------------------------------------------------------------ |
| **Horiztonal Movement** | Float | Ranges from -1 to 1. Represents left/right movement on the X-axis. |
| **Vertical Movement**   | Float | Ranges from -1 to 1. Represents up/down movement on the Y-axis.    |
| **Is Moving**           | Bool  | True when the character is moving; otherwise false.                |

### Optional Parameters

Optional parameters will only be used if toggled in the movement and animator handler components.  

| Parameter Name   | Type | Usage                                                  |
| ---------------- | ---- | ------------------------------------------------------ |
| **Is Sprinting** | Bool | True when the character is sprinting; otherwise false. |
| **Is Crouching** | Bool | True when the character is crouching; otherwise false. |

> [!IMPORTANT]
> These parameter names must match **exactly** with what's set in the built-in Animator Handler components.

---

## 3️⃣Add Animation States
Because the built-in animator handler components only modify parameters, you can design your animation state layout freely.

A common approach is to use Blend Trees for animations that play in four directions (Up, Down, Left, Right).

In this example we'll be setting up an **Idle** and **Walk** blend tree.

### Create Animation Clips

**Right Click** the Project window and navigate to `Create > Animation > Animation Clip`.

We'll create 4 animation clips. 1 for each direction.

**Idle**
- Idle Down
- Idle Up
- Idle Left
- Idle Right

**Walk**
- Walk Down
- Walk up
- Walk Left
- Walk Right

You can leave these clips empty for now, we’ll add frames later.

---

### Create and Setup Blend Trees

Repeat these steps for each 4 directional animation set you want to setup.

1. **Right-click** Animator window > `Create State > From New Blend Tree`.
2. Name the blend tree after the animation name (eg: Idle, Walk).
3. Double click the blend tree to open it.
4. In the **Blend Tree**, set **Blend Type** to `2D Simple Directional`.
5. Assign **Blend Parameters** to:
   - X: `Horizontal Movement`
   - Y: `Vertical Movement`
6. Add motions for each direction (Up, Down, Left, Right).
7. Assign animations to each motion from the animation clips we created earlier.
8. Set X and Y position to correspond to all 4 directions for each animation.

#### Coordinate Cheat Sheet

| X Coordinate | Y Coordinate | Direction |
| ------------ | ------------ |
| **0**        | -1           | Down      |
| **0**        | 1            | Up        |
| **-1**       | 0            | Left      |
| **1**        | 0            | Right     |

![Character Animator Blend Tree Example](~/images/character-animation/character-animator-blend-tree.png)

---

## 4️⃣Setup State Transitions
Lets tell the **Animator Controller** how to transition between states.  
The entry state should be the **Idle blend tree**.  
`Right click` the Idle blend tree and select `Set As Layer Default State`.

Create a transition from **Idle** to **Walk**:
1. `Right click` on the **Idle Blend tree**.
2. Select `Make Transition`.
3. Hover over and click on the `Walk` blend tree.  

Now lets add a condition to the transition.
1. Right click the new transition line.
2. Add a new condition.
3. Assign the `Is Moving` parameter and the value to true.  
4. Disable `Has Exit Time` to avoid a delay when transitioning.

Now when the character starts moving they will automatically go from the **Idle** blend tree to the **Walk** blend tree

Now Make another transition from **Walk** to **Idle**.

Once again add a new condition, this time set `Is Moving` to false.  
This way when the character stops moving they'll go back to playing The idle animations.

---

## 5️⃣Setup Animation Clips

Now it's time to setup the **animation clips** we created earlier.

Add an `Animator` and `Sprite Renderer` component to any game object.
- Make sure the game object is selected.
- Go to the **Animation** Tab.
- Select the animation you want to edit.
- Bulk select all sprite frames.
- Drag and drop them into the **Animation timeline**.
- Set Samples. This is essentially the frame rate of your animation. (Recommended: 12)

Repeat for each animation clip.

---

## 6️⃣Add Additional Animations (Optional)
You can expand your Animator with as many custom animations as needed.

### Single-Direction Animations
For animation that only play in one direction:
- Create a new state.
- Assign the clip directly.
  
### Multi-Directional Animation
For Directional animations:
- Create another **blend tree** using the same setup as before.

When played, the blend tree automatically chooses the correct direction.

If an animation is not looped, add a transition back to Idle or the Exit node.

Animations can be triggered manually via:
```csharp
animator.Play("AnimationName");
```
or
```csharp
animatorHandler.PlayAnimation("AnimationName");
```
(using the included Animator Handler components).

---

## 7️⃣Assign to a Character Type
Once your Animator Controller is ready:

1. Select your **Character Type asset**.
2. In the **Inspector**, find the **Character Controller** field.
3. Drag your new **Animator Controller** into this field.

It should look like this.

![Animator Controller Field in Inspector](~/images/character-types/character-type-character-controller-field.png)

When used with a [Character Renderer component](xref:character-usage#character-renderer-components),  
the assigned Animator Controller will automatically be applied at runtime.