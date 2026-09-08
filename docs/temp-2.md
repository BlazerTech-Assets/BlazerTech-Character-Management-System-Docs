---
uid: character-group-editor
---

# Character Group Editor

The **Character Group Editor** is a menu component for viewing and managing characters stored in a [Character Group](xref:character-grouping-system).

It provides a ready-to-use interface for displaying the characters in a group and, when configured as a **Flexible** group, allows players to create and remove characters from the group.

The editor supports both **Fixed** and **Flexible** Character Groups. The type of group is determined by the **List Type** assigned in the `CharacterGroupEditor` component.

> [!NOTE]
> The **Character Group Editor** is designed for **Layered Characters** and requires a [Layered Character Type](xref:layered-character-type).

## How It Works

When a Character Group Editor is enabled, it checks the [Character Grouping System](xref:character-grouping-system) for a group matching its configured **Group Name** and **List Type**.

If a matching group already exists, that group is loaded.

If no matching group exists, a new group is created automatically.

This allows a Character Group Editor to be placed in a scene without manually creating the group beforehand.

### Group Identification

A group is identified using both its **Group Name** and **List Type**.

This means a Fixed group and a Flexible group can have the same name without conflicting with each other.

For example:

| Group Name   | List Type | Result                       |
| ------------ | --------- | ---------------------------- |
| `Characters` | Fixed     | One Fixed Character Group    |
| `Characters` | Flexible  | One Flexible Character Group |

### Fixed Groups

When the editor is configured to use a **Fixed** List Type, the **Fixed Group Size** must be specified in the Inspector.

When the group is created, all characters required by the group are created immediately.

The editor then creates a list entry for each character in the group.

### Flexible Groups

When the editor is configured to use a **Flexible** List Type, the group initially contains no characters.

Players can add new characters to the group through the **New Character** entry and, when permitted, remove existing characters from the list.

The **Create New Characters Permission** and **Remove Characters Permission** settings can be used to control these actions.

> [!TIP]
> Flexible groups are useful for menus where the player can maintain a dynamic collection of characters, such as a roster, party, or collection of customizable NPCs.

---

# Setup

Add the `CharacterGroupEditor` component to a GameObject in your Character Group Editor menu.

The following settings are required or available in the Inspector.

## List Settings

| Property                   | Description                                                                               |
| -------------------------- | ----------------------------------------------------------------------------------------- |
| **Layered Character Type** | The [Layered Character Type](xref:layered-character-type) used by the Character Group.    |
| **List Type**              | Determines whether the editor uses a Fixed or Flexible Character Group.                   |
| **Group Name**             | The name used to find an existing Character Group or create a new one.                    |
| **Fixed Group Size**       | The number of characters in a Fixed group. Only shown when **List Type** is set to Fixed. |

### Layered Character Type

Assign the **Layered Character Type** that the characters in the group should use.

This determines the available character layers and options when creating or editing characters.

### List Type

Select the type of Character Group the editor should use:

- **Flexible** - Characters can be added and removed from the group.
- **Fixed** - The group contains a fixed number of characters.

> [!NOTE]
> The Character Group Editor does not convert between Fixed and Flexible groups. The selected List Type is part of how the editor identifies the Character Group.

### Group Name

The **Group Name** is used to find or create the Character Group.

If a group with the same name and type already exists, the existing group is loaded. Otherwise, a new group is created.

A Fixed and Flexible group can have the same Group Name because the group type is also used when finding the group.

### Fixed Group Size

When using a **Fixed** List Type, specify the number of characters the group should contain.

This setting is only available for Fixed groups.

---

# Permissions

Flexible Character Groups provide two optional permissions.

| Property                             | Description                                                          |
| ------------------------------------ | -------------------------------------------------------------------- |
| **Create New Characters Permission** | Determines whether the New Character entry is added to the list.     |
| **Remove Characters Permission**     | Determines whether existing characters can be removed from the list. |

These settings are only available for Flexible Character Groups.

Disabling **Create New Characters Permission** prevents the New Character entry from being displayed.

Disabling **Remove Characters Permission** prevents the remove button on character list entries from being displayed.

---

# Entry Click Action

The **Entry Click Action** determines what happens when a character in the list is selected.

| Action            | Description                                                       |
| ----------------- | ----------------------------------------------------------------- |
| **None**          | Disables interaction with the character entry.                    |
| **Edit**          | Opens the Character Creation Menu to edit the selected character. |
| **Custom Action** | Invokes a UnityEvent assigned by the developer.                   |

By default, **Edit** is selected.

### Edit

When **Edit** is selected, clicking a character calls the Character Creation Menu Manager to open the Character Creation Menu for the selected character.

An instance of the Character Creation Menu must be enabled in the scene for this to work.

### None

Selecting **None** disables interaction with character entries.

The entries remain visible, but selecting a character does not perform an action.

### Custom Action

**Custom Action** allows custom events to be assigned using a UnityEvent.

The selected `LayeredCharacter` is passed to the event, allowing the character to be used by custom methods.

For example, a developer could use the event to open a custom character information screen, select a character for gameplay, or perform another custom action.

If the developer wants to perform additional actions **after opening the Character Creation Menu**, the first event can be set to:

`CharacterGroupEditor.EditCharacter`

Additional events can then be placed after it.

---

# References

The **References** section contains the prefabs and Transform required to build the character list.

| Reference                           | Description                                                       |
| ----------------------------------- | ----------------------------------------------------------------- |
| **List Entry Prefab**               | Prefab used for each character in the list.                       |
| **List New Character Entry Prefab** | Prefab used for the New Character entry in Flexible groups.       |
| **List Parent**                     | Transform that acts as the parent for all character list entries. |

A **List New Character Entry Prefab** is only required when using a Flexible Character Group.

> [!IMPORTANT]
> The List Parent should contain only the list entries used by the Character Group Editor. Any existing children that do not contain a `LayeredCharacterListEntry` component are removed when the editor initializes.

---

# Prefabs

Several ready-to-use prefabs are included with the Character Management System.

All Character Group Editor prefabs can be found under:

`Prefabs > Character Creator > Character Group Editor`

## Character List Entries

Character list entry prefabs are located under:

`Prefabs > Character Creator > Character Group Editor > Character List Entries`

Four folders are provided.

### New Character Entry

Contains the prefabs used for the first entry in a Flexible Character Group.

Two variants are included:

- **New Character Entry [Sprite]** - Displays a character skeleton sprite and text saying **New Character**.
- **New Character Entry [Text]** - Displays only the text **New Character**.

The text-only version is intended for text-based character lists.

The New Character Entry is instantiated as the first item in the list. Selecting it opens the Character Creation Menu and creates a new character. When the character is saved, it is added to the Flexible Character Group.

### Sprite And Text Based

Contains:

`Character Entry`

This entry displays both:

- A preview of the character.
- The character's name.

This is useful for lists where both visual identification and character names are desired.

### Sprite Based

Contains:

`Character Entry`

This entry displays only a preview of the character.

This is useful for character grids where the appearance of each character provides enough information to identify them.

### Text Based

Contains:

`Character Entry`

This entry displays only the character's name.

This is useful for compact lists where character previews are not required.

---

## LayeredCharacterListEntry

The `LayeredCharacterListEntry` component is used by character list entries.

It supports three display modes:

| Display Type        | Contents                             |
| ------------------- | ------------------------------------ |
| **Text**            | Character name                       |
| **Sprite**          | Character preview                    |
| **Text And Sprite** | Character preview and character name |

The component automatically obtains the character's layer resources when a sprite preview is required and releases those resources when the entry is disabled.

The component also handles the Select and Remove buttons.

The Remove button is only displayed when:

- The Character Group Editor allows character removal.
- The Character Group is Flexible.



---

## LayeredCharacterListNewCharacterEntry

The **LayeredCharacterListNewCharacterEntry** component is used by the New Character Entry prefab.

This component provides the entry that appears at the beginning of a Flexible Character Group list.

When selected, it opens the Character Creation Menu for creating a new character in the group.

---

# Loading Screens

Loading screen prefabs are located under:

`Prefabs > Character Creator > Character Group Editor > Loading Screens`

Four loading screen prefabs are included, each using a different background.

Character Group Editor loading screens work similarly to the loading screens included with the Character Creation Menu.

The main difference is that a Character Group Editor loading screen requires an explicit reference to the **CharacterGroupEditor** component.

Assign the Character Group Editor component to the loading screen prefab so it can receive loading progress and setup information from the editor.

---

# Premade Character Group Editors

Complete Character Group Editor prefabs are provided under:

`Prefabs > Character Creator > Character Group Editor > Premade Character Group Editors`

Two folders are included:

- **Fixed**
- **Flexible**

Each folder contains two complete menu prefabs:

- **Text Vertical List**
- **Sprite Grid**

The Sprite Grid versions use a `GridLayoutGroup` to arrange character entries into a grid.

The Text Vertical List versions are intended for traditional vertical character lists.

These prefabs provide a complete starting point and can be customized to match the visual style of your game.

---

# Manual Setup

The premade Character Group Editor prefabs are convenient for most projects, but the system can also be assembled manually.

A manually created Character Group Editor follows this general GameObject structure:

```text
Character Group Editor
├── Contents
└── Loading Screen
```

## 1. Create the Character Group Editor

Create a GameObject named:

`Character Group Editor`

Add the `CharacterGroupEditor` component to it.

Configure the component's List Settings, Entry Click Action, and References.

---

## 2. Create the Contents

Create a child GameObject named:

`Contents`

The Contents GameObject acts as the container for the visible menu.

It can contain any UI structure required by your game.

A typical Character Group Editor might contain:

```text
Character Group Editor
├── Contents
│   ├── Background
│   ├── Title
│   ├── Back Button
│   └── Scroll View
│       └── Content
└── Loading Screen
```

The exact structure is completely customizable.

For example, a custom implementation could use a grid, carousel, paginated list, or another UI system instead of a standard Unity `ScrollView`.

---

## 3. Create the List Parent

Create a GameObject or Transform that acts as the parent for the character entries.

For a typical ScrollView, this would be the ScrollView's Content object:

```text
Scroll View
└── Content
    ├── Character Entry
    ├── Character Entry
    ├── Character Entry
    └── ...
```

Assign this Transform to the **List Parent** field on the `CharacterGroupEditor`.

Every character in the Character Group is represented by a list entry under this Transform.

> [!TIP]
> A `ContentSizeFitter` with **Vertical Fit** set to **Min Size** is recommended when using a vertically scrolling list. This allows the Content object to automatically expand to accommodate the number of character entries created by the Character Group Editor. Without an appropriately sized Content object, entries may overlap or the ScrollView may not correctly determine the size of its scrollable area.

The same concept can be applied to other layouts when the list is arranged horizontally or as a grid.

---

## 4. Add the List Entry Prefab

Choose one of the character list entry prefabs from:

`Prefabs > Character Creator > Character Group Editor > Character List Entries`

Add it as a child of the List Parent.

The Character Group Editor searches the List Parent for existing `LayeredCharacterListEntry` components when it initializes.

It then creates additional entries as required to match the number of characters in the Character Group.

Assign the same prefab to the **List Entry Prefab** field.

The editor will instantiate this prefab whenever additional entries are required.

---

## 5. Configure the List Entry

The `LayeredCharacterListEntry` component can be configured to display the character as:

- Text
- Sprite
- Text and Sprite

Assign the appropriate UI components for the selected display type.

For example:

```text
Character Entry
├── Character Image
├── Character Name
├── Select Button
└── Remove Button
```

The Select Button calls the Character Group Editor's entry action.

The Remove Button removes the assigned character from the Flexible Character Group when removal is enabled.

---

## 6. Configure Flexible Groups

When using a Flexible Character Group, assign a **List New Character Entry Prefab**.

The prefab can be found under:

`Prefabs > Character Creator > Character Group Editor > Character List Entries > New Character Entry`

The Character Group Editor creates this entry before the character entries and places it at the beginning of the list.

If **Create New Characters Permission** is disabled, the New Character Entry is not created.

---

## 7. Add a Loading Screen

Create another child GameObject under the Character Group Editor and add one of the provided loading screen prefabs.

For example:

```text
Character Group Editor
├── Contents
└── Loading Screen
```

Assign the parent `CharacterGroupEditor` component to the loading screen's required reference.

The loading screen can then display while the Character Group Editor loads and prepares its character entries.

---

# Example Setup

A complete manually configured Flexible Character Group Editor could look like this:

```text
Character Group Editor
│
├── CharacterGroupEditor
│   ├── Layered Character Type: Player Characters
│   ├── List Type: Flexible
│   ├── Group Name: Player Roster
│   ├── Entry Click Action: Edit
│   ├── List Entry Prefab: Character Entry
│   ├── List New Character Entry Prefab: New Character Entry [Sprite]
│   └── List Parent: Content
│
├── Contents
│   ├── Background
│   ├── Title
│   ├── Back Button
│   └── Scroll View
│       └── Content
│
└── Loading Screen
```

When the menu is opened:

1. The `CharacterGroupEditor` initializes.
2. It searches for the **Player Roster** Flexible Character Group.
3. If the group does not exist, it is created.
4. The New Character Entry is added to the list.
5. Existing characters in the group are given list entries.
6. The entries are configured with their character's name and, when applicable, character preview.
7. Once setup is complete, the menu can be displayed.

The Character Group Editor performs this setup automatically when it is enabled.