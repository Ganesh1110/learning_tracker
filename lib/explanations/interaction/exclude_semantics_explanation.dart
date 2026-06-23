const String excludeSemanticsRnEquivalent = r'''
In React Native, hiding a widget tree or component from the screen reader accessibility tree is achieved using platform-specific properties:

1. **iOS**: Use `accessibilityElementsHidden={true}` to hide the view and all its children.
2. **Android**: Use `importantForAccessibility="no-hide-descendants"` to hide the view and its children.
3. **General**: Setting `accessible={false}` tells the OS that the container itself is not an accessibility element, but individual children might still be read unless hidden.

```jsx
// React Native: Exclude subtree from Screen Reader:
import React from 'react';
import { View, Text, StyleSheet } from 'react-native';

const HiddenSubtree = () => (
  <View style={styles.container}>
    {/* This entire row is hidden from accessibility engines */}
    <View
      accessible={false}
      accessibilityElementsHidden={true} // iOS
      importantForAccessibility="no-hide-descendants" // Android
      style={styles.badgeRow}
    >
      <Text style={styles.icon}>⭐</Text>
      <Text style={styles.label}>Premium Rating</Text>
    </View>
    
    <Text>This text is still readable by the screen reader.</Text>
  </View>
);

const styles = StyleSheet.create({
  container: { padding: 16 },
  badgeRow: { flexDirection: 'row' },
  icon: { marginRight: 8 },
  label: { color: 'grey' }
});
```

### The Difference in Flutter
Flutter provides the `ExcludeSemantics` widget. Setting its `excluding` property to `true` completely drops all accessibility tags (labels, roles, values, and traits) for its entire subtree.

Accessibility readers (TalkBack on Android, VoiceOver on iOS) will bypass the child tree entirely, treating it as empty whitespace. This is useful for:
- Hiding decorative icons, ratings, or layouts that have no structural importance for screen readers.
- Hiding background sheets or obscured panels that should not receive focus while a dialog is active.
''';
