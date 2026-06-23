const String defaultSelectionStyleRnEquivalent = r'''
In React Native, styling text selection highlights and text cursors is handled on a component-by-component basis. Both the `<TextInput>` and `<Text>` (on iOS) components support a `selectionColor` style/prop that overrides the cursor and selection background color.

Here is how you customize text highlights in React Native:

```jsx
// React Native:
import React from 'react';
import { View, TextInput, StyleSheet } from 'react-native';

const CustomSelectionExample = () => {
  return (
    <View style={styles.container}>
      {/* Individual Custom Input Highlight */}
      <TextInput
        style={styles.input}
        selectionColor="teal" // Sets cursor and selection background to teal
        placeholder="Type here..."
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { padding: 16, flex: 1, justifyContent: 'center' },
  input: {
    height: 40,
    borderColor: '#ccc',
    borderWidth: 1,
    paddingHorizontal: 8,
    borderRadius: 8
  }
});
```

### Key Differences
1. **Scoped Inheritance Boundary vs Individual Properties**:
   - **React Native**: There is no concept of a selection theme context provider that automatically propagates selection highlight colors down a sub-tree of components. You must pass `selectionColor="teal"` to every single `<TextInput>` and selectable `<Text>` individually, or build a custom text component wrapper.
   - **Flutter**: Flutter provides **`DefaultSelectionStyle`**, an inherited widget that defines selection and cursor highlight styles for a whole sub-tree of selectable items. Any child widget (e.g. `SelectableText`, `TextField`, `EditableText`) resolves the styling values dynamically from the build context boundary.

2. **Customizing cursor vs selection highlights independently**:
   - **React Native**: The `selectionColor` property overrides both the text cursor color and the drag selection highlights simultaneously. You cannot set the selection highlight background color to teal while maintaining a red cursor.
   - **Flutter**: `DefaultSelectionStyle` provides distinct properties for `selectionColor` (the background highlight) and `cursorColor` (the blinking text insertion point), allowing for finer-grained design customizations.
''';
