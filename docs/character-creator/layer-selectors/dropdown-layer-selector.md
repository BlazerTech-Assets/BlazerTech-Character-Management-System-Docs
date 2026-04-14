---
uid: ccm-dropdown-layer-selector
---

# Dropdown Layer Selector

## Overview

A **Dropdown Layer Selector** is a standard dropdown UI element.  
When opened, it displays a list of all available options for the assigned character layer.

![Dropdown Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/dropdown-layer-selector.png)

---

## Prefabs

> [!TIP]
> Location: **Prefabs > Character Creator > Layer Selectors > Dropdown Selector**

### Layer Selector Prefabs
- **Layer Dropdown Selector** – Basic dropdown selector.  
- **Layer Dropdown Selector [+Randomize]** – Includes a randomize button next to the dropdown.  

### Pre-Setup Prefabs
Pre-setup prefabs already include a [Character Layer Selection Manager](xref:ccm-layer-selector-setup#character-layer-selection-manager).  
These will work out of the box without any extra setup required.

- **Dropdown Selectors [Auto Create]** – Instantiates dropdown selectors at runtime. Uses a Grid Layout Group component to sort them.  
- **Dropdown Selectors [Initialize Existing]** – Uses dropdown selectors already present in the prefab hierarchy.  

---

## Customization

- **Names** – Can use either raw spritesheet names or cleaned up names. Toggleable in the Character Creator Settings for each Character Type.
- **Randomization** – The “[+Randomize]” prefab adds a randomize option for the current layer.  
- **Styling** The dropdown can be freely modified (Change sprites, fonts, colors, etc)  

---

## Limitations

- The **Dropdown Layer Selector** only shows **text**. If you need visual previews, consider the  
  [Grid Layer Selector](xref:ccm-grid-layer-selector) or [List Layer Selector](xref:ccm-list-layer-selector).