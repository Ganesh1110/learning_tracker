const String limitedBoxRnEquivalent = r'''
In React Native, limiting layout bounds is managed directly using the standard stylesheet properties `maxWidth` and `maxHeight`.

### React Native Max Dimensions
A stylesheet limit applies globally and uniformly, regardless of whether the parent View is scrollable or constrained:

```jsx
import React from 'react';
import { View, Text, StyleSheet, ScrollView } from 'react-native';

const LimitedItemsList = () => (
  <ScrollView>
    {/* This box is capped at 80px, even though its target height is 180px */}
    <View style={styles.box}>
      <Text>Item Content</Text>
    </View>
  </ScrollView>
);

const styles = StyleSheet.create({
  box: {
    height: 180,
    maxHeight: 80, // Always caps height to 80, regardless of parent scroll context
    backgroundColor: 'lightblue',
    margin: 8
  }
});
```

### The Difference in Flutter
Flutter uses `LimitedBox` for a very specific layout optimization scenario that does not exist in React Native's CSS-based layout model.

In Flutter:
1. When a widget is inside a scrollable layout like a `ListView` or `SingleChildScrollView`, the parent passes down **infinite constraints** along the scroll axis (i.e. `maxHeight: double.infinity`).
2. If a child widget attempts to expand or fill space (e.g. `SizedBox(height: double.infinity)` or a container without constraints), Flutter throws a layout exception because it cannot render a widget with infinite size.
3. `LimitedBox` provides a **conditional limit**. It caps the child's size *only* if the incoming constraint is infinite. If the incoming constraint is finite (e.g., the widget is rendered inside a regular `Container(height: 200)`), the `LimitedBox` is completely ignored, and the widget behaves normally.

This allows developers to build flexible widgets that size themselves dynamically when constrained, but gracefully fallback to a safe limit when placed inside scroll views.
''';
