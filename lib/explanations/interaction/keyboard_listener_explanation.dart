const String keyboardListenerRnEquivalent = r'''
In React Native, because it primarily targets mobile touch screens, hardware keyboard event listeners are limited and not built into regular container Views.

### React Native Key Detection
For input fields, React Native provides basic key listener callbacks via `<TextInput>`:

```jsx
import React from 'react';
import { TextInput, View, StyleSheet } from 'react-native';

const KeyInput = () => (
  <View style={styles.container}>
    <TextInput
      placeholder="Type here..."
      onKeyPress={({ nativeEvent }) => {
        console.log('Key pressed:', nativeEvent.key); // e.g. 'Backspace', 'Enter', 'A'
      }}
      style={styles.input}
    />
  </View>
);

const styles = StyleSheet.create({
  container: { padding: 16 },
  input: { borderBottomWidth: 1, height: 40 }
});
```

However, if you need to detect global keyboard presses outside of text inputs (e.g., for gaming, keyboard shortcuts, accessibility, or desktop/web apps), React Native has **no core cross-platform API**. You must:
1. For React Native Web, register traditional browser listeners: `window.addEventListener('keydown', handler)`.
2. For React Native Desktop, use native modules or third-party packages.

### The Difference in Flutter
Because Flutter compiles natively to Desktop (Windows, macOS, Linux), Web, and Mobile, it includes direct hardware keyboard monitoring at the core framework level.

The `KeyboardListener` widget:
1. Can wrap **any** widget subtree.
2. Captures all hardware key presses and releases globally or when focused.
3. Provides access to detailed keyboard hardware properties:
   - `LogicalKeyboardKey` (the character intended, accounting for keyboard layouts).
   - `PhysicalKeyboardKey` (the actual key location on the physical board).
   - `HardwareKeyboard.instance` modifier checks (checking if Shift, Alt, Control, Command/Windows key is currently held down).
4. Integrates seamlessly with Flutter's spatial focus tree (`FocusNode` / `Focus` widgets).
''';
