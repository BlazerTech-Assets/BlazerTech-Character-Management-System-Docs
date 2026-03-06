---
uid: layered-character-type
summary: Deep dive into Layered Characters and how to setup a Layered Character Type and its layers.
---

# Layered Character Type

A **Layered Character Type** defines how a **Layered Character** is structured.

It contains the core data shared by all characters of that type, such as the **Base Spritesheet**, **Animator Controller**, and the list of **Character Layers** that make up the character.

![Layered Character Type Asset](~/images/character-types/layered-characters/layered-character-type-asset.png)

---

## Layered Characters

A **Layered Character** is built from **multiple spritesheet layers** stacked on top of each other.

Each layer represents a different visual component of the character.

All layers must follow the **same spritesheet layout**:
- Same **spritesheet size**
- Same **frame sizes**
- Same **frame positioning**

Because every layer shares the same spritesheet layout, all layers align perfectly when stacked together.

**Example Layered Character**:
1. Body
2. Outfit
3. Hairstyle
4. Accessory

The final character is rendered by combining all layers in order.

![Layered Character Example](~/images/character-types/layered-characters/layered-character-example.png)

---
## Create Layered Character Type Asset

To create a new Layered Character Type:

1. `Right click` the **Project window**
2. Navigate to: **Create > BlazerTech > Character Management System > Layered Character Type**

![Create Layered Character Type Asset](~/images/character-types/layered-characters/create-layered-character-type.png)

---

## Character Type Setup

A **Layered Character Type** uses the same core properties shared by all **Character Types**.

| Property                                                                     | Type                      | Description                                          |
| ---------------------------------------------------------------------------- | ------------------------- | ---------------------------------------------------- |
| **[Character Type ID](xref:character-types#character-type-id)**              | String                    | A **unique** identifier                               |
| **[Base Spritesheet](xref:character-types#base-spritesheet)**                | Sprite                    | The **character spritesheet** used by all characters |
| **[Animator Controller](xref:character-types#animator-controller-optional)** | RuntimeAnimatorController | Single **Animator Controller** for all characters    |
| **[Pixels Per Unit](xref:character-types#pixels-per-unit)**                  | int                       | PPU of your Base Spritesheet                         |

Read [Character Type Setup](xref:character-types#character-type-setup) for a step-by-setup guide on how to setup each field.

---

### Character Layers

The **Layered Character Type** also defines the layers used to build the character.

Each entry in the **Layers** list references a **Character Layer Definition** asset.

A **Character Layer Definition** describes how a single layer behaves, including:
- **Layer Name**
- Whether the **layer can be blank**
- The available **Layer Options** (Spritesheets)

Example layers: **Body, Outfit, Hairstyle, Accessory**

Each layer corresponds to one spritesheet that is combined during rendering.

---

#### Create Character Layer Definitions

To create a Character Layer Definition:
1. `Right click` the **Project window**
2. navigate to: **Create > BlazerTech > Character Management System > Layered Character Types > Layer Definition**

![Create Character Layer Definition Asset](~/images/character-types/layered-characters/character-layers/create-character-layer-definition.png)

Create a **Layer Definition** for each layer you want your characters to have.

---

#### Assign Layers

After creating the **Layer Definitions**:
1. Open your **Layered Character Type**
2. Add each **Layer Definition** to the **Layers** list

![Layers List](~/images/character-types/layered-characters/layers-list.png)

The **order of the layers in this list determines the render order**.

Layers are rendered **from top to bottom in the list**, meaning:
- Top of List = Rendered First (Behind)
- Bottom of List = Rendered Last (In Front)

Read [Character Layer Definitions](xref:character-layers) to learn how to setup each **Character Layer Definition**.

---

## Creating Layered Characters

Once your **Layered Character Type** and **Character Layers** are configured, you can begin creating characters.

**Layered Characters** can be created in several ways:

- [Layered Character Templates](xref:layered-character-templates) (Simplest workflow)
- [Random Character Generation](xref:random-layered-character-renderer-component)
- [Runtime creation through C#](#runtime-creation-through-c)

---

## Runtime Creation through C#

### Create Default Layered Character

This creates a new **Layered Character** using the **default Layer Options** for each Layer.

```cs
using BlazerTech.CharacterManagement.Characters;
using UnityEngine;

public class CreateDefaultLayeredCharacter : MonoBehaviour
{
    [SerializeField] LayeredCharacterTypeSO characterType;

    LayeredCharacter character;
    private void Start()
    {
        character = new LayeredCharacter("layered-character", characterType, "Layered Character");
    }
}

```

---

### Create Randomized Layered Character

This creates a new **Layered Character** and grabs a **completely random Layer Option** for each Layer.

```cs
using BlazerTech.CharacterManagement.Characters;
using UnityEngine;

public class CreateRandomizedLayeredCharacter : MonoBehaviour
{
    [SerializeField] LayeredCharacterTypeSO characterType;

    LayeredCharacter character;
    private void Start()
    {
        character = new LayeredCharacter("layered-character", characterType, "Layered Character", LayeredCharacterCreationMode.RandomizedLayerOptions);
    }
}
```

---

### Create Layered Character With Specific Options

This creates a new **Layered Character** by grabbing the **second layer option** for every layer if available, if not the **first layer option** is grabbed instead.

```cs
using BlazerTech.CharacterManagement.Characters;
using System.Collections.Generic;
using UnityEngine;

public class CreateLayeredCharacter : MonoBehaviour
{
    [SerializeField] LayeredCharacterTypeSO characterType;

    LayeredCharacter character;
    private void Start()
    {
        List<CharacterLayerOption> layerOptions = new();

        foreach (var layer in characterType.Layers)
        {
            var layerOption = layer.GetLayerOptionFromIndex(1);
            layerOption ??= layer.GetLayerOptionFromIndex(0);

            layerOptions.Add(layerOption);
        }

        character = new("layered-character", characterType, layerOptions, "Layered Character");
    }
}
```

---

## Related
- [Character Types](xref:character-types)
- [Character Layers](xref:character-layers)