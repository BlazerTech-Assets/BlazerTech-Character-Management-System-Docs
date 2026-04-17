# Character Creator Menu Controls

Menu Controls are UI button groups used inside the **Character Creation Menu** to provide core user actions such as saving, closing, randomizing, and resetting a character.

They are optional prefabs that can be dropped into a Character Creator UI or replaced with custom implementations using the CCM Relay system.

---

## Overview

Menu Controls typically provide the following actions:

- Close or exit the Character Creator
- Save or confirm character changes
- Reset the character to its original state
- Randomize the character appearance

---

## Prefabs

**Location:** `Prefabs > Character Creator > Modules > Menu Controls`

The system includes ready-made prefab variants that can be used without any additional setup. Drag and drop them directly into your Character Creation Menu hierarchy.

### Variants

Each variation folder contains the same layout but different button combinations and sprite styles.

Available prefab layouts:

1. Menu Controls (Back, Confirm, Randomize, Reset)  
2. Menu Controls (Back, Confirm, Randomize)  
3. Menu Controls (Back, Confirm)

These variants allow you to choose the level of functionality needed for your UI.

---

## Generic Buttons

Inside the same prefabs directory, the **Generic Buttons** folder contains individual button prefabs designed for reuse.

Each prefab includes:

- A UI Button
- A preconfigured **CCM Relay** component
- A unique visual style (sprite variation only)

These are intended for building fully custom menu layouts while still retaining built-in functionality.

---

## CCM Relay Component

The **CCM Relay** component acts as a bridge between UI buttons and the Character Creation Menu system.

It forwards button events to the active Character Creation Menu Manager, allowing UI elements to remain decoupled from core logic.

### Usage

To create a custom button using CCM Relay:

1. Add the `CCM Relay` component to a GameObject
2. Add a Unity `Button` component
3. Assign the Button's **On Click** event to call a method on the CCM Relay component

Example usage flow:

- Button click → CCM Relay method → Character Creation Menu Manager action

### Example

![CCM Relay Usage Example](~/images/character-creator-setup/ccm-relay-usage-example.png)

---

## CCM Relay Methods

The following public methods are available on the `CCM Relay` component:

### DisableMenu()

Closes and disables the Character Creation Menu if it is currently open.

---

### SaveCharacter()

Saves the currently edited character from the Character Creation Menu.  
If the system supports grouping, the character is also added to the appropriate group.

---

### RandomizeEntireCharacter()

Randomizes all character layers in the current Character Creation Menu instance.

---

### ResetCharacter()

Restores the character to the state it was in when the Character Creation Menu was first opened.