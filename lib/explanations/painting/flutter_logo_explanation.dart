const String flutterLogoRnEquivalent = r'''
In React Native, there is no built-in icon or asset representing the React Native logo. If you need to render the brand mark, you must download the SVG or PNG asset and load it via `<Image>` or a library like `react-native-svg`.

```jsx
// React Native - Importing and rendering custom logo:
import React from 'react';
import { View, Image, StyleSheet } from 'react-native';

const CustomBrandLogo = () => (
  <View style={styles.container}>
    <Image
      source={require('./assets/react_native_logo.png')}
      style={styles.logo}
    />
  </View>
);

const styles = StyleSheet.create({
  container: { padding: 16 },
  logo: { width: 100, height: 100, resizeMode: 'contain' },
});
```

### The Difference in Flutter
Flutter provides `FlutterLogo` as a built-in widget in the core painting library. It is drawn programmatically using vectors (via paths and painters), which means it renders perfectly crisp at any resolution or zoom factor without using pixel image resource files.

Key properties:
1. **size**: Renders the canvas bounding size.
2. **style**: Sets whether to display just the icon (`markOnly`), the icon beside the text (`horizontal`), or the icon on top of the text (`stacked`).
3. **textColor**: Customizes the text label colors matching the current dark/light mode configurations.
''';
