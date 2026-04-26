---
uid: ccm-tab-layer-selector
---

# Tab Layer Selector

A **Tab Layer Selector** is a button. It won't do much on its own. It must be paired with another **Layer Selector**.  
When a Tab Layer Selector is pressed it will change the assigned layer of another Layer Selector.

The Tab Layer Selector can be used as an alternative to a [bulk layer selector setup](xref:ccm-layer-selector-setup#bulk-selector-setup). Instead only requiring one Layer Selector in the menu that can be changed to control different layers using Tab Layer Selectors.

On its own, a Tab Layer Selector does not modify the character.  
Instead, it updates the **Selected Layer** in the **Character Layer Selection Manager**, which other selectors can respond to.

![Tab Layer Selector](~/images/character-creation-menu/ccm-layer-selectors/tab-layer-selector.png)

---

## How It Works

- Each tab represents a specific **character layer** (Body, Outfit, Hairstyle, etc.)
- When a tab is pressed:
  - The **Selected Layer** in the **Character Layer Selection Manager** is updated.
- A separate **Layer Selector** is setup with a handler which listens for changes and updates **the Layer Selector** to control the newly selected layer.

This allows you to:
- Use one **Layer Selector** to control **multiple layers**.
- Reduce UI clutter compared to having one selector per layer.

> [!NOTE]
> The **Tab Layer Selector** was originally designed to work with [Grid Layer Selectors](xref:ccm-grid-layer-selector) & [List Layer Selectors](xref:ccm-list-layer-selector) but can work with any **Layer Selector**.

---

## Usage

Tab Layer Selectors are setup the same way as other Layer Selectors, using the **Character Layer Selection Manager**.

Follow this guide to setup your **Tab Layer Selectors**.
[Bulk Selector Setup](xref:ccm-layer-selector-setup#bulk-selector-setup)

---

## Required Companion Setup

Tab Layer Selectors require one additional component to function properly:

`CCM Selected Tab Handler`

This component listens for changes to the **Selected Layer** and updates a target **Layer Selector**.

---

### Pre-Setup Tab Prefabs

Each Layer Selector type includes a Pre-Setup Tab folder.

These prefabs already include the `CCM Selected Layer Tab Handler` component.

#### Setup

1. Drag a prefab into your **Character Creation Menu**.
2. Assign a reference to the `CCM Character Layer Selection Manager`.

Once assigned, setup is complete.

---

## Manual Setup

Follow these steps to manually setup **Tab Layer Selectors** with its **companion Layer Selector**.

---

### Step 1️⃣ Add Tab Selectors

Use the [Pre-Setup prefabs](#pre-setup-prefabs) or follow the [Manual Setup](xref:ccm-layer-selector-setup#manual-setup) guide to setup your **Tab Layer Selectors**.

---

### Step 2️⃣ Create Handler GameObject

1. Create a new **GameObject**.
2. Add the `CCM Selected Layer Tab Handler` component.
3. Assign the **Character Layer Selection Manager** reference.

---

### Step 3️⃣ Add Target Layer Selector

1. Add any Layer Selector to your Menu (From a [Core](xref:ccm-layer-selector-setup#core-folder) folder)
2. Place it under your **handler GameObject** (recommended but not required)
3. Assign it to the **Layer Selecter** field in the handler.

This selector will dynamically change which layer it controls.

Now enter **Play Mode** and test it. When you press any of the **Tab Layer Selectors**, the handler will update the assigned layer in the **target Layer Selector**.

---

## Prefabs

**Location**: `Prefabs > Character Creator > Modules > Layer Selectors > Tab Selector`

Four visual variation folders are included.  
All variations contain identical functionality and differ only in appearance.

### Core Prefabs
- **Layer Tab Selector** – Basic tab selector (Just a button).

Not functional on its own.

---

### Pre-Setup Prefabs

- **Tab Selectors [Initialize Existing]** – Uses tab selectors already present in the prefab hierarchy.  

> [!NOTE]
> There is no **Auto Create** variant for **Tab Layer Selectors**.
>
> Tab Layer Selectors require a reference to the [Character Layer Selection Manager](xref:ccm-layer-selector-setup#how-layer-selectors-work) which must be set manually.  
> This means they **cannot** be created automatically at runtime.

---