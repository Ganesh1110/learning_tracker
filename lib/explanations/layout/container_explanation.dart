const String containerRnEquivalent = r'''
In React Native, style composition (padding, margin, borders, decorations, shadows, alignments, and transforms) is handled entirely by applying styles to a single standard `<View>` component.

```jsx
// React Native:
import React from 'react';
import { View, StyleSheet } from 'react-native';
import Icon from 'react-native-vector-icons/Ionicons';

const BoxExample = () => {
  return (
    <View style={styles.container}>
      <View style={styles.childCircle}>
        <Icon name="home" size={24} color="#3b82f6" />
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    margin: 16,
    padding: 16,
    borderRadius: 16,
    borderWidth: 2,
    borderColor: '#10b981',
    backgroundColor: '#3b82f6',
    alignItems: 'center',       // child alignment
    justifyContent: 'center',
    transform: [{ rotate: '45deg' }],
    // Shadow properties
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 4 },
    shadowRadius: 8,
    shadowOpacity: 0.25,
    elevation: 5, // Android shadow
  },
  childCircle: {
    width: 50,
    height: 50,
    borderRadius: 25,
    backgroundColor: 'white',
    justifyContent: 'center',
    alignItems: 'center',
  },
});
```

### Key Differences
1. **Convenience Wrapper vs. Unified Stylist**:
   - **React Native**: The `<View>` is a unified styling canvas. There is no performance penalty for having a View without transform properties, nor does adding border properties instantiate new separate layout classes.
   - **Flutter**: Flutter's **`Container`** is *not* a rendering widget. Instead, it is a convenience wrapper that dynamically composes a tree of single-purpose widgets based on which parameters are supplied:
     - `padding` -> inserts a `Padding` widget.
     - `margin` -> inserts an outer `Padding` widget.
     - `decoration` -> inserts a `DecoratedBox`.
     - `alignment` -> inserts an `Align` or `Center` widget.
     - `transform` -> inserts a `Transform` widget.
     - `constraints` -> inserts a `ConstrainedBox`.

2. **Performance Tip (Composition Overhead)**:
   - Since `Container` instantiates and wraps your child in multiple nested widgets under the hood, it introduces slight allocation overhead in large list items.
   - For high-performance code (like list items), it is a best practice to use the specific leaf widget directly: e.g., use `Padding` if you only need padding, or `ColoredBox` if you only need a solid background color.

3. **Color vs. Decoration Constraint**:
   - In Flutter, you cannot specify both the `color` and `decoration` parameters on a `Container` at the same time. If you supply a `decoration` (e.g. `BoxDecoration` to set rounded corners or gradients), you must place the color *inside* that `decoration` object (e.g., `BoxDecoration(color: Colors.blue)`). Leaving the color in the root `Container` parameter will cause a runtime assertion failure.
''';
