const String focusTraversalGroupRnEquivalent = r'''
In React Native, configuring focus traversal ordering (how focus shifts when pressing Tab or D-pad arrows) depends on the target platform:

1. **Web**: React Native Web uses the standard HTML `tabIndex` attribute:
   ```jsx
   <View tabIndex={2} />
   ```
2. **TV / Desktop**: Spatial navigation (focusing nearest neighbor) is handled automatically by the native OS, but can be customized using ref mappings:
   ```jsx
   // TV-specific directional overrides:
   <TouchableOpacity nextFocusDown={findNodeHandle(refNode)} />
   ```

However, there is no generic, layout-agnostic API to group controls or customize traversal policies declaratively.

### The Difference in Flutter
Flutter provides `FocusTraversalGroup` to define focus routing behaviors for subtrees. By default, Flutter uses a `ReadingOrderTraversalPolicy` that calculates focus flow based on screen layout geometries (left-to-right, top-to-bottom).

You can override this by wrapping a group of focused widgets inside a `FocusTraversalGroup` with a specific policy:

1. **ReadingOrderTraversalPolicy**: Traverses nodes in normal reading direction.
2. **OrderedTraversalPolicy**: Focus shifts based on custom index declarations. You wrap child widgets in `FocusTraversalOrder` and specify orders (like `NumericFocusOrder(1.0)` or `LexicalFocusOrder('a')`).
3. **DirectionalFocusTraversalPolicyMixin**: Handles arrow key focus shifts.

This isolates keyboard/D-pad tab flow, preventing a header navigation menu from getting mixed up with sidebar links when pressing tab.
''';
