---
uid: temp
---

# Character Randomization

The **Character Creation Menu** supports multiple ways to randomize a character’s appearance.  
You can randomize:

- The **entire character**
- **Specific layers only**
- A **single layer**

---

## Complete Character Randomization

This is the simplest form of randomization.  
A single button randomizes **all layers** of the character at once.

![Complete Randomization Button](~/images/character-creation-menu/ccm-character-randomization/complete-randomization-button.png)

---

### Prefabs

**Location:**  
`Prefabs > Character Creator > Modules > Randomization Controls`

Each variation folder contains identical prefabs with different visual styles.

**Setup Steps:**
1. Choose a variation folder
2. Locate **Randomize Character Button**
3. Drag it into your Character Creation Menu

When the button is pressed in **Play Mode**, all character layers are randomized.

---

### Manual Setup

To create a complete randomization button:

1. Create a new **GameObject**
2. Add a `Button` component
3. Add the `CCM Relay` component  
   - See: [CCM Relay component](xref:ccm-menu-controls#ccm-relay-component)
4. Add an **On Click** event to the `Button`
5. Assign the `CCM Relay` component
6. Select the `RandomizeEntireCharacter()` method
7. Enter **Play Mode** and test

![Complete Randomization Button Setup](~/images/character-creation-menu/ccm-character-randomization/complete-randomization-button-setup.png)

---

## Controlled Randomization

**Controlled Randomization** allows selective randomization of layers.

It consists of:
- A **Randomize** button
- An **Options** button

The **Options** button opens a popup listing all layers with toggles.  
Only enabled layers are randomized when the Randomize button is pressed.

<img src="~/images/character-creation-menu/ccm-character-randomization/controlled-randomization.png" alt="Controlled Randomization" width="400" />

---

### Prefabs

**Location:**  
`Prefabs > Character Creator > Modules > Randomization Controls`

**Setup Steps:**
1. Choose a variation folder
2. Open the **Controlled Randomization** subfolder
3. Drag the **Controlled Randomization** prefab into your menu
4. Enter **Play Mode** to test

---

### Layer Toggle Prefab

The **Layer Toggle** prefab is used inside the options popup.

**Key details:**
- Uses the `CCM Layer Randomize Toggle` component
- Shares a GameObject with a `Toggle` component
- Calls `UpdateRandomizationToggle()` on value change
- Requires a text reference to display the layer name

---

### Manual Setup

Create a custom **Controlled Randomization** system:

---

#### GameObject Structure

Create three GameObjects:

- **Controlled Randomization** (root)
- **Buttons** (container for controls)
- **Randomization Options Popup** (toggle list UI)

---

#### Handler Setup

1. Add `CCM Controlled Randomization Handler` to the root
2. Assign:
   - **Randomization Options Popup**
   - **Layer Randomize Toggle Prefab**

---

#### Buttons Setup

1. Create two child objects under **Buttons**:
   - **Options Button**
   - **Randomize Layers Button**

2. Add `Button` components to both

3. Configure events:
   - **Options Button**
     - Calls `ToggleRandomizationOptionsUI()`
   - **Randomize Layers Button**
     - Calls `RandomizeCharacter()`

---

#### Options Popup Setup

The popup should include a layout system:

- **Vertical Layout Group**
- **Horizontal Layout Group**
- **Grid Layout Group**

Optional:
- Add a `Content Size Fitter` to auto-resize the container

**Behavior:**
- If too few toggles exist → more are created at runtime  
- If too many exist → extras are disabled  
- Visibility is automatically managed at runtime

---

## Single Layer Randomization

Some **Layer Selectors** include a built-in randomize button that affects only that layer.

<img src="~/images/character-creation-menu/ccm-character-randomization/single-layer-randomization-examples.png" alt="Single Layer Randomization Examples" width="400" />

---

### Adding a Randomize Button to a Layer

If a selector does not include one:

1. Create a new **GameObject**
2. Add a `Button` component
3. Add an **On Click** event
4. Assign the **Layer Selector** component
5. Call:
   [CharacterLayerSelector.RandomizeLayer()](xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterLayerSelector#BlazerTech_CharacterManagement_CharacterCreator_CharacterLayerSelector_RandomizeLayer)

This will randomize only the associated layer.