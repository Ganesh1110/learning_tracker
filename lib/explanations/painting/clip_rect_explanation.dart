const String clipRectRnEquivalent = r'''
In React Native, clipping a child component to its parent's rectangular bounds is controlled using the `overflow` style property. Setting `overflow: 'hidden'` on a parent view clips any absolute positioned, translated, or oversized children to the exact boundary of the parent box.

```jsx
// React Native:
import React from 'react';
import { View, StyleSheet } from 'react-native';

const ClipRectExample = () => {
  return (
    <View style={styles.parent}>
      {/* Child offset to overflow parent bounds */}
      <View style={styles.child} />
    </View>
  );
};

const styles = StyleSheet.create({
  parent: {
    width: 160,
    height: 160,
    borderWidth: 2,
    borderColor: 'red',
    backgroundColor: '#eee',
    overflow: 'hidden', // Clips the child to the 160x160 boundary
  },
  child: {
    width: 140,
    height: 140,
    backgroundColor: 'blue',
    transform: [{ translateX: 30 }, { translateY: 30 }], // overflows parent
  },
});
```

### Key Differences
1. **Implicit Paint vs. Explicit Clipping Widgets**:
   - **React Native**: Overflow clipping is a styling property applied to any container View. You simply write `overflow: 'hidden'`.
   - **Flutter**: By default, Flutter does *not* clip layout overflows automatically because clipping incurs a rendering performance cost (it requires creating a clip layer in the graphics pipeline). If a child widget overflows its parent bounds in Flutter, it will simply paint outside them unless you explicitly wrap the widget hierarchy in a **`ClipRect`** widget.

2. **Custom Clipper Bounds**:
   - **React Native**: React Native's `overflow: 'hidden'` always clips precisely to the layout box boundaries of that specific view. There is no way to clip to a custom smaller/larger rectangle within that view without adding nested helper views to act as margins.
   - **Flutter**: The `ClipRect` widget accepts a `clipper` parameter (`CustomClipper<Rect>`). This allows you to programmatically define a custom rectangular clip size and offset that is different from the widget's actual layout bounds, enabling inset or custom shifting crop windows.
''';
