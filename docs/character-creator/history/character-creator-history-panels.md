---
uid: ccm-history-panels
---

# History Panels

A History Panel displays a list of snaphots saved in the [History Tracker component](xref:ccm-history-tracking-system#history-tracker-component). 

This lets the player view and restore any changes they've previously made.

---

## Panel Types

There are two major types of **History Panels**. Both types display a list of modifcations made to the character but display that information in different ways.

### Text Based Panels

An entry in a **text based panel** uses text to describe what was changed in each entry:

- If only one layer was changed it says what layer was changed and what option it was changed to
- If exactly two layers were changed it says the names of the layers changed.
- If more than two layers were changed it says how many layers were changed.

Text based panels are usually vertical.

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-text.png" alt="History Panel Text" width="300" />  

### Sprite Based Panels

An entry in a sprite based panel uses a sprites to visually show what the character previously looked like.

Sprite based panels are usually horizontal.

**To set the frame used for the preview**:

1. Go to your **Layerd Character Type** asset and open it in the **Inspector**.
2. Expand the **Character Creator Settings** section.
3. Find **Character Preview Settings**.
4. Set the **Preview Sprite**.

The rect of the **Preview Sprite** will be used to extract the same frame from all layers of the character. All frames will then be overlayed on top of each other to create the final character preview.

<img src="~/images/character-creation-menu/ccm-history/panels/history-panel-sprite-preview.png" alt="History Panel" width="500" />  

---

## Prefabs

Prefabs Location: `Prefabs > Character Creator > Modules > History > History Panels`

### Pre-Setup

These prefabs are contained in the **Pre-Setup** subfolder.

There are two history panel prefabs already setup. **Drag and drop** them anywhere in the **contents of your Character Creation Menu**.

You'll need to assign a **History Tracker** in order for the panel to be functional.  
Don't have a **History Tracker** setup? [Read here](xref:ccm-history-tracking-system#history-tracker-component).

The **History Tracker field** can be found in the **CCM History Panel** component which is located at the root of the prefab.

![History Panel Component](~/images/character-creation-menu/ccm-history/panels/history-panel-component.png)

### List Entry Prefabs

These prefabs are contained in the `History List Entries` subfolder.

The following are entries used in the pre-setup panels.

1. **History Panel Entry [Text]**
   - Entry displaying text which describes what changed in the assigned snapshot.
2. **History Panel Entry [Sprite]**
   - Entry containing a dynmaic list of sprites. Each sprite displays a layer in the assigned character snapshot.

---

## Create Custom History Panel Entry

Follow these steps to create your own **History Panel entry** from scratch:
1. Create a new **GameObject** and add the [HistoryPanelEntry](xref:BlazerTech.CharacterManagement.CharacterCreator.HistoryPanelEntry) component.
2. Set the Display Mode:
   - Text - Requires reference to a text objcet.
   - Sprite - Requires reference to layer preview sprites parent. (The parent GameObject sprites will be instantiated inside)
   - Text And Sprite - Requires both aforementioned references.
3. Add the `Toggle` component and reference it in the `HistoryPanelEntry` component.
4. Add an `Image` component - This will be the background image.
5. Set the `Target Graphic` on the `toggle` to the image component.
6. Add a new child game object and add another `Image` component to it.
7. Name the new child game object something like **Highlight**. - This game object will only be active when the entry is selected.
8. Set the `Graphic` on the `toggle` to the image component on the **Highlight** game object.
9. Turn your game object into a prefab by dragging it into a folder in the project window.
10. Finally, on the [CCMHistoryPanel](xref:BlazerTech.CharacterManagement.CharacterCreator.CCMHistoryPanel) component which lives on all **History Panels**, set the `Entry Prefab` to reference your new prefab.

**Confused?**  
Checkout one of the pre-existing entry prefabs to see how they're setup.