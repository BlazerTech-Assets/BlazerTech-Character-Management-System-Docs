---
uid: ccm-menu-controls
---
[CCMRelay]: xref:BlazerTech.CharacterManagement.CharacterCreator.CCMRelay
[DisableMenu()]: xref:BlazerTech.CharacterManagement.CharacterCreator.CCMRelay#BlazerTech_CharacterManagement_CharacterCreator_CCMRelay_DisableMenu
[SaveCharacter()]: xref:BlazerTech.CharacterManagement.CharacterCreator.CCMRelay#BlazerTech_CharacterManagement_CharacterCreator_CCMRelay_SaveCharacter
[RandomizeEntireCharacter()]: xref:BlazerTech.CharacterManagement.CharacterCreator.CCMRelay#BlazerTech_CharacterManagement_CharacterCreator_CCMRelay_RandomizeEntireCharacter
[ResetCharacter()]: xref:BlazerTech.CharacterManagement.CharacterCreator.CCMRelay#BlazerTech_CharacterManagement_CharacterCreator_CCMRelay_ResetCharacter

# Character Creator Menu Controls

Menu Controls are UI buttons that provide core user actions such as saving, closing, randomizing and reseting a character.

The included prefabs can be quickly added to a **Character Creation Menu** or replaced with custom implementations using the **CCM Relay** component.

<img src="~/images/character-creation-menu/ccm-menu-controls/menu-controls-example.png" alt="Menu Controls Example" width="500" />

---

## Included Actions

Menu Controls provide the following actions:

- Close or exit the Character Creation Menu.
- Save or confirm character changes.
- Reset the character to its original state.
- Randomize the characters appearance.

---

## Prefabs

**Location**: `Prefabs > Character Creator > Modules > Menu Controls`.

Ready-made prefabs are included and can be used without any additional setup. Drag and drop them directly into your Character Creation Menu hierarchy and they're immediately ready to be used.

---

### Variants

Within the prefabs folder you'll see 4 variation folders. The only difference between variants is the sprites used.

**Available prefabs**:

1. Menu Controls [Back, Save, Randomize, Reset]
2. Menu Controls [Back, Save, Randomize]
3. Menu Controls [Back, Save]

The brackets dictate what actions are included in the prefab.

---

### Generic Buttons

Inside the same prefabs directory, the **Generic Buttons** folder contains individual button prefabs with no default assigned functionality.

Each prefab includes:

- A Unity **Button** component
- A **CCM Relay** component

When using the generic button prefabs, add an **On Click** event to the button and assign the **CCM Relay** component. You can then call different methods on the **CCM Relay** component to perform actions such as saving changes or exiting the menu.

---

## CCM Relay Component

The **CCM Relay** (Character Creation Menu Relay) component acts as a bridge between the UI and the Character Creation Menu system.

It forwards button events to the **active Character Creation Menu Manager instance**, making it easy to setup simple functionality without writing any code.

### Usage

To create a custom button using the **CCM Relay**:

1. Add the `CCM Relay` component to a GameObject
2. Add the Unity `Button` component
3. Assign the Buttons **On Click** event to call a method on the **CCM Relay** component

### Example
![CCM Relay Usage Example](~/images/character-creation-menu/ccm-menu-controls/ccm-relay-usage-example.png)

---

## CCM Relay Methods

The following public methods are available on the **CCM Relay** component:

---

### DisableMenu()

Closes the disables the **Character Creation Menu**.

---

### SaveCharacter()

Saves changes made to the currently edited character.

---

### RandomizeEntireCharacter()

Randomizes all character layers of the character currently being edited.

---

### ResetCharacter()

Restores the character to the state it was in when the **Character Creation Menu** was first opened.

---

## CCM Save Character Button Component

The **CCM Save Character Button** component provides a ready-to-use save button for your Character Creation Menu. It automatically handles saving the current character and manages its interactable state based on whether there are unsaved changes.

### Setup
1. Create a new **GameObject**.
2. Add an **Image** component.
3. Add the **CCM Save Character Button** component. 
   - The component inherits from Unity's `Button` component, so it provides all of the same properties and functionality.
4. Assign the **Target Graphic** and configure the button's **Transition** settings as you would with any other Unity button.

### Behavior

- `Disable When No Changes` - When enabled, the button is automatically disabled if no changes have been made to the character since it was last saved.
- An **On Click** event is **not required**. When clicked, the button automatically saves the current character.
- You can still add **On Click** event actions if you want the button to perform additional actions after saving. For example, you could use an On Click event that calls the [DisableMenu](#disablemenu) method on a **CCM Relay** to close the Character Creation Menu after the character has been saved.
