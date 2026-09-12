---
uid: character-group-editor
---

# Character Group Editor

The Character Group Editor is a menu for players to view and manage characters stored in a [Character Group](xref:character-grouping-system).

It provides an interface for displaying characters in a group and, when configured as a Flexible group, allows players to create and remove characters from the group.

The Character Group Editor supports both Fixed and Flexible character groups, The type of group is determined by the List Type assgined in the `CharacterGroupEditor` component.

---

## How It Works

When a Character Group Editor is enabled, it looks for a group matching the configured **Group Name** and **Type**.

If a matching group already exists, that group is used.

If no matching group exists, a new group is created automatically.

This is designed so a character group doesn't need to be manually created beforehand.

### Group Identification

A group is identified using both its **Group Name** and **Type**.

This means a Fixed group and a Flexible group can have the same name without conflicting with each other.

### Fixed Groups

When the editor is configured to use a **Fixed** Group Type, the Fixed Group Size must be specificed in the inspector.

When the group is created, all characters required by the group are created immediately,

Characters in the group cannot be added or removed after creation.

The editor then creates a list entry for each character in the group.

### Flexible Groups

When the editor is configured to use a **Flexible** List Type, the group initially contains no characters.

If the **Create New Characters permission** is enabled, players can add new characters to the group through the New Character entry.

If the **Remove Characters permission** is enabled, player can remove characters from the group through a button setup in the List Entry.

---

## Setup

This section goes over all settings and fields in the Character Group Editor.

Add the `CharacterGroupEditor` component to the parent GameObject of your Character Group Editor menu. If using a prefab, one will already be present.

The following settings are required or available in the inspector.

### Group Settings

| Property                                          | Description                                                                                    |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| [Layered Character Type](#layered-character-type) | The [Layered Character Type](xref:layered-character-type) used by the Character Group.         |
| [Group Type](#group-type)                         | Determines whether the editor uses a Fixed or Flexible Character Group.                        |
| [Group Name](#group-name)                         | The name used to find an existing Character Group or create a new one.                         |
| [Fixed Group Size](#fixed-group-size)             | The number of characters in a Fixed group. Only shown when **Group Type** is set to **Fixed**. |

#### Layered Character Type

Assign the Layered Character Type that the characters in the group should use.

**Character Groups** are separated **by Character Type**, meaning a character group with the **same name** and **type** won't be found if using a different Character Type.

#### Group Type

Select the type of group the editor should use:

- **Flexible** - Characters can be added and removed from the group after creation.
- **Fixed** - The group contains a fixed number of characters. Characters cannot be added or removed after creation.

#### Group Name

The **Group Name** is used to find or create the **Character Group**.

If a group with the same named and type already exists, the existing group is loaded. Otherwise, a new group is created.

A **Fixed** and **Flexible** group can have the same Group Name because groups are also separated by type.

#### Fixed Group Size

Only shown when **Group Type** is set to **Fixed**. 

Specifies the number of characters the group should contain.

---

## Permissions

Flexible Character Groups provide two permissions that can be changed in the `CharacterGroupEditor` component.

| Property                             | Description                                                                                                     |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- |
| **Create New Characters Permission** | Determines whether new characters can be added to the list and if the New Character entry is added to the list. |
| **Remove Characters Permission**     | Determines whether existing characters can be removed from the list.                                            |

These settings are only applicable to Flexible Character Groups.

Disabling **Create New Characters Permission** prevents the New Character entry from being displayed.

Disabling **Remove Characters Permission** prevents the remove button on character list entries from being displayed.

---

## Entry Click Action

The **Entry Click Action** determines what happens when a character in the list is selected.

| Action            | Description                                                       |
| ----------------- | ----------------------------------------------------------------- |
| **None**          | Disables interaction with the character entry.                    |
| **Edit**          | Opens the Character Creation Menu to edit the selected character. |
| **Custom Action** | Invokes a UnityEvent assigned by the developer.                   |

Ny default, **Edit** is selected.

### Edit

When Edit is selected, clicking a character calls the Character Creation Menu Manager to open the Character Creation Menu for the selected character.

An instance of a Character Creation Menu must be enabled in the scene for this to work.

[Read More → Character Creator Setup](xref:character-creator-setup)

### None

Selecting **None** disables interaction with character entries.

The entries remain visible, but selection a character does not perform an action.

## Custom Action

Custom Action allows custom events to be assigned using a UnityEvent.

The selected LayeredCharacter is passed to the event, allowing the character to be used by custom methods.

This could be used for example, to open a custom character information screen, select a character for gameplay, or perform another custom action.

If the goal is to perform additional actions **before or after the opening the Character Creation Menu**, the first or last event can be set to:

CharacterGroupEditor.EditCharacter

This will open the Character Creation Menu.

Additional events can then be placed before or after it.

---

## References

The References section contains the prefabs and GameObject references required to build the character list.

| Reference                           | Description                                                       |
| ----------------------------------- | ----------------------------------------------------------------- |
| **List Entry Prefab**               | Prefab used for each character in the list.                       |
| **New Character List Entry Prefab** | Prefab used for the New Character entry in Flexible groups.       |
| **List Parent**                     | Transform that acts as the parent for all character list entries. |

A **New Character List Entry Prefab** is only required when using a Flexible Character Group.

> [!IMPORTANT]
> The List Parent should contain only the list entries used by the Character Group Editor. Any existing children that do not contain a `LayeredCharacterListEntry` component are removed when the editor initializes at runtime.

---

## Prefabs

Ready-to-use prefabs, these include complete pre-made Character Group Editor menus and individual modules to create one yourself.

**Location**: `Prefabs > Character Creator > Character Group Editor`

### Character List Entries

These prefabs are used as entries in the Character List.

Location: `Prefabs > Character Creator > Character Group Editor > Character List Entries`

Four folders are provided.

#### Sprite Based Entries

Displays only a preview of the character. Does **not** display the characters name.

<!-- Insert Sprite Based Entry Screenshot Here -->

#### Text Based Entries

Displays only the character's name. Does **not** display any visual representation of the character.

Uses the characters Display Name if set, otherwise uses the characters name.

This is useful for compact lists.

<!-- Insert Sprite Based Entry Screenshot Here -->

#### Sprite and Text Based Entries

Displays both:
- A preview of the character.
- The character's name.

Use this when you want you entries to show the character and the characters name.

#### New Character List Entry

Contains the prefabs used for the first entry in a Flexible Character Group.

<!-- Insert Sprite and Text Based Entry Screenshot Here -->

Two variants are incldued:

- New Character Entry [Sprite] - Display a character skeleton sprite (Changeable) and text saying **New Character**.
- New Character Entry [Text] - Displays only the text **New Character**.

The text-only version is intended for compact lists.

The **New Character Entry** is instantiated as the first item in the list. Selecting it opens the Character Creation Menu and create a new character. When the character is saved, it is added to the Flexible Character Group.

---

## Loading Screens

**Location**: `Prefabs > Character Creator > Character Group Editor > Loading Screens`

<!-- Add loading screen screenshot -->

Four loading screen prefabs are included, each using a different background.

Character Group Editor loading screens work similarly to the loading screens included with the Character Creation Menu.

The main difference is that a Character Group Editor loading screen requires an explicit reference to the `CharacterGroupEditor` component.

Once the component has been added to your Character Group Editor menu, assign the Character Group Editor component to the loading screen prefab so it can receive loading progress and setup information from the editor.

---

## CharacterGroupEditorEntry

<!-- Add component API reference -->

The `CharacterGroupEditorEntry` component is used by **character list entries**.

It supports three display modes:

| Display Type        | Contents                             |
| ------------------- | ------------------------------------ |
| **Text**            | Character name                       |
| **Sprite**          | Character preview                    |
| **Text And Sprite** | Character preview and character name |

The component automatically handles if the Remove character button is shown.

The button is only shown when:
- The Character Group Editor allows character removal.
- The Character Group Type is set to Flexible.

---

## CharacterGroupEditorNewEntry

<!-- Add component API reference -->

The `CharacterGroupEditorNewEntry` component is used by the **New Character Entry**.

This component provides the entry that appears at the beginning of a Flexible Character Group list.

When selected, it opens the Character Creation Menu for creating a new character in the group.

---

## Premade Character Group Editors

Premade menus that provide all functionaliy needed out of the box, these are the easiest to setup.

**Location**: `Prefabs > Character Creator > Character Group Editor > Premade Character Group Editors`

Two folders are included:

- **Fixed**
- **Flexible**

Each folder contains two complete menu prefabs:

- **Text Vertical List**
- **Sprite Grid**

The Sprite Grid versions use a `GridLayoutGroup` to arrange the character entries into a grid.

The Text Vertical List versions use a `VerticalLayoutGroup` and are intended for traditional vertical character lists.

These prefabs can be customized to be unique to your game, change backgrounds, rearange elements, everything can be modified. The `CharacterGroupEditor` only needs a reference to a GameObject to instantiate character entries into.

---

## Manual Setup

A Character Group Editor can be assembled manually. Building it yourself gives you full control over how the menu looks and behaves.

A Character Group Editor menu follows this general GameObject structure:

```text
Character Group Editor
├── Contents
└── Loading Screen
```

### 1️⃣ Create the Character Group Editor

Create a GameObject named `Character Group Editor`.

Add the `CharacterGroupEditor` component to it.

Configure the components List Settings, Entry Click Action, and references.

---

### 2️⃣ Create the Contents

Create a child GameObject named `Contents`.

The Contents GameObject acts as the container for the visible menu.

It can contain any UI structured required by your game.

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

---

### 3️⃣ Create the List Parent

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

Assign this Transform to the List Parent field on the `CharacterGroupEditor`.

Every character in the Character Group is represented by a list entry under this Transform.

> [!TIP]
> A `ContentSizeFitter` with **Vertical Fit** set to **Min Size** is recommended when using a vertically scrolling list. This allows the Content object to automatically expand to accommodate the number of character entries created by the Character Group Editor. Without an appropriately sized Content object, the ScrollView may not correctly determine the size of its scrollable area.

The same concept can be applied to other layouts when the list is arranged horizontally or as a grid.

---

### 4️⃣ Add the List Entry Prefab

Two options here:

#### Option 1: Use Premade List Entry Prefab

You can use the already created list entry prefabs that are used in the [Premade Character Group Editor prefabs](#premade-character-group-editors).

Assign any of the [Character List Entry prefabs](#character-list-entries) to the **List Entry Prefab** variable in the `CharacterGroupEditor`.


#### Option 2: Create Your Own Prefab

To create your own Character List Entry follow these steps:

1. Create a new GameObject.
2. Add the `CharacterGroupEditorEntry` component.
3. Set **Display Type** (Text, Sprite, Both).
4. Set **Character Name Text** reference (If Display Type is Text or Both).
5. Set **Character Image** reference (If Display Type is Sprite or Both).
6. Set **Select Character Button** reference.
7. Set **Remove Character Button** reference.
8. Drag and drop parent GameObject into Project window to turn it into a prefab.
9. Assign the prefab to the **List Entry Prefab** variable in the `CharacterGroupEditor`.

A usual GameObject structure will look like this:

```text
Character Entry
├── Contents
│   ├── Background
│   ├── Character Sprite
├── Character Name Text
└── Remove Character Button
```

---

### 5️⃣ Configure Flexible Groups

When using a Flexible Character Group, assign a **New Character List Entry prefab**.

This can be one of the premade prefabs located at:

`Prefabs > Character Creator > Character Group Editor > Character List Entries > New Character Entry`

Or you can create your own:

1. Create a new GameObject.
2. Add the `CharacterGroupEditorNewEntry` component.
3. Drag and drop parent GameObject into Project window to turn it into a prefab.
4. Assign the prefab to the **New Character List Entry Prefab** variable in the `CharacterGroupEditor`.

The Character Group Editor creates this entry before the character entries and places it at the beginning of the list.

If **Create New Characters Permission** is disabled, the **New Character Entry** is not created.

---

### 6️⃣ Add a Loading Screen

Create another child GameObject under the **Character Group Editor** and add one of the provided [loading screen prefabs](#loading-screens).

Assign the parent CharacterGroupEditor component to the loading screens' required reference.

The loading screen will then automatically enable itself when the Character Group Editor is loading.

---

## Related

- [Character Grouping System](xref:character-grouping-system)