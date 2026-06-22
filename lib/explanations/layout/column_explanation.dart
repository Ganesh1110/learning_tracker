const String columnRnEquivalent = r'''
In React Native, laying out children in a vertical array is the default layout behavior. Every `<View>` component has Flexbox layout enabled by default with a default `flexDirection` of `'column'`.

```jsx
// React Native:
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const ColumnExample = () => {
  return (
    <View style={styles.columnContainer}>
      <View style={[styles.box, { width: 60 }]}><Text>Box 1</Text></View>
      <View style={[styles.box, { width: 80 }]}><Text>Box 2</Text></View>
      <View style={[styles.box, { width: 100 }]}><Text>Box 3</Text></View>
    </View>
  );
};

const styles = StyleSheet.create({
  columnContainer: {
    flex: 1,
    flexDirection: 'column', // Default layout direction in React Native
    justifyContent: 'flex-start', // Equivalent to MainAxisAlignment.start
    alignItems: 'center',       // Equivalent to CrossAxisAlignment.center
    backgroundColor: '#1a1a1a',
  },
  box: {
    height: 40,
    backgroundColor: '#6200ee',
    marginVertical: 4,
    justifyContent: 'center',
    alignItems: 'center',
  },
});
```

### Key Differences
1. **Dedicated Widget vs. Flexbox View Default**:
   - **React Native**: Any `<View>` can act as a vertical container. You do not need to wrap children in a specific container widget other than a basic `View` with layout styles.
   - **Flutter**: Flutter uses a dedicated **`Column`** layout widget. This separates structural layout intent (horizontal `Row`, vertical `Column`, layered `Stack`) from generic decorative wrappers.

2. **Axis Alignments Mapping**:
   - **Main Axis**: In a `Column`, the main axis is vertical. Flutter's `mainAxisAlignment` maps directly to React Native's `justifyContent`.
   - **Cross Axis**: The cross axis is horizontal. Flutter's `crossAxisAlignment` maps directly to React Native's `alignItems`.

3. **Size Expansion (MainAxisSize)**:
   - **React Native**: A view container occupies space depending on its `flex` properties or defined dimensions. If you want a container to wrap its height, you omit height or set `flex` to not grow.
   - **Flutter**: The `Column` widget has a `mainAxisSize` property:
     - `MainAxisSize.max` (default): The Column takes up all available vertical space inside its parent.
     - `MainAxisSize.min`: The Column wraps its height to fit only the size of its children. This is crucial when nesting Columns inside scrollable views to prevent unbound height exceptions.

4. **Order Reversal (verticalDirection)**:
   - **React Native**: To lay out children bottom-to-top, you change the layout direction style to `flexDirection: 'column-reverse'`.
   - **Flutter**: In a `Column`, you configure `verticalDirection: VerticalDirection.up` to paint and stack children in reverse order (bottom-to-top).
''';
