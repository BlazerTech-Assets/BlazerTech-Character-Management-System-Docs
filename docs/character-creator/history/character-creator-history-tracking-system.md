---
uid: ccm-history-tracking-system
---

# History Tracking System
The **History Tracking System** tracks every change made to the character in the Character Creation Menu whlie open. Changes can then be looked through and undone at anytime.

---

## Features Overview

| Feature                | Description                                                                 |
| ---------------------- | --------------------------------------------------------------------------- |
| **Automatic Tracking** | Every change to the character can be recorded as a snapshot.                |
| **Undo/Redo**          | Step backward or forward through the list of changes made to the character. |
| **Direct Selection**   | Select any snapshot to instantly restore the character.                     |
| **Snapshot Limit**     | Configurable maximum number of snapshots (1-100, default = 30).             |

---

## History Tracker Component

Introducing the [CCM History Tracker](xref:BlazerTech.CharacterManagement.CharacterCreator.CCMHistoryTracker) component.  
This component will track every time a layer on the character is changed and record the change as a snapshot.

- A snapshot contains all information required to restore a character to the exact state it was in when the snapshot was taken.  
- Snapshots are saved in a list with newest entries added to the end of the list.
- **Max Snapshots** can be set anywhere between **1-100** (Default is **30**).
- When the max amount of snapshots is met, oldest snapshots will start being replaced.
- The **Preserve First Snapshot** bool can be toggled which will stop the first snapshot created from being deleted or replaced.

> [!NOTE]
> The `CCM History Tracker` component is required for both **History Panels** and **Undo/Redo controls** to function.

![CCM History Tracker Component](~/images/character-creation-menu/ccm-history/history-tracker-component.png)

---

### Component Placement

The **CCM History Tracker** component should be placed inside the **Character Creation Menu Contents**.  
This is the **Menu Contents** GameObject the **Character Creation Menu Manager** component references.

![History Tracker Component Placement Example](~/images/character-creation-menu/ccm-history/history-tracker-component-placement-example.png)

---

## Integrations

Additional UI elements which integrate with the **History Tracking System**.

---

### Undo/Redo Buttons

Buttons for un-doing or re-doing changes made to the character.

<img src="~/images/character-creation-menu/ccm-history/undo-redo/history-undo-redo-buttons.png" alt="History Undo/Redo Buttons" width="500" />  

[Read More → History Undo/Redo](xref:ccm-history-undo-redo)

---

### History Panels

Panels which display every change made in a clean list.

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-sprite-preview.png" alt="History Panel" width="500" />  

[Read More → History Panels](xref:ccm-history-panels)