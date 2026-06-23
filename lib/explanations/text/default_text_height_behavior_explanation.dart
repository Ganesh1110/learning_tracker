const String defaultTextHeightBehaviorRnEquivalent = r'''
In React Native, styling text height is handled simply via the `lineHeight` style property, which behaves similarly to CSS line-height.

```jsx
// React Native:
import React from 'react';
import { Text, StyleSheet } from 'react-native';

const StyledText = () => (
  <Text style={styles.paragraph}>
    In React Native, lineHeight controls the height of each line.
    However, there is no direct control over first-line ascent or last-line descent leading.
  </Text>
);

const styles = StyleSheet.create({
  paragraph: {
    fontSize: 16,
    lineHeight: 24, // Explicit line height in logical pixels
  },
});
```

### The Difference in Flutter
Flutter provides `DefaultTextHeightBehavior` to specify how the `height` multiplier of `TextStyle` distributes "leading" (the extra space added above and below characters):
1. **applyHeightToFirstAscent**: When false, removes the leading space at the very top of the first line, aligning it flush with the top container boundary.
2. **applyHeightToLastDescent**: When false, removes the leading space at the very bottom of the last line.
3. **leadingDistribution**: Configures whether the leading is divided equally above/below (`even`) or proportionally based on the font's ascent/descent (`proportional`).

This is scoping context inherited by all descendant `Text` widgets, which is highly useful for precise UI layout alignment.
''';
