---
uid: ccm-list-layer-selector
---

# List Layer Selector

## Overview

A **List Layer Selector** contains a vertical list where each element in the grid represents an option of the assigned character layer. When an element is selected it will be applied to the character immediately.

![List Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/list-layer-selector.png)

---

## Prefabs

> [!TIP]
> Location: **Prefabs > Character Creator > Layer Selectors > List Selector**

### Layer Selector Prefabs
- **Layer List Selector** – Most common list selector. Each element in the list is displayed as a both text & sprite.  
- **Layer List Selector [+Title]** – Same as #1 but includes a title with the name of the assigned layer at the top.  

### Pre-Setup Prefabs
Pre-setup prefabs already include a [Character Layer Selection Manager](xref:ccm-layer-selector-setup#character-layer-selection-manager).  
These will work out of the box without any extra setup required.

- **List Selectors [Auto Create]** – Instantiates list selectors [+Title] at runtime. Uses a Horizontal Layout Group component to sort them.  
- **List Selectors [Initialize Existing]** – Uses list selectors already present in the prefab hierarchy.  

### List Entries
A list entry is referenced in a Layer List Selector and defines how each entry in the list looks and functions.
They live in the **/List Entries subfolder**.  
The following are pre-created entries that can be used in any **Layer List Selector**:
1. **Layer Option List Element [Text]** - Displays only text containing the name of the assigned layer option.
2. **Layer Option List Element [Text + Sprite]** Displays text containing the name of the assigned layer option & a preview of what the layer option looks like.

---

## Customization

- **Names** – Can use either raw spritesheet names or cleaned up names. Toggleable in the Character Creator Settings for each Character Type.
- **Styling** everything can be freely modified (Change sprites, fonts, colors, etc) including the list and individual element backgrounds.

---

## Limitations

- The list can take up a lot of space whem multiple are used at a time. Works best when used with a  
[Tab Layer Selector](xref:ccm-tab-layer-selector).