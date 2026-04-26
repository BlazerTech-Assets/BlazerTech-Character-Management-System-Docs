---
uid: ccm-history-panels
---

# History Panels

A **History Panel** displays a list of snapshots recorded by the [History Tracker](xref:ccm-history-tracking-system#history-tracker-component).

These snapshots represent previous states of a character, allowing the player to:
- Review past changes.
- Revert to previous versions. 

---

## Panel Types

There are two primary types of **History Panels**. Both display a list of modifcations made to the character but show that information in different ways.

---

### Text-Based Panels

A **Text-Based Panel** describes each snapshot using text.

- **1 Layer Changed** > Displays the layer name and selected option.
- **2 Layers Changed** > Displays both layer names.
- **3+ layers changed** > Displays the number of layers modified.

**Typical Layout**: Vertical List.

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-text.png" alt="History Panel Text" width="300" />  

---

### Sprite-Based Panels

A **Sprite-Based Panel** visually represents each snapshot using character previews.

Each entry reconstructs the characters appearance at that point in time by taking a single frame from each spritesheet contained in the snapshot and combining them together.

**Typical Layout**: Horizontal List.

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-sprite-preview.png" alt="History Panel" width="500" />  

#### Preview Frame Setup

To define which frame is used for preview generation:

1. Select your **Layered Character Type** asset and go to the Inspector window.
2. Expand **Character Creator Settings**
3. Locate **Character Preview Settings**
4. Assign a **Preview Sprite**

> [!NOTE]
> The **Preview Sprite** MUST be a sprite from the **Base Spritesheet**.

The **rect** of this sprite determines the frame extracted from every layer.  
All extracted frames are combined to render the final preview.  


---

## Prefabs

Location: `Prefabs > Character Creator > Modules > History > History Panels`

---

### Pre-Setup

Located in the **Pre-Setup** folder.

These panels are ready to use:
1. Drag and drop into your Character Creation Menu.
2. Assign a **History Tracker**.

You'll need to assign a **History Tracker** in order for the panel to be functional.  
Don't have a **History Tracker** setup? [Read here](xref:ccm-history-tracking-system#history-tracker-component).

The **History Tracker field** can be found in the **CCM History Panel** component at the root of the prefab.

![History Panel Component](~/images/character-creation-menu/ccm-history/panels/history-panel-component.png)

---

### Entry Prefabs

Located in the **History List Entries** folder.

Included prefabs:

1. **History Panel Entry [Text]**
   - Displays a textual description of what changed in the snapshot.
2. **History Panel Entry [Sprite]**
   - Displays a collection of sprites with each sprite representing a layer of the character recorded in the snapshot.    

These are the same prefabs used in the **Pre-Setup** History Panel prefabs.

---

## Creating a History Panel

All **History Panels** use the `CCM History Panel` component to populate entries from snapshot data.

### Setup Steps

1. Create a new **GameObject**.
2. Add the **CCM History Panel** component.
3. Assign a **History Tracker**.
   - [Setup Guide](xref:ccm-history-tracking-system#history-tracker-component).
4. Assign a **List Parent**.
5. Assign an **Entry Prefab**.

[Existing entry prefabs](#entry-prefabs) can be used or you can [create your own entry prefab](#creating-a-history-panel-entry).

---

### List Parent

The **List Parent** is the container where entries are instantiated.

A **Vertical** or **Horintal Layout Group** component can be used to automatically space entries.  
Or a **Scroll View** can be used which provides a scrollable list which overflow handling.

The `CCM History Panel` component will instantiate entries as children of this **GameObject**, however it's up to you to decide how these entries will be layed out.

---

### Panel Settings

| Setting           | Description                                                                                             |
| ----------------- | ------------------------------------------------------------------------------------------------------- |
| **Mode**          | Controls whether entries appear only when used or are always visible.                                   |
| **Newest On Top** | If enabled, inserts new entries at the top of the list. If disabled, inserts new entries at the bottom. |
| **Preload Pool**  | Number of entries pre-instantiated on menu initialization.                                              |

---

## Creating a History Panel Entry

Follow these steps to create your own **History Panel entry** from scratch:

### Setup Steps

1. Create a new **GameObject**.
2. Add the [History Panel Entry](xref:BlazerTech.CharacterManagement.CharacterCreator.HistoryPanelEntry) component.
3. Set the **Display Mode**:
   - **Text** > Requires a text reference.
   - **Sprite** > Requires a sprite container reference (Parent GameObject).
   - **Text And Sprite** > Requires Both.
4. Add a `Toggle` component.
5. Assign the `Toggle` reference in the `History Panel Entry` component.
6. Add an `image` component (This will be the entries background).
7. Set the Toggle **Target Graphic** to this Image.

### Selection Highlight

8. Create a child GameObject and name it (e.g. **Highlight**).  
9. Add an `Image` component to it.  
10. Give it the sprite you want to be shown when selected.  
11. Assign this image to the Toggle **Graphic** field.  

---

### Finalizing

12. Drag the **GameObject** into the **Project window** to create a prefab.  
13. Assign it to the **Entry Prefab** field on your **History Panel**.

> [!TIP]
> **Confused?** Check out one of the [included entry prefabs](#entry-prefabs) to understand how they're set up.