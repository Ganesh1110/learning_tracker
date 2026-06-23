const String iconRnEquivalent = r'''
In React Native, rendering vector icons is not supported out of the box by the core framework.

Developers rely on the popular third-party package `react-native-vector-icons` to load vector glyphs. This requires linking custom font files (.ttf) in the native iOS plist and Android gradle files during installation.

```jsx
// React Native - Importing third-party vector icons:
import React from 'react';
import { View, StyleSheet } from 'react-native';
import Icon from 'react-native-vector-icons/MaterialIcons';

const IconExample = () => (
  <View style={styles.container}>
    <Icon name="star" size={30} color="#900" />
  </View>
);

const styles = StyleSheet.create({
  container: { padding: 16 }
});
```

### The Difference in Flutter
In Flutter, rendering typography glyph vector icons is built directly into the core framework.

Key details:
1. **Material Design Icons**: Flutter bundles the official Material Design Icons font by default. You enable it in `pubspec.yaml` using:
   ```yaml
   flutter:
     uses-material-design: true
   ```
2. **Icon Widget**: To render an icon, you instantiate the core `Icon` widget, passing an `IconData` instance resolved from the static `Icons` class:
   ```dart
   Icon(
     Icons.star, // IconData representing the character code
     size: 30.0,
     color: Colors.red,
   )
   ```
3. **No Native Setup**: Because Flutter compiles vector font icons directly into its rendering engine, you do not need to touch plist or gradle configurations to add, update, or package icons.
''';
