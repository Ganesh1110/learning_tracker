const String listBodyRnEquivalent = r'''
In React Native, laying out children sequentially and stretching them to match the cross axis of the parent is achieved using standard Flexbox layout rules.

### React Native Equivalent (Flexbox Column)
By setting `flexDirection: 'column'` and `alignItems: 'stretch'`, React Native views lay out children sequentially, forcing them to match the parent's width:

```jsx
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const SequentialLayout = () => (
  <View style={styles.container}>
    <View style={styles.box1}>
      <Text>Item 1</Text>
    </View>
    <View style={styles.box2}>
      <Text>Item 2 (Two lines of text)</Text>
    </View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flexDirection: 'column', // lays out along vertical main axis
    alignItems: 'stretch',  // stretches children along horizontal cross axis
    padding: 12
  },
  box1: { backgroundColor: 'lightblue', padding: 16 },
  box2: { backgroundColor: 'lightgreen', padding: 24 }
});
```

### The Difference in Flutter
In Flutter, while you can achieve sequential, cross-axis stretching using `Column(crossAxisAlignment: CrossAxisAlignment.stretch)`, this can sometimes lead to issues inside scrollable layouts because `Column` demands finite vertical height constraints.

`ListBody` is a specialized, lightweight layout widget:
1. It lays out children sequentially in a single direction (main axis).
2. It stretches children to match the width/height of the parent along the cross axis.
3. Unlike `Column` or `Row`, `ListBody` **does not support flex factors** (`Expanded` or `Spacer` will crash inside it) and performs no flex layout calculations.
4. Because it is highly optimized and doesn't calculate flexible layouts, it is typically used inside custom scrollable widgets (like the scrollable dropdown lists, list builders, or picker menus) where items are simply stacked.
''';
