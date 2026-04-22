---
uid: character-creator-setup
---
[EnableMenu_PrimaryCharacterSlot]: xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterCreationMenuManager#BlazerTech_CharacterManagement_CharacterCreator_CharacterCreationMenuManager_EnableMenu_PrimaryCharacterSlot_BlazerTech_CharacterManagement_Characters_LayeredCharacterTypeSO_System_Boolean_
[EnableMenu_EditCharacter]: xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterCreationMenuManager#BlazerTech_CharacterManagement_CharacterCreator_CharacterCreationMenuManager_EnableMenu_EditCharacter_BlazerTech_CharacterManagement_Characters_LayeredCharacter_System_Boolean_
[EnableMenu_NewPrimaryCharacterSlot]: xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterCreationMenuManager#BlazerTech_CharacterManagement_CharacterCreator_CharacterCreationMenuManager_EnableMenu_NewPrimaryCharacterSlot_BlazerTech_CharacterManagement_Characters_LayeredCharacterTypeSO_System_Boolean_
[EnableMenu_NewCharacterInFlexibleGroup]: xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterCreationMenuManager#BlazerTech_CharacterManagement_CharacterCreator_CharacterCreationMenuManager_EnableMenu_NewCharacterInFlexibleGroup_System_String_BlazerTech_CharacterManagement_Characters_FlexibleCharacterGroup_System_Boolean_

# Character Creator Setup
This page will guide you through the process of implementing your own **Character Creation Menu** into your game.

## The Character Creation Menu Manager

The `CharacterCreationMenuManager` is the beating heart of the menu.

It lives outside the contents of the menu and should be enabled at all times.  
It requires two things.
1. **Default Character Type** - The character type used when enabling the menu. Can be overridden.
2. **Menu Contents** - Parent game object of the actual Character Creation Menu contents.

### How to Enable the Menu
The `Character Creation Menu Manager` provides 4 methods to open the menu.  
Most methods use the Character Grouping System.  
Learn more about the [Character Grouping System here](xref:character-grouping-system).  

| Method                                                                                                                   | Descripion                                                                                   |
| ------------------------------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------- |
| [EnableMenu_PrimaryCharacterSlot]                                                                                        | Opens the menu using the Primary Character Slot in the Character Type Used.                  |
| [EnableMenu_EditCharacter]                                                                                               | Open the menu to edit a layered character that already exists.                               |
| [EnableMenu_NewPrimaryCharacterSlot]                                                                                     | Opens the menu with a new character that overrides the Primary Character slot.               |
| [<span style="white-space:nowrap">EnableMenu_NewCharacterInFlexibleGroup</span>][EnableMenu_NewCharacterInFlexibleGroup] | Opens the menu with a new character & puts it inside the provided Flexible Group when saved. |

### Character Creation Menu Events

Two Unity Events are exposted in the `Character Creation Menu Manager` component.

1. **On Character Saved**
   - Called when the character in the **Character Creation Menu** is saved.
   - Provides the charater that was saved as an argument.
   - For example you can hook up to this event, when it's invoked call `CharacterCreationMenuManager.DisableMenu` to disable and close the menu.
2. **On Menu Disabled**
   - Called after the **Character Creation Menu** is disabled and closed. You can hook up to this event and when invoked open any other menu you'd like using your own menu system.

---

## Premade Character Creation Menus

The easiest solution is to use a **premade character creation menu**. These prefabs contain everything needed for a functional Character Creation Menu.
At bare minimum they contain the following:  

| Content                 | Descripion                                                       |
| ----------------------- | ---------------------------------------------------------------- |
| **Layer Selectors**     | Used to change layers of the character.                          |
| **Character preview**   | Used to preview the character while editing.                     |
| **Loading Screen**      | Displayed over the Character Creation Menu while it's loading.   |
| **Save & Back Buttons** | Used to save character changes or close the menu without saving. |

> [!TIP]
> Premade Character Creation Menu prefabs location: **Prefabs > Character Creator > Premade Menus**  

### Premade Menus:  
1. **Character Creation Menu 1**:
   - **Carousel Selectors [Initialize Existing]** - Includes 4 carousel selectors.
   - **Character Preview** - Includes rotation & animation change controls.
   - **Undo/Redo Buttons**.
   - **Randomize Entire Character button**.
   - **Save and Back buttons**.
   - **Loading Screen** - Includes progress bar and text.
   - <img src="~/images/premade-character-creation-menus/premade-character-creation-menu-1.png" alt="Premade Character Creation Menu #1" width="500" />
2. **Character Creation Menu 2**:
   - **Dropdown Selectors [Initialize Existing]**. - Includes 6 dropdown selectors.
   - **Character Preview** - Includes rotation controls.
   - **Loading Screen** - Includes progress bar and text.
   - **Save & Back buttons**.
   - <img src="~/images/premade-character-creation-menus/premade-character-creation-menu-2.png" alt="Premade Character Creation Menu #2" width="500" />
3. **Character Creation Menu 3**:
   - **Dropdown Selectors [Initialize Existing]** - Includes 6 dropdown selectors.
   - **Character Preview** - Includes rotation & animation change controls.
   - **Randomize Entire Character button**.
   - **Save and Back buttons**.
   - **Character Display Name Field**.
   - **Character History Tracking** - Max 30 snapshots (Configurable).
   - **Horizontal History List**.
   - **Loading Screen** - Includes progress bar and text.
   - <img src="~/images/premade-character-creation-menus/premade-character-creation-menu-3.png" alt="Premade Character Creation Menu #2" width="500" />


---

## Creating Your Own Character Creation Menu

You'll need two game objects.
- #1 holds the `Character Creation Menu Manager` component and will manage the menu. **SHOULD** be enabled at runtime.
- #2 Holds the actual contents of the menu and is referenced in the `Menu Contents` field in the `Character Creation Menu Manager`. Doesn't matter if it's enabled or disabled.

![Character Creation Menu Structure](~/images/character-creation-menu/character-creation-menu-structure.png)

### Character Creation Menu Contents

Use this section as a checklist for everything that can be added to the **Character Creation Menu**.  
Starting with the essentials and then bonus features.

All parts of the menu are contained as prefabs. These prefabs can be placed anywhere in the character creation menu contents parent.  
Most do not require any manual references and can be added without any extra setup.

#### Essentials
1. **Layer Selectors**
   - Lets the player change selected options for each layer of the character.
   - Prefabs Location: **Prefabs > Character Creator > Layer Selectors**. Choose any folder within there.
   - Within your chosen Layer Selector folder use a prefab within the `/Pre-Setup` subfolder which contains a set of already setup **Layer Selectors**.
   - Learn more about Layer Selectors [here](xref:ccm-layer-selector-setup).
2. **Character Preview**
   - A character preview lets the player see a live version of the character they're creating.
   - Prefabs Location: **Prefabs > Character Creator > Character Preview**.
   - Base folder contains the core character preview prefab which can be added to the menu as is.
   - Additional functionality can be added through addon prefabs.
   - Learn more about character previews and addon prefabs [here](xref:ccm-character-preview).
3. **Menu Controls**
   - The two core controls you need are **Back** and **Save Character** buttons
   - These can easily be setup without prefabs. Simply add a `button` and `CCMRelay` component to a game object.
   - Set the **On Click Event** of the button to run **CCMRelay.DisableMenu()** or **CCMRelay.SaveCharacter()**.
   - Prefabs also exist under **Prefabs > Character Creator > Menu Controls**.
   - Additional controls can also be setup. Learn more about Menu Controls [here](xref:ccm-menu-controls).
4. **Loading Screen**
   - A loading screen hides the menu while it's being setup.
   - Prefabs Location: **Prefabs > Character Creator > Loading Screen**
   - In the base folder contains the Loading Screen Core which only contains a black screen.
   - Additional addon prefabs are located in the `/Loading Screen Components` subfolder.
   - Addon prefabs can be added as children of the Loading Screen Core and require a reference to the **Loading Screen Handler** located in the **Loading Screen Core**.
   - Pre-setup feature complete loading screen prefabs are located in the `/Complete Loading Screens` subfolder.
   - Complete loading screens include additional features such as a loading bar/text.
   - Learn more about setting up loading screens [here](xref:ccm-loading-screens).

#### Bonus Features
1. **Character Randomization**
   - A simple **Randomize all layers button** can be setup using a `button` and the `CCM Relay component` the same way other Menu Controls are setup.
   - Controlled Randomization can be setup instead. This allows specific layers to be toggled off so only specific layers are randomized.
   - Some **Layer Selectors** have variants that contain a randomize button to randomize that specific layer.
   - Prefabs for both options are included at **Prefabs > Character Creation > Randomization**.
   - Read more about character randomization setup [here](xref:ccm-character-randomization).
2. **Character History**
   - The `CCM History Tacker` component can be added to any game object in the Character Creation Menu contents.
   - The **History Tracker** will track all changes made to the character.
   - History Prefabs are located under **Prefabs > Character Creator > History**.
   - In the `/Undo-Redo` subfolder are prefabs which include undo/redo buttons which when pressed can undo or redo changes made to the character.
   - In the `/History Panels` subfolder are prefabs which include lists that show all changes to the character. Clicking an entry in the list will revert the character.
   - Two History Panel prefabs exist.
   - The first history panel is a vertical list and is text based. Each entry contains text describing what changed.
   - The second history panel is a horizontal list and is sprite based. Every entry contains a preview of the character.
   - Read more about the **Character History System** [here](xref:ccm-history-tracking-system).
3. **Character Display Name Field**
   - A text input field can be added to let the player set a display name for their character.
   - The display name can later be optionally displayed near the character.
   - Prefabs Location: **Prefabs > Character Creator > Character Display Name Field**.