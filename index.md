---
_layout: landing
og_title: BlazerTech Character Management System | Easily create, manage, and customize sprite based characters in Unity
uid: landing
---

![BlazerTech Character Management System Cover Image](~/images/logos/blazertech-character-management-system-logo.png)

# **BlazerTech Character Management System**
> **Easily create, manage, and customize sprite based characters!**

A comprehensive framework designed to handle both **modular** & **premade** characters.
Providing an easy solution to create, use and save characters in your Unity projects.

- [Installation Guide](xref:installation)  
- [Basic Concepts](xref:basic-concepts)  
- [Getting Started](xref:quick-start-guide)  
- [Changelog](xref:changelog)  

Join the Discord server for updates and to get help from the community.
- [Discord Server](https://discord.gg/fPbBrVYBwf)

---

## Top Features

| Feature                                    | Description                                                                  |
| ------------------------------------------ | ---------------------------------------------------------------------------- |
| 👀 **Runtime Customization**                | Modify characters anytime, even at runtime.                                  |
| 👀 **Supports all sprite based characters** | Seamlessly implement any pixel art characters.                               |
| 👀 **Easy of Use**                          | Quick initial setup, even quicker integration.                               |
| 👀 **Included Modular Characters**          | Comes with 4 layers: **Body**, **Outfit**, **Hairstyle**, and **Accessory**. |
| 👀 **Character Creator UI Framework**       | Prefab-based, customizable in-game character creation menu system.           |
| 👀 **Random Character Generation**          | Create randomized NPCs or background characters with one component.          |
| 👀 **Modern Interiors Support**             | Full support for **LimeZu's Modern Interiors Characters**                    |

---

## How It Works

Every character is built from a **Character Type**, which defines:
- Animations and required spritesheet size.  
- An optional Animator Controller
- Character layers if using the layered character type.

Once the Character Type is set up:
1. New characters can be made by creating a character template and assigning the new spritesheet or dynamically creating new characters at runtime.
2. If used, one Animator Controller can be used for all characters of the same character type. 

### Character Type Variants

| Type                       | Description                                                                      |
| -------------------------- | -------------------------------------------------------------------------------- |
| [Layered Character Type](xref:layered-character-type) | Multiple spritesheets (e.g., Body, Hair, Outfit, Accessory) combined at runtime. |
| [Unified Character Type](xref:unified-character-type) | A single preassembled spritesheet for the whole character.                       |

---

## Get Started

Start with the [**Basic Concepts**](xref:basic-concepts) to learn about character types, templates, groups and how they all work together.

### Quick Links
- [Built-in Characters](xref:built-in-characters)
- [Character Types](xref:character-types)
- [Character Templates](xref:character-templates)
- [Character Usage](xref:character-usage)
- [Character Creator](xref:character-creator-overview)

---

_Last updated: 11-13-2025 — V0.3.0_
