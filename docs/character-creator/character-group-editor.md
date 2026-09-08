---
uid: character-group-editor
---

# Character Group Editor

The Character Group Editor is a menu for viewing and managing characters stored in a [Character Group](xref:character-grouping-system).

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

Add the CharacterGroupEditor component to the parent GameObject of your Character Group Editor menu. If using a prefab, one will already be present.

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

Selecting **None** disabled interaction with character entries.

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
| **List New Character Entry Prefab** | Prefab used for the New Character entry in Flexible groups.       |
| **List Parent**                     | Transform that acts as the parent for all character list entries. |

A **List New Character Entry Prefab** is only required when using a Flexible Character Group.

> [!IMPORTANT]
> The List Parent should contain only the list entries used by the Character Group Editor. Any existing children that do not contain a `LayeredCharacterListEntry` component are removed when the editor initializes.

---

## Prefabs

(To be written)

---

## LayeredCharacterListEntry

---

## LayeredCharacterListNewCharacterEntry

---

## Loading Screens

---

## Premade Character Group Editors

---

## Manual Setup

---

## Related

- [Character Grouping System](xref:character-grouping-system)