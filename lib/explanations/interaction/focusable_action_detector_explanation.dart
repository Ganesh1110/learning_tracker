const String focusableActionDetectorRnEquivalent = r'''
In React Native, managing focus, hover, and keyboard shortcuts for a custom button requires hooking up multiple props on separate components:

```jsx
// React Native: Handling hover and focus on a Pressable
import React, { useState } from 'react';
import { Pressable, Text, StyleSheet } from 'react-native';

const CustomPressable = () => {
  const [hovered, setHovered] = useState(false);
  const [focused, setFocused] = useState(false);

  return (
    <Pressable
      onHoverIn={() => setHovered(true)}
      onHoverOut={() => setHovered(false)}
      onFocus={() => setFocused(true)}
      onBlur={() => setFocused(false)}
      // For keyboard shortcuts on TV or Web, you would need to hook up
      // custom platform key listeners manually.
      style={[
        styles.button,
        hovered && styles.hovered,
        focused && styles.focused,
      ]}
    >
      <Text>Custom Control</Text>
    </Pressable>
  );
};

const styles = StyleSheet.create({
  button: { padding: 12, borderWidth: 1, borderColor: 'grey' },
  hovered: { backgroundColor: '#f0f0f0' },
  focused: { borderColor: 'blue', borderWidth: 2 },
});
```

### The Difference in Flutter
Flutter provides `FocusableActionDetector` as a unified wrapper widget to declare hover states, focus states, shortcut maps, and action triggers all in one place:

1. **shortcuts & actions**: Binds physical keyboard presses (like Enter/Space) to logic commands (Intents/Actions).
2. **onShowHoverHighlight**: Fires when a mouse cursor enters or leaves the widget boundary (ideal for desktop/web).
3. **onShowFocusHighlight**: Fires when the widget gains or loses focus (ideal for TV remotes, web tabs, or accessibility engines).

This single widget combines what would otherwise require four nested wrappers (`MouseRegion`, `Focus`, `Shortcuts`, and `Actions`), making custom control development much more cohesive.
''';
