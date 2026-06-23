const String defaultTextStyleRnEquivalent = r'''
In React Native, text style inheritance only occurs when nesting `<Text>` components inside other `<Text>` components. Style properties do not inherit down from `<View>` containers or any other layouts.

```jsx
// React Native nested text inheritance:
import React from 'react';
import { Text, View, StyleSheet } from 'react-native';

const NestedTextDemo = () => (
  <View style={styles.container}>
    {/* Style propagates only down nested Text elements */}
    <Text style={styles.baseText}>
      I am blue and 18px.
      <Text style={styles.boldText}> I am blue, 18px AND bold.</Text>
    </Text>
  </View>
);

const styles = StyleSheet.create({
  container: {
    padding: 16,
  },
  baseText: {
    color: 'blue',
    fontSize: 18,
  },
  boldText: {
    fontWeight: 'bold', // inherits color and fontSize
  },
});
```

### The Difference in Flutter
In Flutter, the `DefaultTextStyle` widget uses context-based inheritance (`InheritedWidget`). This means text style propagates down through any layouts (like `Column`, `Row`, or custom widgets) to all descendant `Text` widgets:

```dart
DefaultTextStyle(
  style: TextStyle(fontSize: 18.0, color: Colors.blue),
  child: Column(
    children: [
      Text('I am blue and 18px'), // Inherits style
      Text('Me too!'), // Inherits style
    ],
  ),
)
```

To modify or override inherited styles in child components, a child `Text` widget can specify its own `style` parameter. You can also merge styles using `DefaultTextStyle.of(context).style.merge(localStyle)`.
''';
