const String defaultTextEditingShortcutsRnEquivalent = r'''
In React Native, text editing components (`<TextInput>`) natively consume OS-level text editing shortcuts (like Command+A to select all, Command+C to copy, Command+V to paste, or Command+Z to undo) out-of-the-box on both mobile (iOS/Android) and desktop/web wrappers. However, customizing or trapping these shortcut actions dynamically requires native key event listeners.

Here is how you handle custom key shortcut events in React Native:

```jsx
// React Native:
import React, { useRef } from 'react';
import { View, TextInput, StyleSheet } from 'react-native';

const TextInputShortcutsExample = () => {
  const inputRef = useRef(null);

  const handleKeyPress = (e) => {
    const key = e.nativeEvent.key;
    
    // Check if key modifiers are pressed (only available on web/desktop wrappers)
    if (e.nativeEvent.metaKey || e.nativeEvent.ctrlKey) {
      if (key === 'a' || key === 'A') {
        console.log('Select All key command captured.');
      }
    }
  };

  return (
    <View style={styles.container}>
      <TextInput
        ref={inputRef}
        style={styles.input}
        onKeyPress={handleKeyPress} // Capture keyboard key presses
        placeholder="Type something..."
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { padding: 16, flex: 1, justifyContent: 'center' },
  input: { height: 40, borderColor: '#ccc', borderWidth: 1, borderRadius: 8, paddingHorizontal: 8 }
});
```

### Key Differences
1. **Implicit Platform Mapping vs Configurable Intent System**:
   - **React Native**: Keyboard shortcuts in `<TextInput>` are mapped implicitly by the underlying native platform text field (e.g. Android's EditText or iOS's UITextField). There is no core API to easily intercept, disable, or redirect standard commands (like mapping Ctrl+D to delete a line) on the JS thread without writing custom native text input modules.
   - **Flutter**: Flutter uses a declarative **Intent** and **Action** architecture. **`DefaultTextEditingShortcuts`** defines a map that binds specific physical key combinations to editing intents (e.g., `CopySelectionTextIntent`, `DeleteToBeginningOfLineIntent`). Child text inputs catch these key commands, resolve the bound intent, and trigger the corresponding editing action.

2. **Customizability**:
   - Flutter allows overriding editing behaviors programmatically by nesting a custom `Shortcuts` or `Actions` widget below or above `DefaultTextEditingShortcuts` to redefine or disable specific shortcut actions (for example, disabling copy-paste in security-sensitive inputs) universally for a sub-tree.
''';
