const String ignorePointerRnEquivalent = r'''
In React Native, controlling whether a layout container and its children receive pointer/touch events is handled using the `pointerEvents` prop on `<View>` containers:

```jsx
// React Native: Disabling touch inputs using pointerEvents:
import React from 'react';
import { View, Button, Text, StyleSheet } from 'react-native';

const TouchSandbox = () => (
  <View style={styles.container}>
    {/* Setting pointerEvents="none" makes the entire container
        and its children invisible to touch gestures.
        Tapping the button does nothing; touches pass through. */}
    <View pointerEvents="none" style={styles.layer}>
      <Button title="Click Me" onPress={() => console.log('Click!')} />
    </View>
  </View>
);

const styles = StyleSheet.create({
  container: { flex: 1 },
  layer: { padding: 16, backgroundColor: '#eee' },
});
```

The `pointerEvents` prop supports:
- `auto`: Default touch behaviors.
- `none`: Completely ignores touches (passes through to elements behind).
- `box-none`: The container ignores touches, but its children can still receive them.
- `box-only`: The container intercepts touches, but children cannot receive them.

### The Difference in Flutter
Flutter splits these behaviors into two specialized widgets:

1. **IgnorePointer**:
   - Setting `ignoring` to `true` makes the child tree invisible to hit-testing (equivalent to `pointerEvents="none"`).
   - Touch events pass directly *through* the widget, activating whatever interactive elements are positioned beneath or behind it in a Stack.

2. **AbsorbPointer**:
   - Setting `absorbing` to `true` also blocks children touches.
   - However, it *absorbs* the touch event itself instead of letting it pass through. Elements physically positioned behind it will NOT receive the touch.

This makes `IgnorePointer` the ideal choice for temporarily disabling sections of a screen (like loading overlays) while still letting users interact with backgrounds, or for disabling form elements during submissions.
''';
