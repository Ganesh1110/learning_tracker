const String actionRnEquivalent = r'''
In React Native, keyboard shortcuts or custom command dispatching are typically handled using direct event listeners or package dependencies (such as `react-native-key-event` for keyboard listener bindings on desktop/TV platforms).

```jsx
// React Native Desktop / Web equivalent pattern:
import React, { useEffect } from 'react';
import { View, Text } from 'react-native';

const ShortcutListener = ({ onSave }) => {
  useEffect(() => {
    const handleKeyDown = (event) => {
      // Check for command/ctrl + S key combination
      if ((event.metaKey || event.ctrlKey) && event.key === 's') {
        event.preventDefault();
        onSave(); // Trigger save action
      }
    };
    
    // Bind to window/document in RN Web or native keyboard listeners
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  }, [onSave]);

  return (
    <View>
      <Text>Press Ctrl+S to trigger the action</Text>
    </View>
  );
};
```

In Flutter, key event handling is decoupled into three layers:
1. **Shortcuts**: Maps physical key presses to an `Intent` (e.g. `Ctrl+S` maps to `SaveIntent`).
2. **Intent**: A semantic representation of a user action (e.g., `SaveIntent`).
3. **Action**: The actual command executed in response to the intent (e.g., `SaveAction` which extends `Action<SaveIntent>`).

This decoupling allows you to define shortcut keys globally, but swap the execution logic (`Action`) dynamically based on which widget is currently focused.
''';
