---
uid: changelog
summary: All notable changes made to the **BlazerTech Character Management System**.
---

# Changelog

All notable updates, improvements, and fixes to the **BlazerTech Character Management System** are listed below.  
This log follows the [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) convention and uses [Semantic Versioning](https://semver.org/).

---

## [0.4.0] - 9-19-2026

### Added
- Added [Randomized Layered Character Template](xref:randomized-layered-character-templates).
- Added [Character Overlay Layers](xref:character-overlay-layers).
- Added **Default Direction** setting to all Animator Handlers.
- Added **Display Name option** to [Character Preview Animation Options](xref:ccm-character-preview#assigning-animations) in Layered Character Type assets.
- Added [CCMSaveCharacterButton](xref:ccm-menu-controls#ccm-save-character-button-component) component.
- Added fourth sample scene - Continuous randomized NPC spawning demo.

### Changed
- Character Shader result is now cached instead of being re-run every frame to vastly improve performance.
- Improved many logs, warnings and errors to be more descriptive.
- Renamed `Character Piece Shaders` dictionary to `Layered Character Shaders` in CMS Reference Handler.
- **Layer Options list** in Layer Definition assets are now cleared when `Layer Asset Label` is changed.
- Extracted **Fixed** and **Randomized Layered Character Template editors** into their own classes.
- Renamed `LoadedCharacterHandler` class to `CharacterShaderState` to better convey its purpose.
- Renamed `Layered Character Group Renderer` component to `Layered Character Group Entry Renderer`.
- Renamed `Character Controller` to `Animator Controller` in Character Type asset.
- Converted all input related scripts to **New Input System**.
- The Character Previews `Preview Mode` now defaults to `Animated` instead of `Static`. 
- Renamed `CCMAnimationPreviewSwitcherManager` to `CCMAnimationSwitcher`.
- Renamed `LayerOptionUIElement` to `LayerSelectorListElement`.
- Renamed `LayeredCharacterSelectionList` to `CharacterGroupEditor`.
- Renamed **Enable Menu methods** in `Character Creation Menu Manager` to better convey their meaning.

### Fixed
- Fixed Character Creator animation preview buttons staying enabled if the animation assigned to play does not exist.

### Removed
- Removed `Log When Character Material Updated` bool in `CCMCharacterPreviewHandler` component in favor of using the new **CMS logging system**.
- Removed **Layer Option Preview Settings** section of **Character Creator Settings** in favor of using **Character Preview Sprite**.

---

## [0.3.0] - 11-13-2025

### Added
- Added third premade Character Creation Menu prefab.
- Added [Project Settings page](xref:project-settings) under `Edit > Project Settings > BlazerTech/Character Management System`.
- Added [binary saving support](xref:project-settings#save-format) (Toggleable in project settings page).
- Added [Auto Save Triggers](xref:project-settings#auto-save-triggers) options in project settings page.
- Added [debug log options](xref:project-settings#debug-options) in project settings page.
- Added [Character Display Name Renderer](xref:character-display-name-renderer-component) component for displaying a characters name.
- Added **ICharacter interface** for instances where any type of character can be used.
- Added **assignable Input Actions** to the [Top Down Movement Controller](xref:top-down-character-movement-controller-component) component.
- Added **hold/toggle** options for **sprint/couch** states in the [Top Down Movement Controller](xref:top-down-character-movement-controller-component) component.
- Added `Create Character If Null` bool to **Layered Character Group Renderer** component.
- Added **Active Character Types** list in [Project Settings page](xref:project-settings). (Replaces Addressables requirement for Character Types)

### Changed
- Converted [Top Down Movement Controller](xref:top-down-character-movement-controller-component) to use the **New Input System**.
- Replaced Character Type assets `ISValid` bool with a check if the Character Type asset is contained within the `Valid Character Types` list within the `CMS Reference Handler`.
- Moved Character Shader out of Character Type asset and into a centralized dictionary with an entry for each validated Character Type.
- Migrated Character Type initialization to use pre-set list inside Project Settings page instead of loading through Addressables.

### Fixed
- Fixed major issue causing Character Types to not be functional in build versions.
- Fixed issue when loading a **Character Creation Menu** with **Animation Controls** multiple times.

---

## [0.2.0] - 10-23-2025

### Added
- Added [Top-Down Character Physics Animator Handler component](xref:top-down-character-physics-animator-handler-component). Uses the direction and speed of the game object to set parameters within an Animator Controller.
- Added [Random Layered Character Renderer component](xref:random-layered-character-renderer-component). Automatically creates a new layered character at runtime using the selected Character Type and random layer options.
- Added randomized NPCs sample scene (Sample 2).
- Added [Built-In Character documentation page](xref:built-in-characters). Explains wha's included and how to use the built-in modular characters.
- Added [Character Animation Setup documentation page](xref:character-animation-setup). Explains the setup process for animations and animator controllers for your characters.

### Changed
- Renamed `PlayerMovementController` to `TopDownMovementController`.
- Renamed all Character Loader components to **Character Renderers** (e.g., `Layered Character Template Renderer`).
- Renamed `CharacterAnimatorHandler` to `TopDownCharacterAnimatorHandler`.
- Exposed animator parameters in Character Animator Handler components.
- Changed Animator Controller `Speed` float to `Is Moving` bool.
- Revised Quick Start Guide.
- Revised entire site layout and structure (The site you're on right now!).

---

## Legend
- 🆕 **Added** — New features or systems.
- 🔄 **Changed** — Updates, improvements, or refactors.
- 🐛 **Fixed** — Bug or issue resolution.
- ⚠ **Deprecated** — Soon-to-be removed features.
- ❌ **Removed** — Old features now removed.