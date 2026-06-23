const String focusRnEquivalent = r'''
In React Native, focus management is primarily limited to input fields (`TextInput`) using references (`refs`) to manually call methods like `inputRef.current.focus()`.

```jsx
// React Native - Shifting input focus:
import React, { useRef } from 'react';
import { View, TextInput, Button, StyleSheet } from 'react-native';

const FocusExample = () => {
  const secondInputRef = useRef(null);

  return (
    <View style={styles.container}>
      <TextInput placeholder="First Input" returnKeyType="next" onSubmitEditing={() => secondInputRef.current.focus()} />
      <TextInput ref={secondInputRef} placeholder="Second Input" />
    </View>
  );
};

const styles = StyleSheet.create({
  container: { padding: 16 },
});
```

For web and TV platform development, React Native implements `focusable={true}` and `hasTVPreferredFocus={true}` properties on `<Pressable>` or `<View>` elements. However, React Native lacks a unified cross-platform focus traversal model out of the box.

### The Difference in Flutter
Flutter incorporates a complete focus tree framework via the `Focus` and `FocusScope` widgets. It goes far beyond text fields, allowing **any** widget to receive focus:

1. **FocusNode**: Represents a focusable node in the widget hierarchy.
2. **Focus**: A widget that manages a FocusNode and notifies descendants of focus changes (`Focus.of(context).hasFocus`).
3. **FocusScope**: Groups focus nodes together to restrict keyboard navigation bounds (e.g. inside a modal popup).

This robust system routes keyboard inputs, handles directional navigation (D-pad/arrow keys on TV or Desktop), and lets you build custom highlight components seamlessly.
''';
