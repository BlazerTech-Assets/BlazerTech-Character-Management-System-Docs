---
uid: ccm-character-randomization
---

# Character Randomization

The character in the Character Creation Menu can be completely randomized by randomizing every layer or randomize only specific layers. 

---

## Complete Character Randomization

The simplest option. A button which when pressed will randomize all layers of the character.

![Complete Randomization Button](~/images/character-creation-menu/ccm-character-randomization/complete-randomization-button.png)

### Prefabs

location: `Prefabs > Character Creator > Modules > Randomization Controls`.

Within are multiple variation folders, each folder contains the same prefabs with the only difference being the sprites used.

**Setup Steps**:  
1. Pick a variation folder.
2. Locate the **Randomize Character Button** prefab.
3. Drag and drop the prefab into the contents of your Character Creation Menu.

When you enter **Play Mode** and click the button, all layers of your character will be randomized.

### Manual Setup

Setting up a complete randomization button yourself is extremely simple:

1. Create a new **GameObject**.
2. Add the `Button` component.
3. Add the `CCM Relay` component.
   - Read more → [CCM Relay component](xref:ccm-menu-controls#ccm-relay-component).
4. Add an `On Click` event on the `Button` and assign the `CCM Relay` component.
5. Select the `RandomizeEntireCharacter` method on the `CCM Relay` component.
6. Enter **Play Mode** and test your button. When pressed, all layers of your character should be randomized.

![Complete Randomization Button Setup](~/images/character-creation-menu/ccm-character-randomization/complete-randomization-button-setup.png)

---

## Controlled Randomization
**Controlled Randomization buttons** contain additional options to define what layers of the character are randomized.

An additional **Options** button is included which when clicked opens a popup containing all layers of the character, each one with a toggle next to it.  

When the **Randomize** button is pressed, only the selected layers are randomized.

<img src="~/images/character-creation-menu/ccm-character-randomization/controlled-randomization.png" alt="Controlled Randomization" width="400" />  

---

### Prefabs

location: `Prefabs > Character Creator > Modules > Randomization Controls`.

Within are multiple variation folders, each folder contains the same prefabs with the only difference being the sprites used.

**Setup Steps**:  
1. Pick a variation folder.
2. Open the **Controlled Randomization** Subfolder.
3. Drag and drop the **Controlled Randomization** prefab into the contents of your Character Creation Menu.
4. Enter **Play Mode** and test your new randomization controls.

#### Layer Toggle Prefabs

Alongisde the **Controlled Randomization** Prefab is the **Layer Toggle** prefab.  
This is the prefab used for toggles in the Randomization Options popup.

This prefab uses the `CCM Layer Randomize Toggle` component. It lives on the same GameObject as the `Toggle` component.  
The Toggles on Value Changed event is set to call the **CCM Layer Randomize Toggles** `UpdateRandomizationToggle()` method.  
The `CCM Layer Randomize Toggle` requires a reference to a text component which will be used to set the name of the layer.

---

### Manual Setup

A **step-by-step** walkthrough to create your own **Controlled Randomization** prefab.

#### GameObject Creation

**We're going to create three GameObjects**:

- GameObject #1: Name it **Controlled Randomization**. This is the parent GameObject.
- GameObject #2: Name it **Buttons**. This will hold the **Randomize** and **Options** buttons.
- GameObject #3 name it **Randomization Options Popup**. This is the popup that appears when the Options button is clicked.

#### Handler Component Setup

1. Add the `CCM Controlled Randomization Handler` component to the **Controlled Randomization** GameObject.
2. Assign the **Randomization Options Popup** to the field of the same name.
3. Assign the **Layer Randomize Toggle Prefab**. You can use the pre-created prefab or create your own.

#### Buttons Setup

1. Create two new **GameObjects** as children of the **Buttons** GameObject we previously created.
2. Name the first GameObject **Options Button**.
3. Name the second GameObject **Randomize Layers Button**.
4. Add the `Button` component to both.
5. Add an `On click` event to the Options Button and reference the `CCM Controlled Randomization Handler` component.
6. Have the event call the `ToggleRandomizationOptionsUI()` method.
7. Add an `On Click` event to the **Randomize Layers Button** and again reference the `CCM Controlled Randomization Handler` component.
8. Have the event call the `RandomizeCharacter()` method.

#### Randomization Options Popup

The **Randomization Options Popup** GameObject should have some sort of grouping component to space out the toggles.  
This will usually be a **Horizontal**, **Vertical** or **Grid Layout Group**.  

A `Content Size Fitter` component can also be used to automatically expand the parent GameObject to the size the toggles take up. This is useful for a background to automatically adjust its size as toggles are added or removed.

Optionally toggles can be added here in the editor, if not enough toggles are present, more will be added by the `CCM Controlled Rndomization Handler` component at runtime. If too many are present, excess will be disabled.

The Randomization Options Popup GameObject can be enabled or disabled in the editor. Its state will be automatically managed during runtime.

---

## Single Layer Randomization
Some Layer Selectors include a variant that contains a randomize button that when pressed will randomize only that layer of the character.

<img src="~/images/character-creation-menu/ccm-character-randomization/single-layer-randomization-examples.png" alt="Single Layer Randomization Examples" width="400" />  

### Adding Missing Randomization Buttons
If a Layer Selector does **not** include a variant with a randomize button, one can be added easily:
1. Create a new **GameObject**.
2. Add the `Button` component.
3. Add an `On CLick` event on the Button.
4. Assign the **Layer Selector** Component to the event and select the [CharacterLayerSelector.RandomizeLayer()](xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterLayerSelector#BlazerTech_CharacterManagement_CharacterCreator_CharacterLayerSelector_RandomizeLayer) method.