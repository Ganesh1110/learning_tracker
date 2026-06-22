const String callbackShortcutsRnEquivalent = r'''
In React Native, catching keyboard events and physical shortcut key combinations (essential for iPad overlays, TV apps, Chromebooks, and desktop web targets) requires utilizing third-party libraries like `react-native-key-event` on mobile, or standard web handlers on React Native Web.

```jsx
// React Native (using web event listeners or React Native Web):
import React, { useEffect, useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';

const KeyboardShortcutExample = () => {
  const [count, setCount] = useState(0);

  useEffect(() => {
    const handleKeyDown = (event) => {
      // Check for key presses
      if (event.key === 'i' || event.key === 'I') {
        setCount(prev => prev + 1);
      } else if (event.key === 'd' || event.key === 'D') {
        setCount(prev => prev - 1);
      } else if (event.key === 'r' || event.key === 'R') {
        setCount(0);
      }
    };

    // Register web listener
    window.addEventListener('keydown', handleKeyDown);

    // Clean up on unmount
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.text}>Counter: {count}</Text>
    </View>
  );
};
```

### Key Differences
1. **Simplified Shortcut Binding vs. Custom Event Listeners**:
   - **React Native**: Developers typically set up custom imperative event listeners (like `window.addEventListener` or native keyboard emitters) and write nested `switch` or `if` statements to parse event keyCodes and execute callbacks.
   - **Flutter**: Provides **`CallbackShortcuts`**, which takes a clean, declarative map of `ShortcutActivator` keys (like `SingleActivator(LogicalKeyboardKey.keyI)`) to callback functions (`VoidCallback`). It matches and dispatches the keys behind the scenes cleanly.

2. **Shortcuts & Actions vs. CallbackShortcuts**:
   - Flutter has two keyboard shortcut systems. For complex apps, it uses a full decoulped system (`Shortcuts` + `Actions` + `Intents`). 
   - For simple use cases where you just want to run an inline callback directly in response to a key press, **`CallbackShortcuts`** bypasses the need to declare explicit `Intent` classes and `Action` handlers, making implementation fast and clean.

3. **Focus Requirements**:
   - In both Flutter and React Native, keyboard shortcuts require that the surrounding layout container currently has input/active focus to receive hardware keyboard events from the platform window thread.
''';
