const String expandedRnEquivalent = r'''
In React Native, flex-grow behavior is applied directly as a style attribute (`flex` or `flexGrow`) on child views.

```jsx
// React Native: Proportional layout using flex properties:
import React from 'react';
import { View, StyleSheet } from 'react-native';

const FlexRow = () => (
  // Parent View acts as the flex container:
  <View style={styles.container}>
    <View style={styles.fixedBox} />
    <View style={styles.expandedBox2} />
    <View style={styles.expandedBox1} />
  </View>
);

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    height: 100,
  },
  fixedBox: {
    width: 60,
    backgroundColor: 'red',
  },
  expandedBox2: {
    flex: 2, // Takes up 2 parts of remaining space (equivalent to flex: 2 in Expanded)
    backgroundColor: 'blue',
  },
  expandedBox1: {
    flex: 1, // Takes up 1 part of remaining space (equivalent to flex: 1 in Expanded)
    backgroundColor: 'green',
  },
});
```

### The Difference in Flutter
In Flutter, instead of adding layout properties directly to the styling of a widget, we wrap the widget in an `Expanded` layout widget:

```dart
Row(
  children: [
    Container(width: 60, color: Colors.red), // Fixed width
    Expanded(
      flex: 2,
      child: Container(color: Colors.blue), // Expands with factor 2
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.green), // Expands with factor 1
    ),
  ],
)
```

### Critical Rules in Flutter:
1. **Parent Constraint**: An `Expanded` widget **must** be a descendant of a `Row`, `Column`, or `Flex` widget. If you put an `Expanded` directly inside a `Container` or `Stack` without a flex container ancestor, Flutter will throw a runtime error.
2. **Flexible vs Expanded**: `Expanded` forces its child to fill all available space. If you want the child to scale but remain smaller than its maximum space if its content is small, use `Flexible` instead.
''';
