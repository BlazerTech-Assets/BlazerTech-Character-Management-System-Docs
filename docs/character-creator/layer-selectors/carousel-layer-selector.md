---
uid: ccm-carousel-layer-selector
---

# Carousel Layer Selector

## Overview

A **Carousel Layer Selector** displays the currently selected layer option and contains left/right buttons to cycle through other options available for the assigned layer.

![Carousel Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/carousel-layer-selector.png)

---

## Prefabs

> [!TIP]
> Location: **Prefabs > Character Creator > Layer Selectors > Carousel Selector**

### Layer Selector Prefabs
- **Layer Carousel Selector** – Basic carousel selector.  
- **Layer Carousel Selector [+Randomize]** – Includes a randomize button next to the carousel.
- **Layer Carousel Selector [-Background]** - Basic carousel selector without a background.  

### Pre-Setup Prefabs
Pre-setup prefabs already include a [Character Layer Selection Manager](xref:ccm-layer-selector-setup#character-layer-selection-manager).  
These will work out of the box without any extra setup required.

- **Carousel Selectors [Auto Create]** – Instantiates carousel selectors at runtime. Uses a Grid Layout Group component to sort them.  
- **Carousel Selectors [Initialize Existing]** – Uses carousel selectors already present in the prefab hierarchy.  

---

## Customization

- **Names** – Can use either raw spritesheet names or cleaned up names. Toggleable in the Character Creator Settings for each Character Type.
- **Randomization** – The “[+Randomize]” prefab adds a randomize option for the current layer.  
- **Styling** The carousel selector can be freely modified (Change sprites, fonts, colors, etc)  

---

## Limitations

- The **Carousel Layer Selector** only shows **text**. If you need visual previews, consider the  
  [Grid Layer Selector](xref:ccm-grid-layer-selector) or [List Layer Selector](xref:ccm-list-layer-selector).