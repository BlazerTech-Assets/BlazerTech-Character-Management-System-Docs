---
uid: built-in-characters
---

# Built-In Characters

<img src="~/images/logos/blazertech-modular-characters-logo.png" alt="BlazerTech Modular Characters Logo" width="500" />

## BlazerTech Modular Characters

Sample modular characters are included within the **BlazerTech Character Management System** and are available to be used in any commercial or non-commercial project. These characters were made to match the style of the [Modern Series](https://limezu.itch.io/moderninteriors) created by [LimeZu](https://limezu.itch.io/).

These characters are modular and consist of 4 layers:
1. **Body (7 Options)**
2. **Outfit (28 Options)**
3. **Hairstyle (28 Options)**
4. **Accessory (29 Options)**

A **Layered Character Type** and **Unified Character Type** are pre-setup in the **/BlazerTech Modular Characters** subfolder.
The **Unified Character Type** contains a few premade characters created by combining random options of each of the 4 layers.

The **BlazerTech Modular Characters** were creating by **Jammie**. Check out more of his work [here](https://sites.google.com/view/jammiekrid/portfolio)!

> [!TIP]
> Upon the full release of the **BlazerTech Character Management System** these characters will also be available for purchase separately at a discounted price.

---

## Character Usage

The easiest way to create and use a **BlazerTech character** is to create a **character template**. It's basically a blueprint for the character which we can then use to create the character later during runtime.  

To create a character template **right click** the **Project window** and navigate to `Create > BlazerTech > Character Management System > Character Templates > Layered Character Template`.  

Once created, assign the **BlazerTech Layered Character Type** to the **Character Type field**. A list will appear with 4 entries, one for each layer. Assign the option you want to use for each layer of the character.  

<img src="~/images/character-templates/layered-character-template.png" alt="BlazerTech Layered Character Template Example" width="300" />  

When you want to use your template add the [Layered Character Template Renderer](xref:character-usage#layered-character-template-renderer) component to a GameObject and assign a reference to the **Layered Character Template** you just created.

Then enter play mode and you'll see the character you created from the template.

![Layered Character Template Renderer Component Example](/images/misc/layered-character-template-renderer-component.png)

## Related
- [Character Templates](xref:character-templates)