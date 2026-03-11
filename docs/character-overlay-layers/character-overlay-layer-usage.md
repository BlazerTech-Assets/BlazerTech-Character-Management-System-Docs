---
uid: character-overlay-layer-usage
summary: Learn how to apply Overlay Layers to characters at runtime.
---

# Character Overlay Layers

This page explains how to apply **Overlay Layers** to a character using a [Character Renderer Component](xref:character-renderer-components).

> [!NOTE]
> A character must be loaded before an **Overlay Layer** can be added through a **Character Renderer component**.

## Default Overlay Layers

In every Character Renderer Component is the **Default Overlay Layers** list. Every Overlay Layer in this list will be automatically applied to the character when loaded.

![Default Overlay Layers](~/images/overlay-layers/default-overlay-layers.png)

**Overlay Layers** will be applied in the order listed.

> [!CAUTION]
> Make sure the **Overlay Layers(s)** you assign use the same **Character Type** your character uses, otherwise the Overlay Layer will **NOT** be applied.

---

## Managing Overlay Layers Through Code

All **Character Renderer Components** provide methods for **adding, removing, and rearanging Overlay Layers** at runtime.

All methods are contained within the **OverlayLayerHandler** subclass which all **Character Renderer Components** have an instance of.

---

### Add Overlay Layer

This script adds the an Overlay Layer to a character whenever the **alpha 1** key is pressed. Pressing the button multiple times will add a duplicate of the Overlay Layer each time.

```CS
using BlazerTech.CharacterManagement.Components;
using UnityEngine;
using UnityEngine.InputSystem;

public class AddOverlayLayerOnPress : MonoBehaviour
{
    [SerializeField] CharacterRendererBase characterRenderer;

    [SerializeField] CharacterOverlayLayerSO overlayLayer;

    void Update()
    {
        if (Keyboard.current.digit1Key.wasPressedThisFrame)
            characterRenderer.OverlayLayerHandler.AddOverlayLayer(overlayLayer);
    }
}
```

---

### Remove Overlay Layer

This script removes a specific Overlay Layer whenever the Alpha 1 key is pressed. If duplicates of the same Overlay Layer are present, only the first instance will be removed.

```CS
using BlazerTech.CharacterManagement.Components;
using UnityEngine;
using UnityEngine.InputSystem;

public class RemoveOverlayLayerOnPress : MonoBehaviour
{
    [SerializeField] CharacterRendererBase characterRenderer;

    [SerializeField] CharacterOverlayLayerSO overlayLayer;

    void Update()
    {
        if (Keyboard.current.digit1Key.wasPressedThisFrame)
            characterRenderer.OverlayLayerHandler.RemoveOverlayLayer(overlayLayer);
    }
}
```

### Change Overlay Layer Index

This script adds an Overlay Layer and sets it to the second index whenever the **Alpha 1** key is pressed. If there are no other Overlay Layers present, the call to change its index does nothing.

```CS
using BlazerTech.CharacterManagement.Components;
using UnityEngine;
using UnityEngine.InputSystem;

public class AddOverLayerAndSetIndexOnPress : MonoBehaviour
{
    [SerializeField] CharacterRendererBase characterRenderer;

    [SerializeField] CharacterOverlayLayerSO overlayLayer;

    void Update()
    {
        if (Keyboard.current.digit1Key.wasPressedThisFrame)
        {
            characterRenderer.OverlayLayerHandler.AddOverlayLayer(overlayLayer);
            characterRenderer.OverlayLayerHandler.ChangeOverlayLayerIndex(overlayLayer, 1);
        }
    }
}
```