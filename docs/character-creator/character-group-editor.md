---
uid: character-group-editor
---

# Character Group Editor

The Character Group Editor is a menu for players to view and manage characters stored in a [Character Group](xref:character-grouping-system).

It provides an interface for displaying characters in a group and, when configured as a Flexible group, lets players create and remove characters from the group.

TBoth Fixed and Flexible character groups are supported. Which one is used is determined by the **Group Type** field on the `CharacterGroupEditor` component.

> [!TIP]
> The fastest way to get started is to drop one of the [premade menu prefabs](#premade-character-group-editors) into your scene and change its **Group Name**, **Group Type**, and **Layered Character Type**. Everything else is already set up.

---

## How It Works

When a Character Group Editor is enabled, it looks for a group matching the configured **Group Name** and **Group Type**.

- If a matching group already exists, that group is used.
- If no matching group exists, a new group is created automatically.

This means a character group does not need to be created manually beforehand.

### Group Identification

A group is identified by three things: its **Layered Character Type**, its **Group Name**, and its **Group Type**.

Because the type is part of the identity, a Fixed group and a Flexible group can share the same name without conflicting.

### Fixed Groups

When the editor is configured to use a **Fixed** group, the **Fixed Group Size** must be set in the inspector.

All characters required by the group are created at once when the group is created, and characters cannot be added or removed afterwards.

The editor then creates one list entry per character in the group.

### Flexible Groups

When the editor is configured to use a **Flexible** group, the group starts out empty.

- If **Create New Characters Permission** is enabled, players can add characters through the New Character entry.
- If **Remove Characters Permission** is enabled, players can remove characters using the remove button on each list entry.

---

## Setup

Add the `CharacterGroupEditor` component to the parent GameObject of your Character Group Editor menu. If you are using one of the premade prefabs, the component is already present.

The sections below cover every setting on the component.

### Group Settings

| Property                                          | Description                                                                                    |
| ------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| [Layered Character Type](#layered-character-type) | The [Layered Character Type](xref:layered-character-type) used by the Character Group.         |
| [Group Type](#group-type)                         | Determines whether the editor uses a Fixed or Flexible Character Group.                        |
| [Group Name](#group-name)                         | The name used to find an existing Character Group or create a new one.                         |
| [Fixed Group Size](#fixed-group-size)             | The number of characters in a Fixed group. Only shown when **Group Type** is set to **Fixed**. |

#### Layered Character Type

Assign the Layered Character Type that the characters in the group should use.

**Character Groups** are separated **by Character Type**, meaning a character group with the **same name** and **type** won't be found if it was created with a different Character Type.

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

### Permissions

Flexible Character Groups provide two permissions on the `CharacterGroupEditor` component.

| Property                             | Description                                                                                                 |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------- |
| **Create New Characters Permission** | Determines whether new characters can be added to the list, and whether the New Character entry is created. |
| **Remove Characters Permission**     | Determines whether existing characters can be removed from the list.                                        |

Both settings apply only to **Flexible Character Groups**.

Disabling **Create New Characters Permission** prevents the New Character entry from being created.

Disabling **Remove Characters Permission** hides the remove button on character list entries.

---

### Entry Click Action

The **Entry Click Action** determines what happens when a character in the list is selected. **Edit** is the default.

| Action            | Description                                                       |
| ----------------- | ----------------------------------------------------------------- |
| **None**          | Disables interaction with the character entry.                    |
| **Edit**          | Opens the Character Creation Menu to edit the selected character. |
| **Custom Action** | Invokes a UnityEvent assigned by the developer.                   |

#### None

Entries remain visible but interaction is disabled, selecting a character entry does not perform an action.

#### Edit

Clicking a character calls the Character Creation Menu Manager to open the Character Creation Menu for that character.

An instance of a Character Creation Menu must be enabled in the scene for this to work.

[Read More → Character Creator Setup](xref:character-creator-setup)

#### Custom Action

Custom Action lets you assign your own behaviour through a UnityEvent.

The selected LayeredCharacter is passed to the event, so the character is available to your own methods. Use this to open a custom character information screen, select a character for gameplay, or run any other logic.

To run extra logic around the standard edit behaviour, add CharacterGroupEditor.EditCharacter to the event list. That call opens the Character Creation Menu, and any events placed before or after it run in order.

---

### References

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

## Entry Components

### CharacterGroupEditorEntry

<!-- Add component API reference -->

The [CharacterGroupEditorEntry](xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterGroupEditorEntry) component is used by character list entries.

It supports three display modes:

| Display Type        | Contents                             |
| ------------------- | ------------------------------------ |
| **Text**            | Character name                       |
| **Sprite**          | Character preview                    |
| **Text And Sprite** | Character preview and character name |

The component handles the remove button automatically. The button is shown only when both of the following are true:

- The Character Group Editor allows character removal.
- The Group Type is set to Flexible.

### CharacterGroupEditorNewEntry

<!-- Add component API reference -->

The [CharacterGroupEditorNewEntry](xref:BlazerTech.CharacterManagement.CharacterCreator.CharacterGroupEditorNewEntry) component is used by the New Character entry, the entry that appears at the start of a Flexible Character Group list.

When selected, it opens the Character Creation Menu to create a new character in the group.

---

## Prefabs

Ready-to-use prefabs, including complete premade menus and the individual modules needed to build your own.

**Location**: `Prefabs > Character Creator > Character Group Editor`

### Premade Character Group Editors

Complete menus with everything wired up. These are the easiest way to get started.

**Location**: `Prefabs > Character Creator > Character Group Editor > Premade Character Group Editors`

Two folders are included, **Fixed** and **Flexible**, each containing two menu prefabs:

- **Text Vertical List** — uses a `VerticalLayoutGroup`, intended for traditional vertical character lists.
- **Sprite Grid** — uses a `GridLayoutGroup` to arrange character entries into a grid.

These prefabs can be customized freely. Backgrounds, layout, and element arrangement can all be changed; the `CharacterGroupEditor` only needs a reference to a GameObject to instantiate character entries into.

### Character List Entries

Prefabs used as entries in the character list.

**Location**: `Prefabs > Character Creator > Character Group Editor > Character List Entries`

Four folders are provided.

#### Sprite Based Entries

Displays a preview of the character only. Does not display the character's name.

<!-- Insert Sprite Based Entry screenshot here -->

#### Text Based Entries

Displays the character's name only, with no visual representation of the character.

Uses the character's Display Name if one is set, otherwise the character's name.

Useful for compact lists.

<!-- Insert Text Based Entry screenshot here -->

#### Sprite and Text Based Entries

Displays both a preview of the character and the character's name.

<!-- Insert Sprite and Text Based Entry screenshot here -->

#### New Character List Entry

The prefabs used for the first entry in a Flexible Character Group. Two variants are included:

- **New Character Entry [Sprite]** — displays a character skeleton sprite (changeable) and the text **New Character**.
- **New Character Entry [Text]** — displays only the text **New Character**, intended for compact lists.

<!-- Insert New Character Entry screenshot here -->

The New Character entry is instantiated as the first item in the list. Selecting it opens the Character Creation Menu to create a new character, and the character is added to the Flexible Character Group when it is saved.

### Loading Screens

**Location**: `Prefabs > Character Creator > Character Group Editor > Loading Screens`

<!-- Insert loading screen screenshot here -->

Four loading screen prefabs are included, each using a different background.

These work much like the loading screens included with the Character Creation Menu, with one difference: a Character Group Editor loading screen needs an explicit reference to the `CharacterGroupEditor` component.

Once the component has been added to your menu, assign it to the loading screen prefab so the loading screen can receive progress and setup information from the editor.

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

Configure its [Group Settings](#group-settings), [Permissions](#permissions), [Entry Click Action](#entry-click-action), and [References](#references).

### 2️⃣ Create the Contents

Create a child GameObject named `Contents`. This acts as the container for the visible menu and can hold any UI structure your game requires.

A typical Character Group Editor might look like this:

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

### 3️⃣ Create the List Parent

Create a GameObject to act as the parent for the character entries. For a typical ScrollView this is the ScrollView's Content object:

```text
Scroll View
└── Content
    ├── Character Entry
    ├── Character Entry
    ├── Character Entry
    └── ...
```

Assign this Transform to the List Parent field on the `CharacterGroupEditor`. Every character in the Character Group is represented by a list entry under this Transform.

> [!TIP]
> A `ContentSizeFitter` with **Vertical Fit** set to **Min Size** is recommended when using a vertically scrolling list. This allows the Content object to automatically expand to accommodate the number of character entries created by the Character Group Editor. Without an appropriately sized Content object, the ScrollView may not correctly determine the size of its scrollable area.

The same concept can be applied to other layouts when the list is arranged horizontally or as a grid.

### 4️⃣ Add the List Entry Prefab

You can either use a premade prefab or build your own.

#### Option 1: Use a premade list entry prefab

Assign any of the [Character List Entry prefabs](#character-list-entries) to the **List Entry Prefab** field on the `CharacterGroupEditor`. These are the same prefabs used by the [premade menus](#premade-character-group-editors).

#### Option 2: Create your own prefab

To create your own Character List Entry follow these steps:

1. Create a new GameObject.
2. Add the `CharacterGroupEditorEntry` component.
3. Set **Display Type** (Text, Sprite, or Text And Sprite).
4. Set the **Character Name Text** reference (if Display Type is Text or Text And Sprite).
5. Set the **Character Image** reference (if Display Type is Sprite or Text And Sprite).
6. Set the **Select Character Button** reference.
7. Set the **Remove Character Button** reference.
8. Drag the parent GameObject into the Project window to turn it into a prefab.
9. Assign the prefab to the **List Entry Prefab** field on the `CharacterGroupEditor`.

A typical GameObject structure will look something like this:

```text
Character Entry
├── Character
│   ├── Background
│   ├── Character Sprite
├── Character Name Text
└── Remove Character Button
```

### 5️⃣ Configure Flexible Groups

When using a Flexible Character Group, assign a **New Character List Entry prefab**.

Use one of the premade prefabs located at:

`Prefabs > Character Creator > Character Group Editor > Character List Entries > New Character Entry`

Or create your own:

1. Create a new GameObject.
2. Add the `CharacterGroupEditorNewEntry` component.
3. Drag the parent GameObject into the Project window to turn it into a prefab.
4. Assign the prefab to the **New Character List Entry Prefab** field on the `CharacterGroupEditor`.

The Character Group Editor creates this entry before the character entries and places it at the beginning of the list.

If **Create New Characters Permission** is disabled, the **New Character Entry** is not created.

### 6️⃣ Add a Loading Screen

You can either use a premade loading screen or build your own.

#### Option 1: Use a premade loading screen

Add one of the provided [loading screen prefabs](#loading-screens) as a child of the **Character Group Editor** GameObject.

Assign the parent `CharacterGroupEditor` component to the loading screen's required reference. The loading screen then enables itself automatically while the editor is loading.

#### Option 2: Create your own loading screen

1. Create another child GameObject under **Character Group Editor**.
2. Add the `CharacterGroupEditorLoadingScreenHandler` component.
3. Assign the parent `CharacterGroupEditor` component to it.
4. Create a new child GameObject named `Contents` and assign it to the `Contents` field.
5. Add a new GameObject named **Background** with an `Image` component that covers the whole screen, as a child of `Contents`.

The `Contents` GameObject is automatically enabled while the Character Group Editor is initializing.

Additional functionality can be added to the loading screen the same way as Character Creation Menu loading screens. Refer to [Loading Screen Components](xref:ccm-loading-screens#loading-screen-components) for more components you can use to add features to your loading screen.

---

## Related

- [Character Grouping System](xref:character-grouping-system)