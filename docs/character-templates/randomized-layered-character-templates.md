---
uid: randomized-layered-character-templates
summary: Blueprints for creating randomized layered characters during runtime.
---

# Randomized Layered Character Templates

A **Randomized Layered Character Template** is a **Scriptable Object** used to create **Randomized Layered Characters** at runtime.

Unlike standard Character Templates where the output is always the same result, a Randomized Character Template creates a random character each time based on a set of configured rules.

---

## When Should You Use this?

Use a **Randomized Layered Character Template** when:

- You need randomized NPC generation.
- You want varied background characters with set rules
- You want controlled randomness with filtering or weighting

This system gives you fine control over how each layer is selected.

---

## Workflow Overview

1. Create a **Randomized Layered Character Template**
2. Assign a **Character Type**
3. Set the default name
4. Configure Selection Mode for each layer
5. Assign the template to a **Layered Character Renderer**

The template can now procedurally generate controlled, reusable character variations.

---

## Basic Setup

### Create

To create a Randomized Layered Character Template `right click` the `Project window` and navigate to  
`Create > BlazerTech > Character Management System > Character Templates > Randomized Layered Character Template`.

![Randomized Layered Character Template](~/images/character-templates/randomized-layered-character-templates/randomized-layered-character-template.png)

### Character Type

Assign the **Character Type asset** that all characters created from this template will use.

![Layered Character Template: Character Type](~/images/character-templates/layered-character-templates/layered-character-template-character-type.png)

This is used to determine:

- The available **layers** of the character
- The available **Layer Options** for each layer.
- The **Animator Controller** used to animate the character

Once assigned, a configurable list of layers will appear.

### Default Character Name

Set the default name assigned when a character is created from this template.

You may also optionally set a **Display Name** for use alongside created characters in-game.

![Layered Character Template: Character Name](~/images/character-templates/layered-character-templates/layered-character-template-character-name.png)

---

## Layer Randomization Settings

When a **Character Type** has been assigned, a list of layers appears.  
Each entry represents a layer defined in the **Character Type**.  

![Layered Character Template: Layers List](~/images/character-templates/randomized-layered-character-templates/randomized-layered-character-template-layers-list.png)

Each entry has a **Selection Mode** which determines how a **Layer Option** is chosen for that layer.  
Each layer can be configured independently.

---

### Selection Mode: Any

Selects a **Layer Option** completely at random from all available options.  
This is the default and simplest option.

![Selection Mode: Any](~/images/character-templates/randomized-layered-character-templates/selection-mode-any.png)

`Allow Blank` determines if a blank **Layer Option** can be selected.

> [!NOTE]
> `Allow Blank` can only be enabled if the layer itself supports blank options.

**Best for**: Fully random generation with minimal setup.

---

### Selection Mode: Allow List

Selects randomly from a specific list of allowed Layer Options.

![Selection Mode: Allow List](~/images/character-templates/randomized-layered-character-templates/selection-mode-allow-list.png)

**Pros**:  
- Precise control over available options
  
**Cons**:  
- Can be hard to manage if **Layers Options** are change often.

---

### Selection Mode: Weighted Allow List

Works like the standard [Allow List](#selection-mode-allow-list) with the addition of a `Weight` property for each **Layer Option** selected.  

![Selection Mode: Weighted Allow List](~/images/character-templates/randomized-layered-character-templates/selection-mode-weighted-allow-list.png)

Higher weights increase the likelihood of selection.

**Example**: If Option A has weight 2 and Option B has weight 1, Option A is twice as likely to be selected.

**Pros**:
- Precise control over available options  
- Adjustable probability  

**Cons**:
- Can be hard to manage if **Layers Options** are added/removed often.
- Requires manual balancing

**Best for**: Common vs rare visual elements.

---

### Selection Mode: Regex

Uses a **Regular Expression** pattern to dynamically match Layer Options by name.
[Learn more about Regular Expressions here](https://en.wikipedia.org/wiki/Regular_expression)

![Selection Mode: Regex](~/images/character-templates/randomized-layered-character-templates/selection-mode-regex.png)

The regex pattern filters **Layer Options** at runtime and randomly chooses from the list.

Example pattern: **Flannel|T-shirt**

This matches any **Layer Option** containing either “Flannel” or “T-shirt”.

The **Regex Matches** list shows which options currently match your pattern.

> [!NOTE]
> matches are evaluated at runtime, not cached in the editor. The **Regex Matches** list is for editor visualization only.

#### Additional Settings
- **Allow Blank** — Include blank as a possible result  
- **Case Sensitive** — Toggle case sensitivity  
- **Invert Match** — Treat the pattern as a blacklist  

**Pros**:
- Highly flexible
- Automatically adapts when **Layer Options** change

**Cons**:
- Steep learning curve if new to Regular Expressions

**Best for**: Situations where **Layer Options** are frequently added or removed.

---

### Selection mode: Fixed

Always selects a specific Layer Option.

![Selection Mode: Regex](~/images/character-templates/randomized-layered-character-templates/selection-mode-fixed.png)

**Best for**: Layers that should never change.

---

### Selection Mode: Blank

Always selects a blank Layer Option.

![Selection Mode: Regex](~/images/character-templates/randomized-layered-character-templates/selection-mode-blank.png)

> [!NOTE]
> Only available if the layer is allowed to be blank. Can be toggled in the [Layer Definition Asset](xref:character-layers#include-none-option)

**Best for**: Explicitly disabling a layer.

---

## Runtime Usage

**Randomized Layered Character Templates** can be used in the same **Layered Character Renderer Component** that the standard **Layered Character Templates** use. This component will create a character from the template and animate it using the **Animator Controller** assigned in the **Character Type**.

> [!NOTE]
> If `Use Cache` is enabled it will use the same character every time after the first character is created. If you want to create a new randomized character each time, disable this setting.

[Read More → Layered Character Renderer component](xref:character-usage#layered-character-template-renderer)