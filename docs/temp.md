---
uid: temp
---

# History Panels

A **History Panel** displays a list of snapshots recorded by the [History Tracker](xref:ccm-history-tracking-system#history-tracker-component).

These snapshots represent previous states of a character, allowing the player to:
- Review past changes
- Restore earlier configurations

---

## Panel Types

There are two primary types of **History Panels**. Both present the same snapshot data but differ in how that information is displayed.

---

### Text-Based Panels

A **Text-Based Panel** describes each snapshot using text.

**Entry behavior:**
- **1 layer changed** → Displays the layer name and selected option  
- **2 layers changed** → Displays both layer names  
- **3+ layers changed** → Displays the number of layers modified  

**Typical layout:** Vertical list

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-text.png" alt="Text-Based History Panel" width="300" />

---

### Sprite-Based Panels

A **Sprite-Based Panel** visually represents each snapshot using character previews.

Each entry reconstructs the character’s appearance at that point in time by combining layer sprites.

**Typical layout:** Horizontal list

#### Preview Frame Setup

To define which frame is used for preview generation:

1. Select your **Layered Character Type** asset
2. Open it in the **Inspector**
3. Expand **Character Creator Settings**
4. Locate **Character Preview Settings**
5. Assign a **Preview Sprite**

The **rect** of this sprite determines the frame extracted from every layer.  
All extracted frames are combined to render the final preview.

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-sprite-preview.png" alt="Sprite-Based History Panel" width="500" />

---

## Prefabs

**Location:**  
`Prefabs > Character Creator > Modules > History > History Panels`

---

### Pre-Setup Panels

Located in the **Pre-Setup** folder.

These panels are ready to use:
1. Drag and drop into your Character Creation Menu
2. Assign a **History Tracker**

The **History Tracker** reference is found on the `CCM History Panel` component at the root of the prefab.

![History Panel Component](~/images/character-creation-menu/ccm-history/panels/history-panel-component.png)

---

### Entry Prefabs

Located in the `History List Entries` folder.

Included prefabs:

- **History Panel Entry [Text]**  
  Displays a textual description of the snapshot

- **History Panel Entry [Sprite]**  
  Displays layered sprite previews representing the snapshot

---

## Creating a History Panel

All panels use the `CCM History Panel` component to populate entries from snapshot data.

### Setup Steps

1. Create a new **GameObject**
2. Add the `CCM History Panel` component
3. Assign a **History Tracker**
   - [Setup guide](xref:ccm-history-tracking-system#history-tracker-component)
4. Assign a **List Parent**
5. Assign an **Entry Prefab**

---

### List Parent

The **List Parent** is the container where entries are instantiated.

Common setup options:
- **Vertical Layout Group** → Stacked entries
- **Horizontal Layout Group** → Row-based entries
- **Scroll View** → Scrollable lists with overflow handling

---

### Panel Settings

| Setting           | Description |
|------------------|------------|
| **Mode**          | Controls whether entries appear only when used or are always visible |
| **Newest On Top** | Inserts new entries at the top of the list |
| **Preload Pool**  | Number of entries pre-instantiated on menu initialization |

---

## Creating a Custom History Entry

To build a custom **History Panel Entry**:

### Step-by-Step

1. Create a new **GameObject**
2. Add the [HistoryPanelEntry](xref:BlazerTech.CharacterManagement.CharacterCreator.HistoryPanelEntry) component
3. Set the **Display Mode**:
   - **Text** → Requires a text reference
   - **Sprite** → Requires a sprite container (parent object)
   - **Text And Sprite** → Requires both

4. Add a `Toggle` component
5. Assign the `Toggle` reference in `HistoryPanelEntry`
6. Add an `Image` component (background)
7. Set the Toggle **Target Graphic** to this image

---

### Selection Highlight

8. Create a child GameObject (e.g. **Highlight**)  
9. Add an `Image` component to it  
10. Assign this image to the Toggle **Graphic** field  
11. Configure it as the visual indicator for selection  

---

### Finalizing

12. Drag the GameObject into the Project window to create a prefab  
13. Assign it to the **Entry Prefab** field on the `CCM History Panel`

---

### Tip

If setup is unclear, inspect one of the included entry prefabs to understand the structure and references.