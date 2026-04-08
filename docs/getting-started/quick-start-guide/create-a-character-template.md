---
uid: quick-start-create-a-character-template
summary: 
---

# Create A Character Template

There are a multitude of ways to create characters in the **Character Management System**, however for this guide we're going to focus on **Character Templates**.

Think of a **Character Template** as a blueprint to create a character during runtime.  
The Template defines the **name** of the character and the **spritesheet(s)** used.

## Create Character Template Asset

To create a Character Template asset:
1. `Right Click` the **Project window**
2. Navigate to: **Create > BlazerTech > Character Management System > Character Templates >**
3. Select either **Layered** or **Unified Character Template**

---

## Unified Character Template Setup

A **Unified Character Template** requires:
1. A reference to a **Unified Character Type**.
2. A **name** for the character when it gets created.
3. A reference to the **spritesheet** the character will use.

![Unified Character Template](~/images/character-templates/unified-character-templates/unified-character-template.png)

#### Spritesheet Requirements:
- Must be the exact same size as the **Base Spritesheet** assigned in the **Character Type** and contain the same animations.
- **Sprite Mode:** `Single` - We won't be using the spritesheet directly. It'll be passed to the [Character Shader](xref:basic-concepts#the-character-shader).
- **Filter Mode:** `Point (No Filter)`.
- (Optional) **Compression:** `None` - Generally not needed for pixel art.

Once finished, skip to [Next Steps](#next-steps).

- [Read Also → Unified Character Templates](xref:unified-character-templates)  

---

## Layered Character Template Setup

Start by setting the basic required fields:
1. A reference to a **Layered Character Type**.
2. A **Name** for the character when it gets created.
3. Optionally a **Display Name** that can be displayed along with the character.

![Layered Character Template](~/images/character-templates/layered-character-templates/layered-character-template.png)

### Assign Layer Options

Once a **Layered Character Type** has been assigned, a list of **Layers** will appear. These are the same layers you assigned in your **Layered Character Type**.

Each entry in the list has an assigned **Layer Option**, that's the **spritesheet** that'll be used for that layer of the character.  

Selecting an entry will open a dropdown containing all **valid Layer Options** that can be selected. This is the same list of **Layer Options** contained in each **Character Layer Definition asset**.

![Layered Character Template Layers List](~/images/character-templates/layered-character-templates/layered-character-template-layers-list.png)

> [!TIP]
> If the layers list ever appears incorrect or invalid, click **Recreate List** at the bottom to remake the list.  
> (Note: This will **reset** any selected options)

Once finished, Go to [Next Steps](#next-steps).

- [Read Also → Layered Character Templates](xref:layered-character-templates)

---

## Next Steps

Learn how to **create and render characters** from your **Character Template** during runtime.

[Read More → Use Your Character](xref:quick-start-use-your-character)