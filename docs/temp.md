---
uid: temp
summary: Learn how Character Overlay Layers work and how they are used to extend characters with additional visuals and animations.
---

# Character Overlay Layers

**Character Overlay Layers** allow you to add additional visuals and animation layers on top of a character.  
They are typically used for equipment, effects, or other elements that need to animate independently from the base character.

Overlay Layers work alongside the character's **Animator Controller** and synchronize specific parameters so the overlay animations stay in sync with the base character.

---

## When To Use Overlay Layers

Overlay Layers are useful when you need to add additional animated elements to a character without modifying the base character sprites.

### Common Use Cases

| Use Case | Example |
|--------|--------|
| Equipment | Weapons, shields |
| Clothing | Jackets, armor |
| Effects | Auras, glow effects |
| Special states | Injuries, status effects |

---

## How Overlay Layers Work

A **Character Overlay Layer** contains its own:

- **Spritesheet**
- **Animator Controller**
- **Animation Clips**

The overlay animations are synchronized with the base character through **Animator Parameters**.

### Basic Workflow

1. The base character plays an animation.
2. The overlay layer listens for specific **Animator Parameters**.
3. The overlay animator updates its animation to match the character.

This ensures the overlay remains synchronized with the base character's animation state.

---

## Creating an Overlay Layer

Overlay Layers are defined using a **Scriptable Object**.

### Steps

1. Create a new **Character Overlay Layer** asset.
2. Assign the **Overlay Animator Controller**.
3. Configure the **Spritesheet** used by the overlay.
4. Define which **Animator Parameters** should be synchronized.

---

## Overlay Layer Properties

| Property | Type | Description |
|--------|------|-------------|
| **Overlay Layer ID** | String | Unique identifier for the overlay layer |
| **Animator Controller** | RuntimeAnimatorController | Controller used for the overlay animations |
| **Spritesheet** | Sprite | Base spritesheet used for the overlay |
| **Synced Parameters** | List | Animator parameters synchronized with the base character |

---

## Parameter Synchronization

Overlay layers stay synchronized with the base character by copying selected **Animator Parameters**.

Only parameters that exist in **both animator controllers** can be synchronized.

> [!NOTE]
> If a parameter exists in the overlay controller but not in the base controller, synchronization will not occur.

### Supported Parameter Types

- Bool
- Float
- Int
- Trigger

---

## Using Overlay Layers In Characters

Overlay Layers can be attached to characters at runtime.

### Example Use Cases

- Equipping a weapon
- Adding armor
- Applying visual status effects

Multiple overlay layers can be active at the same time.

---

## Editor Validation

The editor includes validation tools that help ensure the overlay layer is configured correctly.

Common validation checks include:

- Missing Animator Controller
- Invalid or missing synced parameters
- Parameters that do not exist in both controllers

---

## Best Practices

- Keep overlay animator controllers simple.
- Only synchronize parameters that are required.
- Use overlays for independent visuals rather than core character layers.

---

## Related Pages

- [Layered Character Type](xref:layered-character-type)
- [Character Types](xref:character-types)
- [Character Usage](xref:character-usage)