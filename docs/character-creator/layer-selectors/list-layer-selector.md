---
uid: ccm-list-layer-selector
---

# List Layer Selector

A **List Layer Selector** contains a vertical list where each element in the grid represents an option of the assigned character layer. When an element is selected it will be applied to the character immediately.

![List Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/list-layer-selector.png)

---

## Usage

The List Layer Selector can be used in two ways.

1. Use a single List Layer Selector with **Tab Layer Selectors** (Recommended).
   - [Read more about Tab Layer Selectors here](xref:ccm-tab-layer-selector)
2. Use in a **bulk setup** alongside a set of other **Grid Layer Selectors**.
   - [Read the setup guide here](xref:ccm-layer-selector-setup#bulk-selector-setup).

---

## Prefabs

**Location**: `Prefabs > Character Creator > Modules > Layer Selectors > List Selector`.

---

### Core Prefabs

Located in the **Core** subfolder.

Contains individual List Layer Selector prefabs.

- **Layer List Selector** – Most common list selector. Each element in the list is displayed as both text & sprite.  
- **Layer List Selector [+Title]** – Includes a title with the name of the assigned layer at the top.  

These prefabs are **not** functional on their own.

---

### Pre-Setup Prefabs

Located in the **Pre-Setup** subfolder.

These are bulk prefabs that contain multiple **List Layer Selectors**.

Pre-setup prefabs already include a [Character Layer Selection Manager](xref:ccm-layer-selector-setup#character-layer-selection-manager).  
These will work out of the box without any extra setup required.

- **List Selectors [Auto Create]** – Instantiates list selectors [+Title] at runtime. Uses a **Horizontal Layout Group component** to sort them.  
- **List Selectors [Initialize Existing]** – Uses list selectors already present in the prefab hierarchy.  

---

### List Entries

Located in the **List Entries** subfolder.

These are the entries used in the list for the **Layer List Selector**.

A **list entry** is referenced in a **Layer List Selector** and defines how each entry in the list looks and functions.

The following are entries that can be used in any **Layer List Selector**:
1. **Layer Option List Element [Text]** - Displays only text containing the name of the assigned layer option.
2. **Layer Option List Element [Text + Sprite]** Displays text containing the name of the assigned layer option & a preview of what the layer option looks like.

---

### Pre-Setup Tab

Located in the **Pre-Setup Tab** subfolder.

Pre-configured with the `CCM Selected Layer Tab Handler` component and ready to be used with [Tab Layer Selectors](xref:ccm-tab-layer-selector).

Included prefabs:
- **List Layer Tab**

Drag and drop a prefab into the **Character Creation Menu** and assign the **Character Layer Selection Manager**.

---

## Limitations

- The list can take up a lot of space whem multiple are used at a time. Works best when used with a [Tab Layer Selector](xref:ccm-tab-layer-selector).