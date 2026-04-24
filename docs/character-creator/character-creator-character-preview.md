---
uid: ccm-character-preview
---

# Character Preview

A **character preview** shows a live view of the character in the **Character Creation Menu**.  

Whenever a layer of the character is modified, the preview is updated automatically.

---

## Character Preview Controller

An Animator Controller is required for the Character Preview if using a **Preview Mode** of **Animated**.  
This controller has some specific requirements.

[Read More → Character Preview Controller](xref:ccm-character-preview-controller)  

---

## Character Preview Setup

- For the easiest implementation use the [Pre-Setup prefabs](#pre-setup-prefabs). They require no setup after being added to your Character Creation Menu.
- If you prefer to design your own Character Preview from scratch skip to the [Manual Setup](#manual-setup) section.

Regardless how you implemented your **Character Preview**, we've still got a few settings which need to be adjusted.

---

### Preview Mode

The Character Preview can be displayed in two ways:

| Mode         | Description                                          |
| ------------ | ---------------------------------------------------- |
| **Static**   | Displays a single sprite                             |
| **Animated** | Uses an Animator Controller to animate the character |

---

#### Static

The simplest option. Inside the **Character Creator Settings** section of your **Layerd Character Type** is the `Preview Sprite` field. The sprite assigned in that field will be used by the Character Preview Module at runtime.

---

#### Animated

Requires an **Animator Controller** specifcally setup to animate UI.  
The Animator Controller is assigned in the Layerd Character Type.  

[Read More → Character Preview Controller](xref:ccm-character-preview-controller)  

---

## Prefabs

Prefabs offer easy implementation of character previews without the need to set them up yourself.

**Location**: `Prefabs > Character Creator > Modules > Character Preview`.

---

### Pre-Setup Prefabs

Located under the **Pre-Setup** subfolder.

Three pre-setup prefabs are provided. Drag and drop them into your Character Creation Menu and they're ready, no other setup is required.

The included prefabs are as follows:

- **Character Preview** - Shows an animated preview of the character with no other controls.
- **Character Preview [+Rotation Controls]** - Includes buttons on the left and right to rotate the character.
- **Character Preview [+Rotation Controls, Anim Buttons]** - Includes rotation controls and buttons at the bottom to switch the animation the character is playing.

<img src="~/images/character-creation-menu/ccm-character-preview/character-previews-example.png" alt="Character Previews Example" width="700" />

---

### Animation Controls Prefabs

Located under the **Animation Conrols** subfolder.

The same animation buttons that are included in the **third Pre-Setup prefab** are also provided separately here.

Four variations are provided, each in their own folder.  
Variations only contain different sprites but do not change any functionality.  
Within each variation folder are two prefabs:
1. **Animation Button** - A single animation button, not functional on its own.
2. **Animation Controls [Initialize Existing]** - A collection of Animation Buttons setup with the `CCM Animation Switcher` component.

The second prefab (Animation Controls) can be connected to a **Character Preview** by referencing the `Character Preview Handler` inside the `CCM Animation Switcher`. Once connected, the **Animation Controls** will be automatically initialized and functional during runtime.

---

## Manual Setup

Want to create a **Character Preview** from scratch? Here's how to do that.

---

### Step 1

Create a new GameObject within the **Character Creation Menu contents** and add the **CCM Character Preview Handler** component. This is the component responsible for initializing and updating your character preview.

![Character Preview Handler Component](~/images/character-creation-menu/ccm-character-preview/character-preview-handler-component.png)

---

### Step 2

Select the **Preview Mode**.

The **Preview Mode** determines how the character preview is displayed.

1. **Static**
   - Uses the **Character Preview Sprite** assigned in the **Character Creator Settings** section of the **Layered Character Type**.
2. **Animated**
   - Uses the **Character Preview Controller** assigned in the **Character Creator Settings** section of the **Layered Character Type** to animate the character preview.

If **Animated** is selected, assign the **Character Animator**, this is the **Animator component** the **Animator Controller** will be assigned to.

---

### Step 3

Assign the **Character Image**. This is the Image component that the [Character Shader](xref:basic-concepts#the-character-shader) will be applied to.

Now once you enter **Play Mode**, you'll see the character displayed in the preview you just created.

---

### Adding Rotation Controls

To add buttons to rotate the character preview with, follow these steps:

1. Create a new **GameObject**.
2. Add the Unity `Button` component.
3. Assign the Buttons **On Click** event to the `CCMCharacterPreviewHandler` component and call the `RotateCharacterPreview()` method.
4. The `RotateCharacterPreview()` requires a bool, disabled = rotate left, enabled = rotate right.

Follow these steps twice to create two buttons, one for rotating left, the other for rotating right.

---

### Adding Animation Controls

Animation Controls are buttons for switching the animation the **Character Preview** is playing.

> [!NOTE]
> Animation Controls can only be used if the Character Preview has a **Preview Mode** of **Animated**.

1. Create a new **GameObject**.
2. Add the `CCM Animation Switcher` component to the GameObject
3. Set **Animation Button Parent**. This is the parent GameObject for your Animation Buttons (Can be the same GameObject)
4. Set the Initialization Mode.
   - Initialize Existing: Will find pre-created animation buttons within the Animation Button Parent
   - Auto Create: Will instantiate new Animation Buttons as children of the Animation Button Parent. Uses the Aniamtion Button Prefab you assign.
5. Assign `Character Preview Handler` reference. This is used to change the currently playing animation on the Character Preview.

<!-- ## Character Preview Animation Buttons

![Character Preview Animation Buttons](~/images/ccm-character-preview/character-preview-animation-buttons.png)

Located in the **/Animation Control** subfolder are prefabs for switching between character animations.  
Three prefabs exist:
1. **Animation Buttons [Auto Create]**
   - automatically creates a button for each animation in the assigned Character Type at runtime.
2. **Animation Buttons [Initialize Existing]**
   - Uses animation buttons already in the prefab hierarchy.
   - Logs a warning if not enough buttons exist.
   - Can optionally disable or hide unused buttons.
3. **Animation Button**
   - Prefab used by the other two prefabs. Cannot be used on it's own.

--- -->