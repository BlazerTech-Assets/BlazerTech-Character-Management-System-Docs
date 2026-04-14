---
uid: ccm-grid-layer-selector
---

# Grid Layer Selector

## Overview

A **Grid Layer Selector** contains a grid where each element in the grid represents an option of the assigned character layer. When an element is selected it will be applied to the character immediately.

![Grid Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/grid-layer-selector.png)

![Grid Layer Selector Variant 2](~/images/character-creation-menu/ccm-layer-selectors/grid-layer-selector-variant-2.png)
---

## Prefabs

> [!TIP]
> Location: **Prefabs > Character Creator > Layer Selectors > Grid Selector**

### Layer Selector Prefabs
- **Layer Grid Selector [Sprite]** – Most common grid selector. Each element in the grid is displayed as a sprite.  
- **Layer Grid Selector [Text]** – Each element in the grid is displayed as text.  
- **Layer Grid Selector [Sprite + Text]** - Hybrid. Each element in the grid is displayed as both sprite and text.  
- **Layer Grid Selector [Vertical + Title]** – Grid is vertical & includes a title with the name of the assigned layer at the top.  

### Pre-Setup Prefabs
Pre-setup prefabs already include a [Character Layer Selection Manager](xref:ccm-layer-selector-setup#character-layer-selection-manager).  
These will work out of the box without any extra setup required.

- **Grid Selectors [Auto Create]** – Instantiates grid selectors [sprite] at runtime. Uses a Horizontal Layout Group component to sort them.  
- **Grid Selectors [Initialize Existing]** – Uses grid selectors already present in the prefab hierarchy.  

### Grid Entries
A grid entry is referenced in a Layer Grid Selector and defines how each entry in the grid looks and functions.
They live in the **/Grid Entries subfolder**.  
The following are pre-created entries that can be used in any **Layer Grid Selector**:
1. **Layer Option Grid Element [Sprite]** - Displays only a sprite preview of what the layer option looks like.
2. **Layer Option Grid Element [Text]** - Displays only text containing the name of the assigned layer option.
3. **Layer Option Grid Element [Text + Sprite]** Displays text containing the name of the assigned layer option & a preview of what the layer option looks like.

---

## Customization

- **Names** – If grid elements have a display mode of text they can use either raw spritesheet names or cleaned up names. Toggleable in the Character Creator Settings for each Character Type.
- **Styling** everything can be freely modified (Change sprites, fonts, colors, etc) including the grid and individual element backgrounds.

---

## Limitations

- The grid can be quite big and clunky at times. Works best when used with a  
[Tab Layer Selector](xref:ccm-tab-layer-selector).