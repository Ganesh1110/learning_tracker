const String directionalityRnEquivalent = r'''
In React Native, RTL (Right-to-Left) mirroring is generally managed globally through the native bridge using `I18nManager`.

```jsx
// React Native: Enabling and checking RTL layout:
import React from 'react';
import { StyleSheet, Text, View, I18nManager } from 'react-native';

// Force RTL layout globally (requires application reload usually)
I18nManager.forceRTL(true);

const RtlExample = () => (
  // Flexbox properties like paddingStart / paddingEnd dynamically adapt to RTL
  <View style={styles.container}>
    <View style={styles.row}>
      <Text>Text direction: {I18nManager.isRTL ? 'RTL' : 'LTR'}</Text>
    </View>
  </View>
);

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 16,
  },
  row: {
    flexDirection: 'row',
    paddingStart: 20, // Becomes paddingRight in RTL
  },
});
```

### The Difference in Flutter
Flutter uses the `Directionality` widget to pass writing direction down the widget tree dynamically. It does not require a full application reload or global native state modification.

Instead of global variables, layout widgets dynamically query `Directionality.of(context)` to decide their rendering:
1. **Row & Wrap**: Order children from left-to-right (`TextDirection.ltr`) or right-to-left (`TextDirection.rtl`).
2. **AlignmentDirectional & EdgeInsetsDirectional**: Resolve `start` and `end` offsets dynamically depending on the resolved text direction of the nearest `Directionality` ancestor.

This allows developers to mock, preview, or scope RTL layouts on specific widgets or subtrees independently of the rest of the application.
''';
