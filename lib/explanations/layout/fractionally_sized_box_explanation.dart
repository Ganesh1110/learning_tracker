const String fractionallySizedBoxRnEquivalent = r'''
In React Native, sizing a component as a percentage fraction of its parent container is handled simply using percentage strings inside stylesheet attributes:

```jsx
// React Native: Percentage sizing layout:
import React from 'react';
import { View, StyleSheet } from 'react-native';

const PercentageBox = () => (
  // Parent container (200x200)
  <View style={styles.parent}>
    {/* Child box:
        - Occupies 70% of parent width
        - Occupies 50% of parent height */}
    <View style={styles.child} />
  </View>
);

const styles = StyleSheet.create({
  parent: {
    width: 200,
    height: 200,
    backgroundColor: '#eee',
    // Alignment is set on the parent layout:
    justifyContent: 'center',
    alignItems: 'center',
  },
  child: {
    width: '70%',
    height: '50%',
    backgroundColor: 'blue',
  },
});
```

### The Difference in Flutter
Flutter does not support percentage strings directly on width/height sizing parameters. Instead, percentage layouts are accomplished using the `FractionallySizedBox` widget:

```dart
Container(
  width: 200,
  height: 200,
  child: FractionallySizedBox(
    widthFactor: 0.7,  // 70% of parent width
    heightFactor: 0.5, // 50% of parent height
    alignment: Alignment.center,
    child: Container(color: Colors.blue),
  ),
)
```

Key features:
1. **Factors**: `widthFactor` and `heightFactor` accept double values (from `0.0` to `1.0`). If a factor is omitted, the child will size to fill the full space along that axis.
2. **Alignment**: The `alignment` parameter resides on the wrapper widget itself (unlike React Native where parent flex alignment dictates child positioning), giving you localized control over where the child widget aligns.
''';
