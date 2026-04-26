---
uid: ccm-dropdown-layer-selector
---

# Dropdown Layer Selector

A **Dropdown Layer Selector** is a standard dropdown UI element.  
When opened, it displays a list of all available options for the assigned character layer.

![Dropdown Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/dropdown-layer-selector.png)

---

## Usage

The **Dropdown Layer Selector** can be used in two ways.

1. Use in a **bulk setup** alongisde a set of other **Dropdown Layer Selectors**.
   - [Read the setup guide here](xref:ccm-layer-selector-setup#bulk-selector-setup).
2. Use a single dropdown with a **Tab Layer Selector**.
   - [Read more about Tab Layer Selectors here](xref:ccm-tab-layer-selector)

---

## Prefabs

**Location**: `Prefabs > Character Creator > Modules > Layer Selectors > Dropdown Selector`.

---

### Core Prefabs

Located in the **Core** subfolder

Contains individual Dropdown Layer Selector prefabs.

- **Layer Dropdown Selector** – Basic dropdown selector.  
- **Layer Dropdown Selector [+Randomize]** – Includes a randomize button next to the dropdown.  
- **Layer Dropdown Selector [+Title]** - Includes a title above the dropdown with the layer name.

These prefabs are **not** functional on their own.

---

### Pre-Setup Prefabs
Prefabs that contain a pre-configured [Character Layer Selection Manager](xref:ccm-layer-selector-setup#how-layer-selectors-work).  
These prefabs will work out of the box without any extra setup.

- **Dropdown Selectors [Auto Create]** – Instantiates dropdown selectors at runtime. Uses a Grid Layout Group component to sort them.  
- **Dropdown Selectors [Initialize Existing]** – Uses dropdown selectors already present in the prefab hierarchy.  

---

## Limitations

- The **Dropdown Layer Selector** only shows **text**. If you need visual previews, consider the  
  [Grid Layer Selector](xref:ccm-grid-layer-selector) or [List Layer Selector](xref:ccm-list-layer-selector).