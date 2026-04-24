---
uid: ccm-layer-selector-setup
---

# Layer Selector Setup

A **Layer Selector** is any UI element that lets the player change a specific **layer** of a [Layered Character](xref:layered-character-type). 

---

## Character Layer Selection Manager

A **Layer Selector** cannot function on its own.  
The most common way to use Layer Selectors is through the  
[`CCMCharacterLayerSelectionManager`](xref:BlazerTech.CharacterManagement.CharacterCreator.CCMCharacterLayerSelectionManager) component.

This manager is responsible for connecting UI Layer Selectors to the  
[Character Creation Menu](xref:character-creator-overview).

### Initialization Modes

The **Character Layer Selection Manager** supports two initialization modes:

#### 1. Auto Create
- At runtime, the manager will **instantiate new layer selectors** for each character layer.  
- Requires assigning a **Character Layer Selector Prefab**.  
- Each layer selector instance is linked automatically to a layer.  

#### 2. Initialize Existing
- Use **pre-existing layer selectors** already placed in the scene.  
- Each selector is initialized with a character layer at runtime.  
- Extra selectors (more than the number of layers) can optionally be **hidden** or **disabled**.  

### Layer Selector Parent

Regardless of the initialization mode, a **Layer Selector Parent** is required:

- This should be the **parent GameObject** that contains all layer selectors.  
- In **Initialize Existing** mode, place all pre-made layer selectors as children of this parent.  
- In **Create New** mode, new selectors will be instantiated as children of this parent.  

---

## Layer Selector Prefabs

> [!TIP]
> All Layer Selector prefabs can be found under:  
> **BlazerTech Character Management System > Prefabs > Character Creator > Layer Selectors**  .
> Subfolders exist for each individual **Layer Selector**.

Each Layer Selector exists as a prefab and is organized into its own folder with the following structure:

- **Base Folder**  
  Contains the core Layer Selector prefab and any variant prefabs.  

- **Pre-Setup Folder**  
  Contains prefabs that already include a configured
[Character Layer Selection Manager](#character-layer-selection-manager).  
  Two versions are provided:  
  1. **Auto Create** – Instantiates Layer Selectors at runtime.  
  2. **Initialize Existing** – Uses Layer Selectors already present in the prefab hierarchy.  

This makes it easy to either drop in a ready-to-use prefab or build a custom setup.

---

## Character Layer Selection Manager Setup
If you want to setup a **Character Layer Selection Manager** yourself without using a prefab follow these steps:
1. Add the `CCMCharacterLayerSelectionManager` component to your UI object.  
2. Assign the **Layer Selector Parent**.  
3. Choose an **Initialization Mode**:  
   - *Create New* → Provide a `Character Layer Selector Prefab`.  
   - *Initialize Existing* → Place selectors as children under the parent.  
4. Run the scene, selectors will now control the layers of the active character.  
