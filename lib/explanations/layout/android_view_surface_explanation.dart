const String androidViewSurfaceRnEquivalent = r'''
In React Native, native views are naturally children of the standard Android `ViewGroup` or iOS `UIView` tree, meaning touch routing, text keyboards, and accessibility work out-of-the-box:

```jsx
// React Native:
// Integrated seamlessly into the layout hierarchy:
<View>
  <TextInput style={{ height: 40 }} />
  <MyNativeComponent />
</View>
```

In Flutter, embedding native views via Virtual Display (`AndroidView`) historically caused issues with keyboard focus, copy-paste handles, and screen readers because the view was isolated onto an offscreen texture.

To fix these issues, Flutter introduced **Hybrid Composition** (represented by **`AndroidViewSurface`** used with `PlatformViewLink`). 

Instead of copying pixels from an offscreen buffer, Hybrid Composition embeds the actual native Android view directly into the parent Android view hierarchy. Flutter's engine then layers and composits it alongside Flutter widgets.

### Comparison:
| Feature | Virtual Display (`AndroidView`) | Hybrid Composition (`AndroidViewSurface`) |
|---|---|---|
| **Rendering** | Offscreen texture copy | Native layout tree integration |
| **Keyboard Focus** | Often buggy/requires hacks | Works natively out-of-the-box |
| **Accessibility** | Limited support | Full native accessibility integration |
| **Performance** | Faster on older devices | Slight compositing overhead on older SDKs |
''';
