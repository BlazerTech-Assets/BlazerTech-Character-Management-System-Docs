---
uid: character-layers
---

# Character Layers
A Character Layer is an asset that contains all available character spritesheets for a specific layer of a character.  
Character Layers are meant to be used along with a [Layered Character Type](xref:layered-character-type) asset.

To create a layer **right click** the **project window** and navigate to  
`Create > BlazerTech > Character Management System > Layered Character Type > Character Layer`.

After the **Character Layer** has been created make sure to add it to the **layers list** inside your **Layered Character Type**.

## Character Layer Options
A [Character Layer Option](xref:BlazerTech.CharacterManagement.Characters.CharacterLayerOption) is a wrapper for a character spritesheet which allows for easy loading/unloading of the spritesheet when needed.

A list of Layer Options is kept in every Character Layer. The list represents all valid character spritesheets for a specific layer of the character.

> [!CAUTION]
> All spritesheets used as layer options must be the exact same size as the [Base Spritesheet](xref:character-type-core#base-spritesheet) set in the **Layered Character Type** or they will be invalid!  

![Character Layer Options List](~/images/character-types/character-layers/character-layer-options-list.png)

**Layer Options** are not added to the list manually. Instead go to the spritesheet you want to be included as an option for that layer:
1. Mark it as an **Addressable** in the **Inspector**.  
2. give it a label.  
Make sure the label the sprite has is the same label assigned in the [Layer Asset label](#layer-asset-label) field of the **Character Layer** asset you created.

![Layer Option Addressables Marking](~/images/character-types/character-layers/layer-option-addressables-marking.png)


> [!TIP]
> You can mark an entire folder as **addressable** and give it a tag which will automatically be applied to everything in the folder.

Once all your spritesheets are marked as addressable and have the correct tag, go back to your character layer asset and click the [Collect Layer Options](#collect-layer-options) button to populate the **Layer Options** List.

> [!TIP]
> The **Layered Character Type** also contains a **Collect Layer Options** button which will collect layer options for all layers in the **Layers list**.

---

## Fields

### Attached Character Type
The **Layered Character Type** the layer is meant to be used for.

### Layer Name
The name of the layer. Used in the [Character Creator](xref:character-creator-overview) when displaying character layer names.  
Does **NOT** need to be unique.

### Layer Asset Label
The **Addressables label** used to collect spritesheets and load them into **Layer Options**. The **Character Management System** uses Unitys **Addressables package** to dynamically load/unload sprites when needed. Select the label you'd like to use and make sure all character spritesheets meant to be used for this layer are marked as Addressable and have the same label.

### Include None Option
if toggled a blank option will be added to the list of **Layer Options**. This will essentially allow a character to be created without using that layer since if the blank option is chosen, an empty sprite will be used.

![Character Layer](~/images/character-types/character-layers/character-layer.png)

---

## Buttons

### Collect Layer Options
Finds all sprites matching the **Layer Asset Label** and are the same size as the **Base Spritesheet**. If so it gets added it to the [Layer Options](#character-layer-options) list.

### Clear Options List
Clears the Layer Options list.

> [!TIP]
> Can be undon using **control/command + Z**.