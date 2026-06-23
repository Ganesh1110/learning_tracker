const String fittedBoxRnEquivalent = r'''
In React Native, layout scaling attributes (like fit, cover, or stretch) are only natively supported on the `<Image>` component via the `resizeMode` property.

```jsx
// React Native - Fitting an image:
import React from 'react';
import { Image, View, StyleSheet } from 'react-native';

const ImageFit = () => (
  <View style={styles.container}>
    <Image
      source={{ uri: 'https://example.com/logo.png' }}
      resizeMode="contain" // options: contain, cover, stretch, center, repeat
      style={styles.image}
    />
  </View>
);

const styles = StyleSheet.create({
  container: { width: 100, height: 100 },
  image: { width: '100%', height: '100%' },
});
```

However, if you want to scale a complex layout structure (e.g., text, labels, and icons) to automatically shrink or scale up to fit exactly inside a small card or header without wrapping or overflowing, React Native does not have a native layout wrapper. You would have to calculate font sizes dynamically or use SVG wrappers.

### The Difference in Flutter
Flutter provides `FittedBox`, which works on **any** child widget (not just images). 

During the layout phase:
1. `FittedBox` lets its child size itself naturally with no constraints.
2. It measures the resulting child dimensions.
3. It applies a paint-phase scale-and-translation matrix to scale the entire child layout up or down to fit within the `FittedBox`'s parent constraints according to the selected `BoxFit` mode.

This is highly useful for fitting dynamic length user names inside profile badges, banner headings, or resizing buttons to fit layout widths.
''';
