---
uid: layered-character-templates
summary: Blueprints for creating layered characters during runtime.
---

# Layered Character Templates

A **Layered Character Template** is a **Scriptable Object** used to create **Layered Characters** at runtime.

It Acts as a resuable blueprint that defines:

- The **Character Type** asset the character will use
- The **default name** assigned when a character is created
- The **Layer Option** used for each layer of the character

---

## Workflow Overview

1. Create a **Layered Character Template** asset
2. Assign a **Character Type**
3. Set the default name
4. Choose **Layer Options** for each layer
5. Attach the template to a **Layered Character Renderer** component

The template can now be reused to consistently generate the same layered character every time.

---

## Setup

### Create

To create a Layered Character Template `right click` the `Project window` and navigate to  
`Create > BlazerTech > Character Management System > Character Templates > Layered Character Template`.

![Layered Character Template](~/images/character-templates/layered-character-templates/layered-character-template.png)

### Character Type

Assign the **Character Type asset** that all characters created from this template will use.

![Layered Character Template: Character Type](~/images/character-templates/layered-character-templates/layered-character-template-character-type.png)

This is used to determine:

- The available **layers** of the character
- The available **Layer Options** for each layer.
- The **Animator Controller** used to animate the character

### Default Character Name

Set the default name assigned when a character is created from this template.

You may also optionally set a **Display Name** for use alongside created characters in-game.

![Layered Character Template: Character Name](~/images/character-templates/layered-character-templates/layered-character-template-character-name.png)

### Select Layer Options

When a **Character Type** has been assigned, a list of layers appears.  

![Layered Character template: Layers List](~/images/character-templates/layered-character-templates/layered-character-template-layers-list.png)

Each entry respresents a layer defined in the **Character Type**.  

Each layer has an assigned **Layer Option** which is the spritesheet used for that layer.  
You can change the **Layer Option** used for each layer here.  
A dropdown shows all available options and the search bar can be used to narrow down results.

When a character is created from this template, all selected **Layer Options** are applied automatically.

---

## Runtime Usage

Once the **Character Template** is setup it can be assigned in a **Layered Character Template Renderer component** which at runtime will create a character from the template and animate it using the **Animator Controller** assigned in the **Character Type**.

![Layered Character Renderer Component](~/images/components/character-renderer-components/layered-character-template-renderer/layered-character-template-renderer.png)

[Read More → Layered Character Template Renderer component](xref:layered-character-template-renderer-component)