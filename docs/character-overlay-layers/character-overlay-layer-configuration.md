---
uid: character-overlay-layer-configuration
summary: Learn how to create and setup a Character overlay Layer asset.
---

# Character Overlay Layer Configuration

This page will go over the process of creating and configuring an **Overlay Layer asset**.

Not sure what a **Character Overlay Layer** is?

[Read More → Character Overlay Layers](xref:character-overlay-layers)  

---

## Creating an Overlay Layer

To create a new Overlay Layer asset:

1. `Right click` the **Project window**
2. Navigate to: **Create > BlazerTech > Character Management System > Character Overlay Layers**

![Create Character Overlay Layer](~/images/overlay-layers/create-character-overlay-layer.png)

---

# Overlay Layer Setup

## Character Type

Assign the **Character Type asset** that this **Overlay Layer** is meant to be used with.  

![Character Type Field](~/images/overlay-layers/references/character-type-field.png)

> [!NOTE]
> Overlay Layers can only be used alongside their assigned Character Type.

## Animator Controller (Optional)

Assign the **Animator Controller** that will be used to animate the **Overlay Layer**.

![Animator Controller Field](~/images/overlay-layers/references/animator-controller-field.png)

**Overlay Layers** use a separate **Animator Controller** from the **Character Type**. This **Controller** can either be completely separate and play its own animations or have its paramters synced to the paramters of the **Animator Controller** in the assigned **Character Type**.

It's down to you to decide how you want to setup your **Animator Controller**.

---

## Animation Sync Mode

Determines if and how the **Overlay Layers Animator Controller** is synchronized to the **Character Type Animator Controller**. 

### Full Parameter Sync


All parameters in the Overlay Layer Animator Controller are synchronized to the Character Type Animator Controller.

![Animation Sync Mode: Full Paramter Sync](~/images/overlay-layers/animation-sync-mode/animation-sync-mode-full-parameter-sync.png)

This option assumes that both Animator Controllers share the exact same parameters.

When this option is selected, a new section is exposed at the bottom of the inspector titled "Overlay Layer Parameter Validation".  
This section compares the two Animator Controllers and shows you if the Overlay Layers Animator Controller is missing any parameters.

![Overlay Controller Parameter Validation Section](~/images/overlay-layers/overlay-controller-parameter-validation.png)

### Partial Parameter Sync

Only selected parameters are synchronized to the Overlay Layer Animator Controller.

![Animation Sync Mode: Partial Paramter Sync](~/images/overlay-layers/animation-sync-mode/animation-sync-mode-partial-parameter-sync.png)

When this option is selected, a new section is appears at the bottom of the inspector titled "Overlay Controller Synced Parameters"

This section contains a list of all paramters in the Character Type Animator Controller.

If a parameter with the same name and type exists in the Overlay Layer Animator Controller then the parameter can be enabled here and will be synced during runtime.  
If not the parameter cannot be enabled and a warning will appear stating the parmater does not exist in the Overlay Layer Animator Controller.

![Overlay Controller Synced Parameters Section](~/images/overlay-layers/overlay-controller-synced-parameters-section.png)

### Not Synced

The Overlay Layers Animator Controller is not synchronized at all. This allows the Overlay Layer to be animated separately of the character.

![Animation Sync Mode: Not Synced](~/images/overlay-layers/animation-sync-mode/animation-sync-mode-not-synced.png)

---

## Layer Sorting Mode

Decides how the Overlay Layer is rendered in relation to the Character.

![Layer Sorting Mode Field](~/images/overlay-layers/settings/layer-sorting-mode-field.png)

### In Front of Character

The Overlay Layer is rendered in front of the character.

### Behind Character

The Overlay Layer is rendered behind the character.

---

## Offset Mode

Sometimes the Overlay Layer might not line up correctly with your character. If it doesn't you can apply an offset to it.  

![Offset Mode Field](~/images/overlay-layers/settings/offset-mode-field.png)

The Offset Mode determines what unit of measurement is used to apply the offset.

### Pixel Offset

Apply an offset to the Overlay Layer in the amount of Pixels specificed, which is then converted to Units at runtime.

### Unit Offset

Apply an offset to the Overlay Layer in the amount of Units specified.