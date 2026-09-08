# Character Group Editor

The **Character Group Editor** is a menu component for viewing and managing characters stored in a [Character Group](xref:character-groups).

It supports both **Fixed** and **Flexible Character Groups**, allowing the same menu system to be used for predefined character rosters or dynamically managed character lists.



---

## Overview

When the menu is enabled, the **Character Group Editor** checks the [Character Grouping System](xref:character-grouping-system) for a group matching the configured **Group Name**, **Layered Character Type**, and **List Type**.

- If a matching group already exists, it is loaded.
- If a matching group does not exist, a new group is created.
- Fixed groups are created with the configured group size.
- Flexible groups are created with an empty character list.

> [!NOTE]
> A Fixed and Flexible Character Group can have the **same name**. The group type is also used when finding the group, so these are treated as separate groups.

### Fixed Character Groups

Fixed Character Groups have a predetermined number of character slots.

When the group is created, all characters are created automatically based on the **Fixed Group Size** configured in the inspector.

The group size must be specified when using a Fixed Character Group.

### Flexible Character Groups

Flexible Character Groups do not have a predetermined size.

When the group is created, it starts with an empty character list. Players can add new characters to the group or remove existing characters, depending on the configured permissions.

---

# Setup

The Character Group Editor requires the following configuration:

1. A **Layered Character Type**
2. A **List Type**
3. A **Group Name**
4. An **Entry Click Action**
5. The required prefab and hierarchy references

## 1. Layered Character Type

Assign the **Layered Character Type** that should be used by the Character Group.

The Character Group Editor is designed specifically for Layered Characters, allowing each character in the group to be displayed and edited using the configured Layered Character Type.

---

## 2. List Type

The **List Type** determines which type of Character Group is used.

| List Type | Description |
|-----------|-------------|
| **Flexible** | Characters can be added to and removed from the group. |
| **Fixed** | The group has a predetermined number of characters. |

> [!NOTE]
> The inspector uses the spelling `Flexibe` for this enum internally. The intended list type is **Flexible**.

### Fixed Group Size

When **Fixed** is selected, the **Fixed Group Size** field becomes available.

This determines how many characters are created when the Fixed Character Group is first created.

For example, setting the group size to `5` creates a group containing five characters.

---

## 3. Group Name

The **Group Name** is used to find or create the Character Group.

When the Character Group Editor initializes, it searches for a group matching both the configured **Group Name** and **List Type**.

This means the following can coexist:

- Flexible group named `Player Characters`
- Fixed group named `Player Characters`

These are treated as separate groups because they have different group types.

---

# 4. Entry Click Action

The **Entry Click Action** determines what happens when a character entry is clicked.

| Action | Description |
|--------|-------------|
| **None** | Disables interaction with character entries. |
| **Edit** | Opens the Character Creation Menu to edit the selected character. |
| **Custom Action** | Allows custom events to be assigned through a UnityEvent. |

### None

Selecting **None** prevents character entries from being interacted with.

This can be useful when the Character Group Editor is being used purely to display a list of characters.

### Edit

**Edit** is the default action.

When a character is selected, the Character Group Editor attempts to open the Character Creation Menu and load the selected character for editing.

An enabled instance of the Character Creation Menu must exist in the scene for this to work.

### Custom Action

**Custom Action** allows developers to define their own behavior using a `UnityEvent<LayeredCharacter>`.

The selected character is passed to the event, allowing custom scripts and methods to respond to the selected character.

For example, a custom action could be used to:

- Select a character as the active player character.
- Display additional information.
- Open another menu.
- Perform custom game logic.

#### Editing With Additional Actions

If the desired behavior is to edit the character **and** perform additional actions, the `CharacterGroupEditor.EditCharacter` method can be used as the first event.

For example:

1. `CharacterGroupEditor.EditCharacter`
2. Custom method to perform additional logic
3. Another custom method

This allows the standard Character Creation Menu editing behavior to be retained while also performing additional actions.

---

# 5. Assign References

The required references depend on the selected **List Type**.

### Fixed Groups

Fixed Character Groups require:

- **List Entry Prefab**
- **List Parent**

### Flexible Groups

Flexible Character Groups require:

- **List Entry Prefab**
- **List New Character Entry Prefab**
- **List Parent**

The **List New Character Entry Prefab** is used as the first item in the list. When selected, it opens the Character Creation Menu with a new character.

After the character is saved, the new character is added to the Flexible Character Group.

---

# Character List Entry Prefabs

Character list entry prefabs are located under:

`Prefabs > Character Creator > Character Group Editor > Character List Entries`

The available prefabs are divided into four folders.

## New Character Entry

Contains the entries used for creating a new character in a Flexible Character Group.

### New Character Entry [Sprite]

Displays:

- A character skeleton sprite
- **New Character** text

### New Character Entry [Text]

Displays only:

- **New Character** text

This version is intended for text-only character lists.

---

## Sprite And Text Based

Contains the `Character Entry` prefab.

This entry displays both:

- The character sprite
- The character's name

---

## Sprite Based

Contains the `Character Entry` prefab.

This entry displays only the character sprite.

---

## Text Based

Contains the `Character Entry` prefab.

This entry displays only the character's name.

---

# Character List Entry Components

Every standard character entry uses the **LayeredCharacterListEntry** component.

The component supports three display modes:

| Display Type | Contents |
|---------------|----------|
| **Text** | Character name |
| **Sprite** | Character sprite |
| **Text And Sprite** | Character sprite and name |

When a character uses multiple visual layers, the component creates the required number of `Image` components and displays each character layer using its preview sprite. Character layer resources are loaded when needed and released when the entry is disabled.

Each entry also contains a button used to select the character and can optionally contain a remove button.

The remove button is only enabled for Flexible Character Groups when **Remove Characters Permission** is enabled.

---

# Creating New Characters

Flexible Character Groups can optionally allow players to create new characters.

The **Create New Characters Permission** setting controls whether the **New Character** entry is added to the list.

When enabled, the New Character entry is placed at the beginning of the list.

Selecting it opens the Character Creation Menu in **New Character** mode and associates the new character with the Flexible Character Group.

The new character is then added to the group when it is saved.

> [!NOTE]
> The New Character Entry is only used by Flexible Character Groups. Fixed Character Groups cannot add new characters because their size is predetermined.

---

# Removing Characters

Flexible Character Groups can optionally allow characters to be removed.

Enable **Remove Characters Permission** to display the remove button on character entries.

When a character is removed, the Character Group Editor refreshes its list to reflect the updated group contents.

Characters cannot be removed from Fixed Character Groups.

---

# Menu Hierarchy

A typical Character Group Editor uses the following GameObject structure:

```text
Character Group Editor
├── Contents
└── Loading Screen
```

## Character Group Editor

The root GameObject contains the **Character Group Editor** component.

## Contents

The **Contents** GameObject contains the actual menu interface.

Its contents are completely customizable. A typical implementation might contain:

```text
Contents
├── Background
├── Title
├── Back Button
└── Scroll View
    └── Content
        ├── Character Entry
        ├── Character Entry
        ├── Character Entry
        └── ...
```

The important requirement is that there is a GameObject that acts as the **List Parent**.

The Character Group Editor instantiates character entries as children of this transform. Each entry represents a character in the Character Group.

A custom list implementation can be used instead of a `ScrollView`, provided an appropriate GameObject is available to act as the List Parent.

---

# Content Size Fitter

A **Content Size Fitter** with **Vertical Fit** set to **Min Size** is recommended for the GameObject acting as the list's content container.

This allows the content container to automatically adjust its height based on the number and size of its child entries.

This is particularly useful when using a `ScrollView`. As characters are added or removed from a Flexible Character Group, the number of entries changes. Allowing the content container to resize automatically ensures the ScrollView's content area continues to match the actual size of the list.

For example:

```text
Scroll View
└── Viewport
    └── Content
        ├── Content Size Fitter
        ├── Character Entry
        ├── Character Entry
        └── Character Entry
```

For a vertical list, set:

**Content Size Fitter → Vertical Fit → Min Size**

The exact layout configuration can vary depending on whether the list uses a `VerticalLayoutGroup`, `GridLayoutGroup`, or another custom layout system.

---

# Loading Screens

Loading screens for the Character Group Editor are located under:

`Prefabs > Character Creator > Character Group Editor > Loading Screens`

Four loading screen prefabs are provided, each using a different background.

These loading screens function similarly to the loading screens provided for the Character Creation Menu.

The main difference is that Character Group Editor loading screens require an explicit reference to the **Character Group Editor** component.

Assign the Character Group Editor component to the appropriate field on the loading screen prefab.

A typical hierarchy is:

```text
Character Group Editor
├── Contents
└── Loading Screen
```

The loading screen can then be enabled while character entries are being prepared.

The Character Group Editor provides loading progress through its `OnMenuLoadingProgressUpdated` event and signals when setup has completed through `OnMenuEnabledAndSetup`.

---

# Premade Character Group Editors

Complete Character Group Editor prefabs are available under:

`Prefabs > Character Creator > Character Group Editor > Premade Character Group Editors`

Two folders are provided:

- **Fixed**
- **Flexible**

Each folder contains two premade menu implementations:

| Layout | Description |
|--------|-------------|
| **Text Vertical List** | Displays characters in a vertical text-based list. |
| **Sprite Grid** | Displays characters in a grid using a `GridLayoutGroup`. |

These prefabs provide ready-to-use examples of how the Character Group Editor can be configured and can also be used as a starting point for creating a custom implementation.

---

# Example Configurations

## Fixed Character Roster

A Fixed Character Group can be used for a predefined roster of characters.

Example configuration:

| Setting | Value |
|---------|-------|
| Layered Character Type | `Human` |
| List Type | `Fixed` |
| Group Name | `Available Characters` |
| Fixed Group Size | `10` |
| Entry Click Action | `Edit` |
| List Entry Prefab | Sprite Based `Character Entry` |
| List Parent | Scroll View Content |

When the editor is opened, the `Available Characters` Fixed Character Group is loaded or created with ten characters.

---

## Flexible Character Roster

A Flexible Character Group can be used for characters created by the player.

Example configuration:

| Setting | Value |
|---------|-------|
| Layered Character Type | `Human` |
| List Type | `Flexible` |
| Group Name | `My Characters` |
| Create New Characters Permission | Enabled |
| Remove Characters Permission | Enabled |
| Entry Click Action | `Edit` |
| List Entry Prefab | Sprite And Text Based `Character Entry` |
| List New Character Entry Prefab | New Character Entry [Sprite] |
| List Parent | Scroll View Content |

When opened, the editor creates or loads the `My Characters` group.

If the group does not contain any characters, the list will initially contain only the **New Character** entry. The player can select it to create a character, and can later edit or remove characters from the group.