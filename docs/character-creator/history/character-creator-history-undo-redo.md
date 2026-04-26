---
uid: ccm-history-undo-redo
---

# History Undo/Redo

With the [History Tracker component](xref:ccm-history-tracking-system#history-tracker-component) setup you can include buttons in your **Character Creation Menu** that undo or redo changes you've previously made.

> [!NOTE]
> A [CCM History Tracker](xref:ccm-history-tracking-system#history-tracker-component) component **must** be present somewhere inside the **menu contents** for the Undo/Redo buttons to be functional.

<img src="~/images/character-creation-menu/ccm-history/history-undo-redo-buttons.png" alt="History Undo/Redo Buttons" width="500" /> 

---

## Prefabs

Location: `Prefabs > Character Creator > Modules > History > Undo-Redo`

These prefabs contain both **Undo and Redo buttons** pre-setup.  
Drag and drop them anywhere inside the **contents of your Character Creation Menu**.

There are four prefabs in total. All are identical except for the sprites used.

![Prefabs Folder](~/images/character-creation-menu/ccm-history/undo-redo/prefabs-folder.png)

---

## Manual Setup

Setup is extremely simple:  

1. Add the `Button` and [CCMTimelineButtonHandler](xref:BlazerTech.CharacterManagement.CharacterCreator.CCMTimelineButtonHandler) component to any **GameObject** inside the your menu.
2. Assign the `Button` reference to the `CCMTimelineButtonHandler` component.
3. Set the `Action` to either **Undo** or **Redo**.
4. Set the buttons **On Click** event to call `CCMTimelineButtonHandler.CallAction`.

![Timeline Button Handler Component](~/images/character-creation-menu/ccm-history/undo-redo/timeline-button-handler-component.png)


If a button has nothing to undo/redo, the button will be automatically disabled until valid again.
